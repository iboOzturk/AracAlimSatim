import '/Animation/FadeAnimation.dart';
import 'package:flutter/material.dart';
import '../../Services/auth_service.dart';
import 'dart:async';


class SifirlaPage extends StatefulWidget {
  @override
  _SifirlaPageState createState() => _SifirlaPageState();
}

class _SifirlaPageState extends State<SifirlaPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _password2Controller = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  AuthService _authService=AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Colors.orange[900],
                  Colors.orange[800],
                  Colors.orange[400]
                ]
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 60,),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  //FadeAnimation(1, Text("Şifreni Sıfırla", style: TextStyle(color: Colors.white, fontSize: 40),)),
                  FadeAnimation(1, Image.asset('assets/images/ozturkcarLogo.png',height: 120,width: 250,)),
                  SizedBox(height: 5,),
                ],
              ),
            ),
            SizedBox(height: 15),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 50,),
                        FadeAnimation(1.4, Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade700,
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

                            ],
                          ),
                        )),
                        SizedBox(height: 40,),
                        FadeAnimation(1.5, InkWell(
                          onTap: (){
                            _authService.resetPass(email: _emailController.text).then((value) {
                              if(value=='Email Gonderildi'){
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
                                Timer(Duration(seconds: 3),(){
                                  Navigator.pushNamed(context, '/giris');
                                });
                                //Navigator.pushNamed(context, '/giris');
                              }else{

                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
                              }
                            });
                          },
                          child: Container(
                            height: 50,
                            margin: EdgeInsets.symmetric(horizontal: 50),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.orange[900]
                            ),
                            child: Center(
                              child: Text("Sıfırla", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                            ),
                          ),
                        )),
                        SizedBox(height: 30,),
                        FadeAnimation(1.6, InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, '/giris');
                          },
                          child: Container(
                            height: 50,
                            margin: EdgeInsets.symmetric(horizontal: 50),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.orange[900]
                            ),
                            child: Center(
                              child: Text("Vazgeç", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                            ),
                          ),
                        )),
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

