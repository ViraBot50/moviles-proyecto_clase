import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/global_values.dart';
import 'package:flutter_application_1/components/theme_app.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/screens/add_note_screen.dart';
import 'package:flutter_application_1/screens/dashboard_screen.dart';
import 'package:flutter_application_1/screens/login_screen.dart';
import 'package:flutter_application_1/screens/notes_screen.dart';


void main() async{ 
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
  }


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ValueListenableBuilder(
      valueListenable: GlobalValues.banThem,
      builder: (context,value,_) {

        ThemeData tema= ThemeData.light();
        switch(value){
          case 0:tema=ThemeData.dark(); break;

          case 1:tema=ThemeData.light(); break;

          case 2:tema=ThemeApp.warmTheme();

        }

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: tema,
          home: loginScreen(),
          routes: {
            "/dash":(context) => DashboardScreen(),
            "/note":(context) => NotesScreen(),
            "/add":(context) => AddNoteScreen()
          },
        );
      }
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