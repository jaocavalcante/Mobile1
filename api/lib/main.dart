import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


void main() {
  runApp(Principal());
}

class Principal extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
        return MaterialApp(
      title: "Aplicação com API",
      theme: ThemeData(primarySwatch: Colors.blue),
          home: home(),
    );
  }
}

class home extends StatefulWidget {
  @override
  home_state createState() => home_state();
}
class home_state extends State<home>{
  TextEditingController controleTexto = TextEditingController();
  String conteudo = '';
  String imagem = '';

  Future<void> buscar() async {
    String entrada = controleTexto.text;
    String url = 'https://pt.wikipedia.org/api/rest_v1/page/summary/$entrada';

    final resposta = await http.get(Uri.parse(url));
    if (resposta.statusCode == 200) {
      Map<String, dynamic> dado = json.decode(resposta.body);
      setState(() {
        conteudo = dado['extract'];
        imagem = dado ['originalimage']['source'];
      });
    } else {
      conteudo = 'Nada foi encontrado!';
      imagem = '';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplicativo com API'),
        backgroundColor: Colors.blue,),
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://lojaacal.vteximg.com.br/arquivos/ids/168509-1000-1000/churrasqueira-de-concreto-refratario-tijolinho-media-pintada-preta-65cm-fortal-516006-02.jpg?v=637407841540670000'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
           Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Card(
                    elevation: 5.0,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[

                          Row(
                            children: <Widget>[
                              Expanded(
                              child: TextField(
                            controller: controleTexto,
                            decoration: InputDecoration(
                              labelText: "Digit o texto",
                            ),
                          ),
                          ),
                           ElevatedButton(
                            onPressed: buscar, 
                            child: const Text('Buscar'),
                            style:ButtonStyle( 
                              backgroundColor:
                              MaterialStateProperty.all(Colors.indigo),
                            ),
                          ),




                          
                         

                            ],
                          ),
                          
                          
                          
                          Text(

                            'Texto Traduzido:',
                            style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10.0),
                            Text(conteudo, style: TextStyle(fontSize: 16.0)),
                            const SizedBox(height: 20.0),
                            if(imagem.isNotEmpty)
                            GestureDetector(
                              onTap: () {
                                Navigator.push( context, MaterialPageRoute(
                                  builder: (context) => ImagemTelaInteira(imagemParametro: imagem )
                                  ),
                                );
                              },
                              child: Center(
                                child: ClipRRect(borderRadius: BorderRadius.circular(25.0),
                                child: Image.network(imagem, height: 150),
                                ),
                              ),
                            ),

                          
                        ],
                      ),
                    ),
                  ),
                ),
                ),
          ],
        ),
    
    );
  }
}  
class ImagemTelaInteira extends StatelessWidget {
  final String imagemParametro;

  ImagemTelaInteira({required this.imagemParametro});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Hero(
          tag: imagemParametro,
          child: Image.network(imagemParametro),
        ),
        ),
    );

  }
}