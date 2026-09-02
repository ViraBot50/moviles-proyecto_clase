import 'package:flutter/material.dart';


class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  @override
  Widget build(BuildContext context) {

    final txtUser=TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder()
      ),
    );

    final txtPwd=TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder()
      ),
    );


    return Scaffold(
        body: Container(
          height:   MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image:AssetImage('resources/imagen.jpg')
              )
          ),

          child:Stack(
            alignment: AlignmentGeometry.center,
            children: [
              Image.asset('resources/logo.png', height: 180,),
              Positioned(
                bottom: 50,
                child: Container(
                  padding: EdgeInsets.all(8),
                  height: 200,
                  width: MediaQuery.of(context).size.width*0.9,
                  decoration: BoxDecoration(
                    borderRadius:BorderRadiusDirectional.circular(20),
                    color: Color(0x99FFFFFF)
                  ),
                  child:Column(
                    children: [
                      txtUser,
                      Divider(),
                      txtPwd
                    ],
                  ),                
                ),
              )
            ],
          ),          

        ),

    );
  }
}