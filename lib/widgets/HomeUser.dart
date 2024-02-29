// ignore_for_file: prefer_const_constructors, annotate_overrides

import 'package:flutter/material.dart';
import 'package:parking/Localstorage/Sharepreference.dart';
import 'package:parking/Widgets/CustomerDrawer.dart';
import 'package:parking/widgets/CreateVisitor.dart';
import 'package:parking/widgets/paymentpage.dart';

class HomeUser extends StatefulWidget {
  const HomeUser({super.key});
  static const String nombre = 'Home_U';

  State<HomeUser> createState() => _HomeUserState();
}

class _HomeUserState extends State<HomeUser> {
  bool estado = false;
  final prefs = PrefernciaUsuario();

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
          Padding(
            padding: EdgeInsets.only(left: 350),
            child: Icon(
              Icons.notifications,
              color: Colors.grey,
              size: 30,
            ),
          ),
          SizedBox(
            height: 150.0,
            child: PageView(
              children: [
                Padding(
                    padding: EdgeInsets.only(right: 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/propaganda1.jpg'),
                                fit: BoxFit.cover)),
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.only(right: 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/fondo_p.jpg'),
                                fit: BoxFit.cover)),
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.only(right: 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/propaganda2.jpg'),
                                fit: BoxFit.cover)),
                      ),
                    )),
              ],
            ), //separador invisible
          ),
          const SizedBox(height: 15.0),
          const Padding(
            padding: EdgeInsets.only(left: 30.0, bottom: 5),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Conjunto monarca', style: TextStyle(fontSize: 20)),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30.0, bottom: 5),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Cl. 110 #43 - 331, Barranquilla, Atlántico.',
                  style: TextStyle(fontSize: 15)),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30.0, bottom: 5),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Telefono: (605) 3640000',
                  style: TextStyle(fontSize: 15)),
            ),
          ),
          Container(
            //primera division
            margin: const EdgeInsets.only(left: 30, right: 30),
            child: const Divider(
              color: Colors.black,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30.0, bottom: 5),
            child: Align(
              alignment: Alignment.centerLeft,
              child:
                  Text('Pendiente por Pago:', style: TextStyle(fontSize: 15)),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 30, right: 30),
            //saldo cartera
            child: TextField(
              enabled: false,
              controller: TextEditingController(text: prefs.admmes),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.only(left: 30.0, bottom: 5),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Fecha Limite Pago:', style: TextStyle(fontSize: 15)),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 30, right: 30),
            //fecha pago
            child: TextField(
              enabled: false,
              controller: TextEditingController(
                  text: '${prefs.anoadm}-${prefs.mesadm}'),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.only(left: 30.0, bottom: 5),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Estado de Ingreso:', style: TextStyle(fontSize: 15)),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 30, right: 30),
            //autorizacion de parqueadero
            child: CheckboxListTile(
              fillColor: MaterialStateProperty.resolveWith((states) {
                if (!states.contains(MaterialState.selected)) {
                  return Colors.black;
                }
                return null;
              }),
              title: const Text('Autorizado para ingreso a Parqueadero',
                  style: TextStyle(color: Colors.black)),
              controlAffinity: ListTileControlAffinity.leading,
              value: prefs.status,
              onChanged: null,
            ),
          ),
          Container(
            //segunda division
            margin: const EdgeInsets.only(left: 30, right: 30),
            child: const Divider(
              color: Colors.black,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 30, right: 30),
            child: Row(
              children: [
                Column(
                  children: [
                    IconButton(
                      padding: EdgeInsets.only(left: 30, bottom: 0),
                      icon: const Icon(Icons.car_crash_sharp, size: 24),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Visitor(
                                  textv: '',
                                )));
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 30, bottom: 5),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Autorizar Visitante',
                            style: TextStyle(fontSize: 15)),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      padding: EdgeInsets.only(left: 30, bottom: 0),
                      icon: const Icon(Icons.payment, size: 24),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => paymentpage(
                                )));
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 30, bottom: 5),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Realizar Pago',
                            style: TextStyle(fontSize: 15)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            //tercera division
            margin: const EdgeInsets.only(left: 30, right: 30),
            child: const Divider(
              color: Colors.black,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 30, right: 30),
            child: const Row(
              children: [
                Icon(Icons.location_pin, size: 24),
                Padding(
                  padding: EdgeInsets.only(left: 0, bottom: 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Ir a', style: TextStyle(fontSize: 15)),
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
