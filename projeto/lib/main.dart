import 'package:flutter/material.dart';

void main(){
  runApp(const Aplicativo()); 
} 

class Aplicativo extends StatelessWidget {
  const Aplicativo({super.key});
  
    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home : Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('flutter é divertido!',
        style: TextStyle(color: Colors.white),
        ),
      ),

      body: const Center(

        child: SizedBox(
          // ignore: unnecessary_const, sort_child_properties_last
         child: const Text(
          'Flutter foi criado ppelo Google, usa a linguagem DART',
          style: TextStyle(
            fontSize:20,
            fontFamily:'arial',
          ),
          ),
             height: 300,
             width: 300,
      ),

      ), 
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        onPressed: () {},
      ),
    
     //------ barra de navegação inferior--------abaixo de floating action button

        //BottomNavigationBarItem - é o item da barra de navegação
        bottomNavigationBar: BottomNavigationBar(items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Principal'),
          BottomNavigationBarItem( icon: Icon(Icons.business), label: 'Negócios'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Escola'),
        ]),

        //---- barra lateral do aplicativo
        drawer: Drawer(
          backgroundColor: Colors.white,

          //lista dos itens do menu
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
                child: Text(
                  'Menu App',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                //item do menu
                leading: const Icon(Icons.home), //icone do item do menu
                title: const Text('Pagina Inicial'), //titulo do item do menu
                onTap: () {}, //ação que o botão irá executar
              ),
              ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('configurações'),
                  onTap: () {}),
              ListTile(
                  leading: const Icon(Icons.account_circle),
                  title: const Text('Perfil'),
                  onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}