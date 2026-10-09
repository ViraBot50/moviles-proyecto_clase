import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/global_values.dart';
import 'package:flutter_application_1/components/menu_circular.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
      ),
      endDrawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Jose Brayan Saldaña Aguado'), 
              accountEmail: Text("moltres.guajolote.mesias@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrHn-4HWvwuabHpzU0KmYqkEQks4j8v246c3HYjxNRDS3kI9Vz30TyLOM&s=10'),
              ),
              ),
              ListTile(
                title: Text('Practica 1'),
                subtitle: Text('App de practica'),
                leading: Icon(Icons.youtube_searched_for),
                trailing: Icon(Icons.chevron_right),
              ),
              ListTile(
                title: Text('Lista de notas'),
                subtitle: Text('App Notes'),
                leading: Icon(Icons.note),
                trailing: Icon(Icons.chevron_right),
                onTap: (){
                  Navigator.pushNamed(context, '/note');
                },
              ),
              ListTile(
                title: Text('Lista de notas nube'),
                subtitle: Text('App Notes Cloude'),
                leading: Icon(Icons.cloud),
                trailing: Icon(Icons.chevron_right),
                onTap: (){
                  Navigator.pushNamed(context, '/notesNube');
                },
              ),
              ListTile(
                title: Text('Cerrar sesión'),
                subtitle: Text('Salir'),
                leading: Icon(Icons.logout),
                trailing: Icon(Icons.chevron_right),
                onTap: (){
                  //Navigator.pop(context);
                  //Navigator.pop(context);
                  //Navigator.popUntil(context, ModalRoute.withName('/login'))
                  Navigator.pushReplacementNamed(context, '/');
                  },
              ),
              
          ],
        ),
      ), //End
      floatingActionButton:menuCircular(),
    );
  }
}