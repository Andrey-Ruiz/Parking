import 'package:flutter/material.dart';
import 'package:parking/Widgets/CustomerDrawer.dart';
import 'package:parking/data/Data.dart';
import 'package:parking/Guardado/Autoriza.dart';
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
      body: Column(
        children: [
          const SizedBox(height: 10,),
          Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0x95313131),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CameraAdmon()));
                    },
                    icon: Icon(
                      Icons.camera,
                      size: 80.0,
                    ))),
          const Padding(
            padding: EdgeInsets.only(left: 30.0, bottom: 5),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('No. Placa Vehículo Autorizado:',
                  style: TextStyle(fontSize: 15)),
            ),
          ),
          Container(
        height: 50,
              width: 350,
              alignment: Alignment.center,
              child: Material(
                elevation: 8.0,
                shadowColor: const Color.fromARGB(255, 174, 176, 177),
                child: TextField(
                  controller: _placaController,                                    
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: false,
                      labelText: '',
                      contentPadding: EdgeInsets.only(left: 20.0)),
                  textAlign: TextAlign.center,
                ),
              ),
          ),
          const SizedBox(height: 10.0),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
            ),
            child: Text('Buscar'),
            onPressed: () {
              String placaBuscada = _placaController.text;
              List<Autoriza> filteredList = autoriza
                  .where((autoriza) => autoriza.placa == placaBuscada)
                  .toList();
              setState(() {
                autorizaList = filteredList;
              });
            },
          ),
          SizedBox(height: 16.0),
          Container(
            height: 200,
            width: 350,
            child: ListView.builder(
                itemCount: autorizaList.length,
                itemBuilder: (context, index) {
                  return Card(
                      color: Color.fromARGB(255, 225, 52, 231),
                      child: ListTile(
                        title: Text('ID: ${autorizaList[index].guest[0].idV}'),
                        subtitle: Text(
                            'Nombre: ${autorizaList[index].guest[0].nameV}'),
                      ));
                }),
          ),
          SizedBox(height: 8.0),
          const Padding(
            padding: EdgeInsets.only(left: 30.0, bottom: 5),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Saldo  Cartera:', style: TextStyle(fontSize: 15)),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 30, right: 30),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Saldo Pendiente',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          Container(
            //boton de inico
            margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
              ),
              child:
                  const Text('Ingresar', style: TextStyle(color: Colors.white)),
            ),
          )
        ],
      ),
    );
  }
}
