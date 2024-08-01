import 'package:flutter/material.dart';
import 'menu_form.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final String claveCorrecta = '123';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Formulario Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: ClipOval(
                  child: Image.asset(
                    'assets/login.png',
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                    labelText: "Username",
                    prefixIcon: Icon(Icons.person_outlined)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Porfavor Ingrese el Username";
                  }

                  return null;
                },
              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                    labelText: "Password", prefixIcon: Icon(Icons.password)),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Porfavor Ingrese Su contraseña";
                  }

                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (_passwordController.text == claveCorrecta) {
                      Navigator.push(
                        context,
                         MaterialPageRoute(
                          builder: (context) => MenuFormPage())
                          );
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Contrase;a incorrecta'))
                    );
                  }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Formulario no valido"))
                    );
                  }
                },
                child: Text('Iniciar sesion'),
              )
            ],
          ),
        ),
      ),
    );
  }
}