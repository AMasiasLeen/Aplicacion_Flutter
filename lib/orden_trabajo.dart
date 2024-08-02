import 'package:flutter/material.dart';
import 'menu_form.dart';

class OrderPage extends StatefulWidget {
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final _formkey =GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _telefonoController = TextEditingController();
  final _direccionController = TextEditingController();
  final _ubicacionController = TextEditingController();
  final _tecnicoController = TextEditingController();
  
  String? _motivo;
  String? _estado;
  String? _fechaInicio;
  String? _fechaFinalizacion;


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Orden de Trabajo", style: TextStyle(color: Colors.amberAccent),),
        backgroundColor: Color.fromARGB(255, 128, 125, 125),  
      ),
      drawer: MenuDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formkey,
          child: ListView( 
            children: [
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Estado',
                  prefixIcon: Icon(Icons.menu)
                ),
                value: _estado,
                onChanged: (String? newValue){
                  setState(() {
                    _estado = newValue;
                  });
                },
                items: <String>[
                  'En Curso',
                  'Finalizado'
                ].map<DropdownMenuItem<String>>
                    ((String value){
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                      );
                  } ).toList(),
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
                  labelText: 'Nombre Cliente',
                  prefixIcon: Icon(Icons.menu)
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
                  labelText: 'Teléfono',
                  prefixIcon: Icon(Icons.menu)
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo Obligatorio*';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Motivo de Visita: '),
              ),
              RadioListTile<String>(
                title: const Text('Reparación'),
                value: 'Reparación',
                groupValue: _motivo,
                onChanged: (String? value){
                  setState(() {
                    _motivo = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Mantenimiento Preventivo'),
                value: 'Mantenimiento Preventivo',
                groupValue: _motivo,
                onChanged: (String? value){
                  setState(() {
                    _motivo = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Mantenimiento Correctivo'),
                value: 'Mantenimiento Correctivo',
                groupValue: _motivo,
                onChanged: (String? value){
                  setState(() {
                    _motivo = value;
                  });
                },
              ),
              TextFormField(
                controller: _direccionController,
                decoration: InputDecoration(
                  labelText: 'Dirección',
                  prefixIcon: Icon(Icons.menu)
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo Obligatorio*';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _ubicacionController,
                decoration: InputDecoration(
                  labelText: 'Ubicación',
                  prefixIcon: Icon(Icons.menu)
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo Obligatorio*';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Fecha prevista de inicio',
                  prefixIcon: Icon(Icons.menu)
                ),
                value: _fechaInicio,
                onChanged: (String? newValue){
                  setState(() {
                    _fechaInicio = newValue;
                  });
                },
                items: <String>[

                  '*fecha inicio*'

                ].map<DropdownMenuItem<String>>
                    ((String value){
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                      );
                  } ).toList(),
                  validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo Obligatorio*';
                  }
                  return null;
                },
                ),
                DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Fecha prevista de finalización',
                  prefixIcon: Icon(Icons.menu)
                ),
                value: _fechaFinalizacion,
                onChanged: (String? newValue){
                  setState(() {
                    _fechaFinalizacion = newValue;
                  });
                },
                items: <String>[
                  
                  '*fecha finalizacion*'
                ].map<DropdownMenuItem<String>>
                    ((String value){
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                      );
                  } ).toList(),
                  validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo Obligatorio*';
                  }
                  return null;
                },
                ),
                TextFormField(
                controller: _tecnicoController,
                decoration: InputDecoration(
                  labelText: 'Técnico asignado',
                  prefixIcon: Icon(Icons.menu)
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
                  onPressed: () {
                    if(_formkey.currentState!.validate()){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content:Text('Ingreso Correcto')),
                        );
                    }
                  },
                  child: Text('Enviar'),
                )
            ],

          ), 
          ),
      )
    );
  }
}
