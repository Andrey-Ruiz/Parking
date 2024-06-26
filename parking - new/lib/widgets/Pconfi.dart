import 'package:flutter/material.dart';
import 'package:parking/widgets/CustomerDrawer.dart';
import 'package:parking/data/Data.dart';
import 'package:parking/models/Autoriza.dart';
import 'package:parking/widgets/CameraAdmon.dart';

class Pconfi extends StatefulWidget {
  const Pconfi({super.key, required this.text});
  final String text;
  static const String nombre = 'Pconfi';

  State<Pconfi> createState() => _PconfiState();
}

class _PconfiState extends State<Pconfi> {
  final TextEditingController _placaController = TextEditingController();
  List<Autoriza> autorizaList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(65.0), // Define la altura deseada del AppBar
          child: AppBar(
            actions: [
              Container(
                margin: const EdgeInsets.only(right: 16.0),
                child: const Icon(
                  Icons.account_circle,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
            ],
            flexibleSpace: Container(
              decoration: BoxDecoration(
                color: Color(0xffdd45f5), // Cambia el color de fondo del AppBar
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(
                      20.0), // Redondea el borde inferior izquierdo
                  bottomRight: Radius.circular(
                      20.0), // Redondea el borde inferior derecho
                ),
              ),
            ),
          )),
      drawer: const CustomerDrawer(),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xffdcdbdb),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 230,
                            child: TextField(
                              controller: _placaController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                labelText: '',
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'Nombre del responsable',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabled: false,
                            filled: true,
                            fillColor: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'Saldo pendiente',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabled: false,
                            filled: true,
                            fillColor: Colors.white),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xffdcdbdb),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 200,
                        width: 350,
                        child: ListView.builder(
                            itemCount: autorizaList.length,
                            itemBuilder: (context, index) {
                              return Card(
                                  color: Color(0xffdd45f5),
                                  child: ListTile(
                                    title: Text(
                                        'ID: ${autorizaList[index].guest[0].idV}'),
                                    subtitle: Text(
                                        'Nombre: ${autorizaList[index].guest[0].nameV}'),
                                  ));
                            }),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  child: Text('Confirmar ingreso'),
                  onPressed: () {},
                )
              ],
            ),
            Positioned(
                top: 45,
                right: 40,
                child: IconButton(
                  icon: Icon(Icons.camera_alt_outlined,
                      color: Color(0xffdd45f5), size: 30.0),
                  onPressed: () {
                    // Agrega aquí la lógica para manejar el botón de la cámara
                  },
                )),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 60.0,
        child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                  20.0), // Redondea los bordes superiores izquierdos
              topRight: Radius.circular(
                  20.0), // Redondea los bordes superiores derechos
            ),
            child: BottomAppBar(
              color: Color(0xffdd45f5),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    IconButton(
                        icon: Icon(Icons.edit, color: Colors.white, size: 30.0),
                        onPressed: () {}),
                    IconButton(
                        icon: Icon(Icons.directions_car,
                            color: Colors.white, size: 30.0),
                        onPressed: () {}),
                    IconButton(
                        icon: Icon(Icons.credit_card,
                            color: Colors.white, size: 30.0),
                        onPressed: () {}),
                  ]),
            )),
      ),
    );
  }
}
