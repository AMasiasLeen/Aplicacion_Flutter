import 'package:flutter/material.dart';
import 'package:masiasl_examen/productos_comp.dart';
import 'login_form.dart';
import 'map_form.dart';
import 'inicio_comp.dart';

class MenuCompDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 128, 125, 125),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 10),
                Text(
                  'Bienvenido',
                  style: TextStyle(color: Colors.amberAccent, fontSize: 24),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: Colors.deepOrangeAccent),
            title: Text('Información'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => CompanyPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.electrical_services, color: Colors.deepOrangeAccent),
            title: Text('Productos'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProductsPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.location_on, color: Colors.deepOrangeAccent),
            title: Text('Localización'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => MapPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.login, color: Colors.deepOrangeAccent),
            title: Text('Iniciar sesion'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginForm()));
            },
          ),
        ],
      ),
    );
  }
}
