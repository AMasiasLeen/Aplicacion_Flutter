import 'package:flutter/material.dart';
import 'database_cuarto.dart';
import 'menu_form.dart';
import 'cliente_list.dart';

class MyHomePage extends StatefulWidget {
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formkey = GlobalKey<FormState>();
  final _apellidoController = TextEditingController();
  final _nombreController = TextEditingController();
  final _correoController = TextEditingController();
  final _telefonoController = TextEditingController();

  late DatabaseCuarto _databaseCuarto;

  @override
  void initState() {
    super.initState();
    _databaseCuarto = DatabaseCuarto();
  }

  void _addClient() async {
    if (_formkey.currentState!.validate()) {
      Map<String, dynamic> client = {
        'apellido': _apellidoController.text,
        'nombre': _nombreController.text,
        'correo': _correoController.text,
        'telefono': _telefonoController.text
      };
      await _databaseCuarto.insertClient(client);
      // Limpiar los campos después de registrar un cliente
      _apellidoController.clear();
      _nombreController.clear();
      _correoController.clear();
      _telefonoController.clear();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Cliente registrado exitosamente')));
    }
  }

  void _viewClients() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ClientesListPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Clientes", style: TextStyle(color: Colors.amberAccent)),
        backgroundColor: Color.fromARGB(255, 128, 125, 125),
      ),
      drawer: MenuDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formkey,
          child: ListView(
            children: [
              TextFormField(
                controller: _apellidoController,
                decoration: InputDecoration(
                  labelText: 'Apellidos Completos',
                  prefixIcon: Icon(Icons.person_outline),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo Obligatorio*';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _nombreController,
                decoration: InputDecoration(
                  labelText: 'Nombres Completos',
                  prefixIcon: Icon(Icons.person_outline),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo Obligatorio*';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _correoController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email_outlined),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo Obligatorio*';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _telefonoController,
                decoration: InputDecoration(
                  labelText: 'Telefono',
                  prefixIcon: Icon(Icons.phone),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo Obligatorio*';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _addClient,
                child: Text('Enviar'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _viewClients,
                child: Text('Ver registros'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
