import 'package:flutter/material.dart';
import 'menu_comp.dart';

class CompanyPage extends StatefulWidget {
  _CompanyPageState createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Información",
          style: TextStyle(color: Colors.amberAccent),
        ),
        backgroundColor: Color.fromARGB(255, 128, 125, 125),
      ),
      drawer: MenuCompDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            // Introducción de la empresa ficticia
            Text(
              "Bienvenido a Pochoclos Inc.",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Image.network('https://images.vexels.com/media/users/3/142887/isolated/preview/fc58c5ffb8c2e33fc3e15a2453189825-logotipo-de-empresa-logistica-en-crecimiento.png'),
            SizedBox(height: 20),
            Text(
              "En Pochoclos Inc., nos especializamos en ofrecer soluciones de software innovadoras y personalizadas para satisfacer las necesidades de nuestros clientes. Con un equipo de expertos en tecnología y desarrollo de software, nos comprometemos a brindar productos de alta calidad que impulsen el éxito de su negocio.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              "Nuestros Servicios:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "- Desarrollo de aplicaciones móviles\n"
              "- Desarrollo de software a medida\n"
              "- Consultoría tecnológica\n"
              "- Integración de sistemas\n"
              "- Soporte y mantenimiento",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              "Contáctanos para más información sobre cómo podemos ayudar a tu empresa a crecer con nuestras soluciones de software de vanguardia.",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
