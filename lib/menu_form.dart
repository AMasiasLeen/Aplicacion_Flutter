import 'package:flutter/material.dart';
import 'cliente_form.dart';
import 'orden_trabajo.dart';
import 'encuesta_form.dart';
import 'map_form.dart';

class MenuFormPage extends StatefulWidget {
  _MenuFormPageState createState() => _MenuFormPageState();
}

class _MenuFormPageState extends State<MenuFormPage> {

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: Text('Menu de opciones'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 128, 125, 125)
                 ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/login.png'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Menu',
                    style: TextStyle(
                      color: Colors.amberAccent,
                      fontSize: 24
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.deepOrangeAccent),
              title: Text('Inicio'),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle_rounded, color: Colors.deepOrangeAccent),
              title: Text('Clientes'),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyHomePage())
                    );
              },
            ),
            ListTile(
              leading: Icon(Icons.work, color: Colors.deepOrangeAccent),
              title: Text('Orden de Trabajo'),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OrderPage())
                    );
              },
            ),
            ListTile(
              leading: Icon(Icons.book, color: Colors.deepOrangeAccent),
              title: Text('Encuesta'),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SurveyPage())
                    );
              },
            ),
            ListTile(
              leading: Icon(Icons.location_on, color: Colors.deepOrangeAccent),
              title: Text('Localización'),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MapPage())
                    );
              },
            ),
            ListTile(
              leading: Icon(Icons.close, color: Colors.deepOrangeAccent),
              title: Text('Cerrar sesion'),
              onTap: (){
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );

  }
}