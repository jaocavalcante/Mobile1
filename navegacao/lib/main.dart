import 'package:flutter/material.dart';

void main() {
  runApp(Aplicativo());
}

class Aplicativo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Pagina1(),
    );
  }
}

class Pagina1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://miro.medium.com/v2/resize:fit:1358/1*6JxdGU2WIzHSUEGBx4QeAQ.jpeg',
              width: 300,
              height: 300,
            ),
            const Text(
              'Bem-vindo a tela inicial',
              style: TextStyle(fontSize: 30),
            ),
            const Text(
                'Flutter é uma ferramenta multiplataforma - Android e IOS com um unico codigo'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Pagina2()),
                );
              },
              child: Text('Ir para Pagina 2'),
            ),
          ],
        ),
      ),
    );
  }
}

class Pagina2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pagina2'),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://miro.medium.com/v2/resize:fit:1400/0*P2uaCA_ECZ8Tr1TM',
                width: 400,
                height: 400,
              ),
             const SizedBox(height: 20),
             const Text('Linguagem DART', style: TextStyle(fontSize: 30), ),
             const Text(
                  'É um linguagem versatil que combina eficiencia e desempenho'
                  ),
                  SizedBox( height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Pagina3()),
                        );
                    },
                    child: Text('Ir para página 3'),
                  ),
            ],
          ),
        ));
  }
}

class Pagina3 extends StatelessWidget {
   
   @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina3', style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 38, 0, 255),
      actions: [
        PopupMenuButton(
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                child: Text('Opção1'),
                value: 'opcao1',
                 ),
                  PopupMenuItem(
                child: Text('Opção2'),
                value: 'opcao2',
                 ),
            ];
          },
          onSelected: (value) { },
          
          ),
      ],
      ),
      body: Center (
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThcNM0YsNmhkI2-bgUaqdHunYsnL5HELu1mg&usqp=CAU', width: 300, height: 300,
            ),
            Text('A Historia do Senac', style: TextStyle(fontSize: 30),),
            Text('O Senac foi criado no ano, com o proposito de educar profissionalmente'),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                MaterialPageRoute(builder: (context) => Pagina1()),
                );
              },
              child: Text('Voltar para a Pagina Inicial'),
            ),
          ],
        ),
        ),
    );
   }
}
