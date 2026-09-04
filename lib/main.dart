import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/dashboard_screen.dart';
import 'package:flutter_application_1/screens/login_screen.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: loginScreen(),
      routes: {
        "/dash":(context) => DashboardScreen()
      },
    );
  }
}
/*
class MyApp extends StatefulWidget {
   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int valor=0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        body: Center(child: Text("Contador: $valor", style: TextStyle(fontSize: 25),)),
        floatingActionButton: FloatingActionButton(
                                backgroundColor: Colors.grey,
                                child: Icon(Icons.offline_bolt,color: Color(0xFFFF0000)),
                                onPressed: (){
                                  valor++;
                                  setState(() {});
                                  print(valor);
                                }
                                ),

              


      )
    );
  }
}*/