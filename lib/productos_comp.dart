import 'package:flutter/material.dart';
import 'menu_comp.dart';

class ProductsPage extends StatefulWidget {
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  
  final List<Map<String, String>> products = [
    {
      'name': 'Gestor de Proyectos',
      'description': 'Aplicación para gestionar proyectos con tareas, hitos y más.',
      'image': 'assets/gestor.jpg',
    },
    {
      'name': 'Sistema CRM',
      'description': 'Software para la gestión de relaciones con los clientes.',
      'image': 'assets/crm.png',
    },
    {
      'name': 'Software de Contabilidad',
      'description': 'Herramienta para gestionar finanzas y contabilidad de empresas.',
      'image': 'assets/Software.jpg',
    },
 
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Productos",
          style: TextStyle(color: Colors.amberAccent),
        ),
        backgroundColor: Color.fromARGB(255, 128, 125, 125),
      ),
      drawer: MenuCompDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                contentPadding: EdgeInsets.all(15),
                leading: Image.asset(
                  products[index]['image']!,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(
                  products[index]['name']!,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(products[index]['description']!),
              ),
            );
          },
        ),
      ),
    );
  }
}
