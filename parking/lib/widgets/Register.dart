import 'package:flutter/material.dart';
import 'package:parking/Models/Propietario.dart';
import 'package:parking/Provider/Propietario_Provider.dart';

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
  final PropietarioProvider propietarioProvider = PropietarioProvider();
  List<Propietario> owners = [];
  Propietario? selectedOwner;
  late TextEditingController _documentController = TextEditingController();
  late TextEditingController _namesController = TextEditingController();
  late TextEditingController _aptoController = TextEditingController();
  late TextEditingController _nombreController = TextEditingController();
  String _mensaje = '';

  @override
  void initState() {
    super.initState();
    loadOwners();
  }

  Future<void> loadOwners() async {
    try {
      final loadedOwners = await PropietarioProvider().getPropietario();
      setState(() {
        owners = loadedOwners;
      });
    } catch (e) {
      print('Error al cargar propietarios: $e');
    }
  }

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
                child: Text('N.Documento', style: TextStyle(fontSize: 15)),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30),
              //saldo cartera
              child: TextField(
                enabled: true,
                controller: _documentController,
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
                enabled: true,
                controller: _namesController,
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
                enabled: true,
                controller: _aptoController,
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
                enabled: true,
                controller: TextEditingController(text: ''),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                _registrarPropietario();
              },
              child: const Text("REGISTRAR"),
            ),
            const SizedBox(
              height: 7.0,
            ),
            TextField(
              controller: _nombreController,
              decoration: InputDecoration(labelText: 'Nombre del Propietario'),
            ),
            const SizedBox(
              height: 7.0,
            ),
            ElevatedButton(
              onPressed: () {
                _eliminarPropietario();
              },
              child: Text('Eliminar'),
            ),
            const SizedBox(
              height: 7.0,
            ),
            Text(_mensaje, style: TextStyle(fontSize: 18.0, color: Colors.red)),
          ],
        ),
      ),
    );
  }

  void _registrarPropietario() {
    // Aquí obtenemos los valores de los cuadros de texto
    String documentNumber = _documentController.text;
    String names = _namesController.text;
    String apto = _aptoController.text;

    // Aquí llamamos a la función del provider para crear al propietario
    propietarioProvider.crearpropietario(Propietario(
      id: documentNumber,
      name: names,
      apto: apto,
      torre: dropdownValue,
      idconjunto: '',
    ));
  }

  void _eliminarPropietario() async {
    final nombre = _nombreController.text;

    if (nombre.isNotEmpty) {
      final propietarioProvider = PropietarioProvider();

      final resultado = await propietarioProvider.borrarPropietario(nombre);

      setState(() {
        _mensaje = resultado == 1
            ? 'Propietario eliminado con éxito.'
            : 'No se encontró al propietario.';
      });
    } else {
      setState(() {
        _mensaje = 'Por favor, ingresa el nombre del propietario.';
      });
    }
  }
}
