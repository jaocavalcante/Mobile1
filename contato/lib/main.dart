import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const Contato());
}

class Contato extends StatelessWidget {
  const Contato({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Principal(title: 'Contato Pessoal'),
    );
  }
}

class Principal extends StatefulWidget {
  const Principal({super.key, required this.title});
  final String title;

  @override
  State<Principal> createState() => _PrincipalEstado();
}

class _PrincipalEstado extends State<Principal> {
    final foto = const CircleAvatar(
      backgroundImage: NetworkImage("https://i.redd.it/9jve2oxbe4981.png"),
      radius: 150,
    );  

    final nome = const Text(
      'Programador Full Stack Senac',
      style: TextStyle(fontSize: 30,),
      textAlign: TextAlign.center,
    );
     final obs = const Text(
      'Programador Full Stack Senac',
      style: TextStyle(fontSize: 20, color: Colors.blue),
      textAlign: TextAlign.center,
    );
     final email = IconButton(
      icon: const Icon(Icons.mail),
      color: Colors.blue,
      onPressed: () {
        launchUrl(Uri(
          scheme:  'malito', 
          path: '',
          queryParameters:{
            'subject' : 'Assunto do Email',
            'body': 'Corpo do Email',

          },
          ));
      },
     );
     final telefone = IconButton(
      icon: const Icon(Icons.phone),
      color: Colors.blue,
      onPressed: () {
        launchUrl(Uri(scheme: 'tel', path: '+5544999505087'));
      },
     );
          final sms = IconButton(
      icon: const Icon(Icons.sms),
      color: Colors.blue,
      onPressed: () {
        launchUrl(Uri(scheme: 'sms', path: '+5544999505087'));
      },
      );
                final site = IconButton(
      icon: const Icon(Icons.open_in_browser),
      color: Colors.blue,
      onPressed: () {
        launchUrl(Uri());
      },
      );
      final whatzapp = IconButton(
      icon: const Icon(Icons.wechat),
      color: Colors.blue,
      onPressed: () {
        launchUrl(Uri.parse('https://api.whatsapp/+5544999505087'));
      },
      );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Aplicativo de Contato',
          style: TextStyle(color: Color.fromARGB(255, 56, 63, 165)),
        ),
        backgroundColor: Colors.black,
        leading: IconButton(icon: Icon(Icons.menu, color:Colors.white),
        onPressed: () {},
      ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          foto, nome, obs, 
          
          Row(   
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              email, sms, site, whatzapp, 
            ],
          )
        ],
      ),
    );
  }
}
