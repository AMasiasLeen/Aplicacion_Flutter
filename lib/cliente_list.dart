import 'package:flutter/material.dart';
import 'database_cuarto.dart';

class ClientesListPage extends StatefulWidget {
  @override
  _ClientesListPageState createState() => _ClientesListPageState();
}

class _ClientesListPageState extends State<ClientesListPage> {
  late DatabaseCuarto _databaseCuarto;
  List<Map<String, dynamic>> _clientes = [];

  @override
  void initState() {
    super.initState();
    _databaseCuarto = DatabaseCuarto();
    _loadClientes();
  }

  void _loadClientes() async {
    final clientes = await _databaseCuarto.getAllClients();
    setState(() {
      _clientes = clientes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Clientes'),
      ),
      body: ListView.builder(
        itemCount: _clientes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${_clientes[index]['nombre']} ${_clientes[index]['apellido']}'),
            subtitle: Text(_clientes[index]['correo']),
            trailing: Text(_clientes[index]['telefono']),
          );
        },
      ),
    );
  }
}
