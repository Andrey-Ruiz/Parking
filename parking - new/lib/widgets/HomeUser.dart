import 'package:flutter/material.dart';
import 'package:parking/Localstorage/Sharepreference.dart';
import 'package:parking/widgets/CustomerDrawer.dart';
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
          child: Column(
        children: [
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 300),
            child: Icon(
              Icons.notifications,
              color: Colors.grey,
              size: 30,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          SizedBox(
            height: 200.0,
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
        ],
      )),
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
