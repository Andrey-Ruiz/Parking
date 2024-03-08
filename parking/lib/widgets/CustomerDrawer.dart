import 'package:flutter/material.dart';
import 'package:parking/widgets/CreateVisitor.dart';
import 'package:parking/widgets/HomeUser.dart';
import 'package:parking/widgets/Pconfi.dart';
import 'package:parking/widgets/Register.dart';
import 'package:parking/widgets/Session.dart';

class CustomerDrawer extends StatelessWidget {
  const CustomerDrawer({super.key});

  Widget build(BuildContext context) {
    return Drawer(
      //Menu
      child: ListView(
        children: [
          Title(color: Colors.black, child: Text('menu')),
          ListTile(
            title: const Text('Dashdoard Propietario'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HomeUser(
                                )));
            },
          ),
          ListTile(
            title: const Text('Registro Visitantes'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Visitor(
                                  textv: '',
                                )));
            },
          ),
          ListTile(
            title: const Text('Registro Propietarios'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Register(
                        textv: '',
                      )));
            },

            
          ),
          ListTile(
            title: const Text('Ingreso de Vehiculo'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Pconfi(
                        text: '',
                      )));
            },
           
          ),
          ListTile(
            title: const Text('Cerrar Sesión'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const Session()));
            },
          )
        ],
      ),
    );
  }
}
