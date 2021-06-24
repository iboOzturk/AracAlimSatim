import '/Animation/FadeAnimation.dart';
import 'package:flutter/material.dart';
import '../../Services/auth_service.dart';
import 'dart:async';

class KayitPage extends StatefulWidget {
  @override
  _KayitPageState createState() => _KayitPageState();
}

class _KayitPageState extends State<KayitPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _password2Controller = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  AuthService _authService=AuthService();
  kayitOl(String pas1,String pas2){
    if(pas1==pas2){
      _authService
          .signUp(
          name: _nameController.text,
          email: _emailController.text,
          password: _passwordController.text)
          .then((value) {
        if (value == 'Olusturuldu') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
          Timer(Duration(seconds: 3),(){
            Navigator.pushNamed(context, '/giris');
          });
          //Navigator.pushNamed(context, '/giris');
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(value)));
        }
      });
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Şifreler uyuşmuyor...')));
    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Colors.grey[900],
                  Colors.grey[800],
                  Colors.grey[400]
                ]
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 40,),
            Padding(
              padding: EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  //FadeAnimation(1, Text("Kayıt Ol", style: TextStyle(color: Colors.white, fontSize: 40),)),
                  FadeAnimation(1, Image.asset('assets/images/ozturkcarLogo.png',height: 120,width: 250,)),
                ],
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.orange.shade700,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 20,),
                        FadeAnimation(1.4, Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade900,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [BoxShadow(
                                  color: Color.fromRGBO(225, 95, 27, .3),
                                  blurRadius: 20,
                                  offset: Offset(0, 10)
                              )]
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.orange))
                                ),
                                child: TextFormField(
                                  controller: _nameController,
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                      hintText: "İsim Soyisim",
                                      hintStyle: TextStyle(color: Colors.white),
                                      border: InputBorder.none
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.orange))
                                ),
                                child: TextField(
                                  controller: _emailController,
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                      hintText: "Email",
                                      hintStyle: TextStyle(color: Colors.white),
                                      border: InputBorder.none
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.orange))
                                ),
                                child: TextField(
                                  controller: _passwordController,
                                  style: TextStyle(color: Colors.white),
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      hintText: "Şifre",
                                      hintStyle: TextStyle(color: Colors.white),
                                      border: InputBorder.none
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.orange))
                                ),
                                child: TextField(
                                  controller: _password2Controller,
                                  style: TextStyle(color: Colors.white),
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      hintText: "Şifre Tekrar",
                                      hintStyle: TextStyle(color: Colors.white),
                                      border: InputBorder.none
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                        SizedBox(height: 40,),
                        FadeAnimation(1.6, InkWell(
                          onTap: (){
                            kayitOl(_passwordController.text,_password2Controller.text);
                          },
                          child: Container(
                            height: 50,
                            margin: EdgeInsets.symmetric(horizontal: 50),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.grey[900]
                            ),
                            child: Center(
                              child: Text("Kayıt Ol", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                            ),
                          ),
                        )),
                        SizedBox(height: 20,),
                        FadeAnimation(1.8, InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, '/giris');
                          },
                          child: Container(
                            height: 50,
                            margin: EdgeInsets.symmetric(horizontal: 50),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.grey[900]
                            ),
                            child: Center(
                              child: Text("Vazgeç", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                            ),
                          ),
                        )),
                        SizedBox(height: 30,),

                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

