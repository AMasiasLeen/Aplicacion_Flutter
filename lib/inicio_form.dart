import 'package:flutter/material.dart';
import 'menu_form.dart';

class HomeFormPage extends StatefulWidget {
  _HomeFormPageState createState() => _HomeFormPageState();
}

class _HomeFormPageState extends State<HomeFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Inicio",
          style: TextStyle(color: Colors.amberAccent),
        ),
        backgroundColor: Color.fromARGB(255, 128, 125, 125),
      ),
      drawer: MenuDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            // Introducción sobre el registro de formularios
            Text(
              "Bienvenido a la Plataforma de Gestión de Formularios",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Image.asset('assets/formulario.jpg'), // Asegúrate de tener esta imagen en tu carpeta de assets
            SizedBox(height: 20),
            Text(
              "Nuestra plataforma te permite gestionar de manera eficiente los formularios de clientes, órdenes de trabajo y encuestas. Con una interfaz fácil de usar, puedes registrar, actualizar y visualizar toda la información relevante en un solo lugar.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              "Características Principales:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "- Registro de Clientes: Guarda y actualiza la información de tus clientes de manera sencilla.\n"
              "- Órdenes de Trabajo: Registra ordenes para asignaciones de trabajos o pedidos.\n"
              "- Encuestas: Responde encuestas para obtener feedback valioso.",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
