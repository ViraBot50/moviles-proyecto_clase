import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/email_auth.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  EmailAuth? _emailAuth;
  final conUser = TextEditingController();
  final conPwd = TextEditingController();
  @override
  void initState() {
    super.initState();
    _emailAuth = EmailAuth();
  }

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    final txtUser = TextFormField(
      controller: conUser,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(border: OutlineInputBorder()),
    );

    final txtPwd = TextFormField(
      controller: conPwd,
      style: TextStyle(color: Colors.white),
      obscureText: true,
      decoration: InputDecoration(border: OutlineInputBorder()),
    );

    final loading = Positioned(
      top: 100,
      child: CircularProgressIndicator(color: Colors.white),
    );

    final btnLogin = ElevatedButton(
      onPressed: () {
        isloading = !isloading;
        setState(() {});
        // Future.delayed(
        //   Duration(seconds: 4)
        // ).then((value) {
        //   Navigator.pushNamed(context, "/dash");
        //   isloading = false;
        //   setState(() {});
        //   });
        _emailAuth!.m_loginUser(user: conUser.text, pass: conPwd.text).then((
          value,
        ) {
          if (value) {
            Navigator.pushNamed(context, "/dash");
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Usuario o contraseña incorrecto"),
                duration: Duration(seconds: 3),
              ),
            );
          }
          isloading = false;
          setState(() {});
        });
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [Icon(Icons.login), SizedBox(width: 5), Text('Crear cuenta')],
      ),
    );

    final space = Container(height: 5);

    final Space2 = SizedBox(height: 5);

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
          alignment: AlignmentGeometry.center,
          children: [
            Image.asset('resources/logo.png', height: 150),
            Positioned(
              bottom: 50,
              child: Container(
                padding: EdgeInsets.all(8),
                height: 230,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(20),
                  color: Color.fromARGB(159, 119, 53, 158),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Usuario: ",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(width: 5),
                        Expanded(child: txtUser),
                      ],
                    ),
                    Divider(),
                    Row(
                      children: [
                        Text(
                          "password: ",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(width: 5),
                        Expanded(child: txtPwd),
                      ],
                    ),
                    Divider(),
                    btnLogin,
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/signIn");
                      },
                      child: Text(
                        "Crear cuenta",
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
            isloading ? loading : Container(),
          ],
        ),
      ),
    );
  }
}
