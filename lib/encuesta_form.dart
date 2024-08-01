import 'package:flutter/material.dart';


class SurveyPage extends StatefulWidget {
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  final _formkey =GlobalKey<FormState>();
  final _pregunta1Controller = TextEditingController();
  final _pregunta2Controller = TextEditingController();
  final _pregunta4Controller = TextEditingController();
  
  String? _pregunta3;


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Encuesta", style: TextStyle(color: Colors.amberAccent),),
        backgroundColor: Color.fromARGB(255, 128, 125, 125),
        leading: IconButton(onPressed:(){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back)),
        actions: [
          IconButton(onPressed:() => {}, icon: Icon(Icons.search)),
          IconButton(onPressed:() => {}, icon: Icon(Icons.more_vert))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formkey,
          child: ListView( 
            children: [               
              TextFormField(
                controller: _pregunta1Controller,
                decoration: InputDecoration(
                  labelText: '¿Qué característica esperaba y no encontró?',
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
                controller: _pregunta2Controller,
                decoration: InputDecoration(
                  labelText: '¿Cómo calificaría el aspecto y la sensación de la App?',
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
                child: Text('¿Esta Satisfecho con el uso de la App?'),
              ),
              RadioListTile<String>(
                title: const Text('Si'),
                value: 'Si',
                groupValue: _pregunta3,
                onChanged: (String? value){
                  setState(() {
                    _pregunta3 = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('No'),
                value: 'No',
                groupValue: _pregunta3,
                onChanged: (String? value){
                  setState(() {
                    _pregunta3 = value;
                  });
                },
              ),
              TextFormField(
                controller: _pregunta4Controller,
                decoration: InputDecoration(
                  labelText: '¿Que recomienda a mejorar?',
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
