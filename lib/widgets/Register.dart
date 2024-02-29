import 'package:flutter/material.dart';
import 'package:parking/Widgets/CustomerDrawer.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.purple, //color
        title: const Text(''),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: const Icon(Icons.account_circle, color: Colors.white),
          ),
        ],
      ),
      drawer: const CustomerDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 30.0,
            ),
            // CONTAINER DOC, NOM, CELL
            const Padding(
              padding: EdgeInsets.only(left: 30.0, bottom: 5),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('N. Documento', style: TextStyle(fontSize: 15)),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30),
              //saldo cartera
              child: TextField(
                enabled: false,
                controller:
                    TextEditingController(text: 'Documento de identidad'),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 7.0,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30.0, bottom: 5),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Nombres y apellidos:',
                    style: TextStyle(fontSize: 15)),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30),
              //saldo cartera
              child: TextField(
                enabled: false,
                controller: TextEditingController(text: 'persona autorizada'),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 7.0,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30.0, bottom: 5),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('No. Celular', style: TextStyle(fontSize: 15)),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30),
              //saldo cartera
              child: TextField(
                enabled: false,
                controller: TextEditingController(text: 'Celular'),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15.0,
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
                items: list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(
              height: 7.0,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30.0, bottom: 5),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Apartamento', style: TextStyle(fontSize: 15)),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30),
              //saldo cartera
              child: TextField(
                enabled: false,
                controller: TextEditingController(text: '# apto'),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 7.0,
            ),
            const Text(
              'Verificar placa autorizar',
              style: TextStyle(fontSize: 15),
            ),

            Row(
              children: [
                IconButton(
                  padding: const EdgeInsets.only(left: 30,),
                  icon: const Icon(Icons.camera, size: 30, color: Colors.grey),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => registration()));
                  },
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 30,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Verificar Placa  Autorizar',
                        style: TextStyle(fontSize: 15, color: Colors.grey)),
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 7.0,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30.0, bottom: 5),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Placa', style: TextStyle(fontSize: 15)),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30),
              //saldo cartera
              child: TextField(
                enabled: false,
                controller: TextEditingController(text: 'placa vehiculo'),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 7.0,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30.0, bottom: 5),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Fecha limite de pago',
                    style: TextStyle(fontSize: 15)),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30),
              //saldo cartera
              child: TextField(
                enabled: false,
                controller: TextEditingController(text: 'fecha pago'),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
             },
              child: const Text("REGISTRAR"),
            )
          ],
        ),
      ),
    );
  }
}
