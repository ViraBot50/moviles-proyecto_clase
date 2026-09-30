import 'package:flutter/material.dart';


class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  bool isloading=false;
  
  @override
  Widget build(BuildContext context) {

    final txtUser=TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
      
      ),
    );

    final txtPwd=TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder()
      ),
    );

    final loading = Positioned(
      top:100,
      child:CircularProgressIndicator(color: Colors.white,)
    );

    final btnLogin= ElevatedButton(
      onPressed: (){
        isloading = !isloading;
        setState(() {});
        Future.delayed(
          Duration(seconds: 4)
        ).then((value) {
          Navigator.pushNamed(context, "/dash");
          isloading = false;
          setState(() {});
          });

       

      },
      child: Row(
        children: [
          Icon(Icons.login),
          Text('Iniciar Sesion')
        ],
      ),
    );

    final space= Container(height: 5,);

    final Space2=SizedBox(height: 5,);


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
              Image.asset('resources/logo.png', height: 150,),
              Positioned(
                bottom: 90,
                child: Container(
                  padding: EdgeInsets.all(8),
                  height: 210,
                  width: MediaQuery.of(context).size.width*0.9,
                  decoration: BoxDecoration(
                    borderRadius:BorderRadiusDirectional.circular(20),
                    color: Color.fromARGB(159, 119, 53, 158)
                  ),
                  child:Column(
                    children: [
                      txtUser,
                      Divider(),
                      txtPwd,
                      Divider(),
                      btnLogin
                    ],
                  ),                
                ),
              ),
            isloading? loading:Container()

            ],
          ),

        ),

    );
  }
}