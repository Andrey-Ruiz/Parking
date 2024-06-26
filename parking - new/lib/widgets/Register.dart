import 'package:flutter/material.dart';
import 'package:parking/widgets/CustomerDrawer.dart';
import 'package:parking/widgets/registration.dart';

const List<String> list = <String>[
  'Seleccione la torre',
  'TORRE 1',
  'TORRE 2',
  'TORRE 3'
];
String dropdownValue = list.first;

class Register extends StatefulWidget {
  const Register({super.key, required this.textv});
  final String textv;

  static const String nombre = 'Regi';

  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool estado = false;

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
            Column(children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Color(0xffdcdbdb),
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: EdgeInsets.all(20.0),
                padding: EdgeInsets.all(20.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Row(children: <Widget>[
                        SizedBox(
                          width: 230,
                          child: TextField(
                            decoration: InputDecoration(
                                labelText: 'Placa',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                enabled: false,
                                filled: true,
                                fillColor: Colors.white),
                          ),
                        ),
                      ]),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'Documento de identidad',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabled: true,
                            filled: true,
                            fillColor: Colors.white),
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
                            enabled: true,
                            filled: true,
                            fillColor: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'Celular',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabled: true,
                            filled: true,
                            fillColor: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'Mail',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabled: true,
                            filled: true,
                            fillColor: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 370,
                        child: DropdownButton<String>(
                          value: dropdownValue,
                          icon: const Icon(Icons.arrow_downward),
                          elevation: 16,
                          style: const TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 2,
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (String? value) {
                            // This is called when the user selects an item.
                            setState(() {
                              dropdownValue = value!;
                            });
                          },
                          items: list
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'Apartamento',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabled: true,
                            filled: true,
                            fillColor: Colors.white),
                      ),
                    ]),
              ),
              ElevatedButton(
                child: Text('Confirmar ingreso'),
                onPressed: () {},
              )
            ]),
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
