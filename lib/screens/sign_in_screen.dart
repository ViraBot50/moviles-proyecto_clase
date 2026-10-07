import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/email_auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  EmailAuth? _emailAuth;
  @override
  void initState() {
    super.initState();
    _emailAuth=EmailAuth();
  }

  @override
  Widget build(BuildContext context) {
    final conUser=TextEditingController();
    final conPwd=TextEditingController();


    final txtUser = TextFormField(
      controller: conUser,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
      ),
    );

    final txtPwd = TextFormField(
      controller: conPwd,
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
      ),
    );

    final btnLogin = ElevatedButton(
      onPressed: () {
        _emailAuth!.m_creaUsuario(user: conUser.text, pass: conPwd.text).then((value) {
          if (value){
            
          }
        },);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.people),
          SizedBox(width: 5),
          Text('Crear cuenta'),
        ],
      ),
    );

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('resources/imagen.jpg'),
          ),
        ),

        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              'resources/logo.png',
              height: 150,
            ),

            Positioned(
              bottom: 50,
              child: Container(
                padding: EdgeInsets.all(8),
                height: 225,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(159, 119, 53, 158),
                ),

                child: Column(
                  children: [
                    Center(
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          ),
                        ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Usuario: ",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: txtUser,
                        ),
                      ],
                    ),

                    Divider(),

                    Row(
                      children: [
                        Text(
                          "Password: ",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: txtPwd,
                        ),
                      ],
                    ),

                    Divider(),

                    btnLogin,

                    InkWell(
                      onTap: () {
                          Navigator.pop(context);
                      },
                      child: Text(
                        "Cancelar",
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
