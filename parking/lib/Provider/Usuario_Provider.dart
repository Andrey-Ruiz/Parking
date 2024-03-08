import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:parking/Models/Usuario.dart';

class UsuarioProvider {
  final String _endpoint = "https://dbpark-767b1-default-rtdb.firebaseio.com";

  Future<bool> crearusuario(Usuario user) async {
    try {
      final url = '$_endpoint/parking/user/iduser.json';
      final resp = await http.post(
        Uri.parse(url),
        body: usuarioToJson(user),
      );

      if (resp.statusCode == 200) {
        final decodeData = jsonDecode(resp.body);
        print(decodeData);
        return true;
      } else {
        throw Exception("Ocurrio Algo ${resp.statusCode}");
      }
    } catch (e) {
      print(e);
      return false;
      //throw Exception("Ocurrio Algo ${resp.statusCode}");
    }
  }

  Future<List<Usuario>> getUser() async {
    final url = '$_endpoint/parking/user/iduser.json';
    final resp = await http.get(Uri.parse(url));

    if (resp.statusCode == 200) {
      String body = utf8.decode(resp.bodyBytes);
      final jsonData = jsonDecode(body);
      final user = User.fromJsonList(jsonData);
      return user.items;
    } else {
      throw Exception("Ocurrio Algo ${resp.statusCode}");
    }
  }

  Future<bool> updateusuario(Usuario user) async {
    try {
      final url = '$_endpoint/parking/user/iduser/${user.id}.json';
      final resp = await http.post(
        Uri.parse(url),
        body: usuarioToJson(user),
      );

      if (resp.statusCode == 200) {
        final decodeData = jsonDecode(resp.body);
        print(decodeData);
        return true;
      } else {
        throw Exception("Ocurrio Algo ${resp.statusCode}");
      }
    } catch (e) {
      print(e);
      return false;
      //throw Exception("Ocurrio Algo ${resp.statusCode}");
    }
  }

  Future<int> borrarUser(String id) async {
    try {
      final url = '$_endpoint/parking/user/iduser/$id.json';
      final resp = await http.delete(Uri.parse(url));

      if (resp.statusCode == 200) {
        final decodeData = jsonDecode(resp.body);
        print(decodeData);
        return 1;
      } else {
        throw Exception("Ocurrio Algo ${resp.statusCode}");
      }
    } catch (e) {
      print(e);
      return 0;
      //throw Exception("Ocurrio Algo ${resp.statusCode}");
    }
  }
}
