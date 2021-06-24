import 'dart:ui';
import 'package:deneme2/Animation/FadeAnimation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Services/auth_service.dart';
import '../../Services/car_service.dart';
import 'package:line_icons/line_icons.dart';

class DrawerWidget extends StatelessWidget {
  AuthService _authService = AuthService();
  CarService _statusService=CarService();
  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: FutureBuilder(
          future:_statusService.ArabalariAl(),
          builder: (context,snapshot) {
            if (snapshot.connectionState == ConnectionState.none &&
                snapshot.hasData == null) {
              //print('project snapshot data is: ${projectSnap.data}');
              return Container(color: Colors.blue,);
            }
            //return _statusService.isim == null ? CircularProgressIndicator() :
            return snapshot.connectionState==ConnectionState.waiting ? Container(color: Colors.grey.shade900,) :
            ListView(
              scrollDirection: Axis.vertical,
              children: [
                UserAccountsDrawerHeader(

                  decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                      ),
                      color: Colors.orange.shade700),
                  accountName: Text(
                    _statusService.isim,
                    style: TextStyle(fontSize: 20,color: Colors.black,),
                  ),
                  accountEmail: Text(
                    _statusService.email,
                    style: TextStyle(fontSize: 20,color: Colors.black),
                  ),
                ),
                Container(
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                    ),
                    color: Colors.grey.shade900,),
                  width: 400,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height,
                  //  color: Colors.grey.shade900,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 35,),
                      FadeAnimation(1.1,
                        Container(
                          padding: EdgeInsets.only(left: 20,right: 50),
                          alignment: Alignment.bottomLeft,
                          child: InkWell(
                            onTap: (){
                              Navigator.pushNamed(context, '/mycars');},
                            child: Container(
                              decoration: BoxDecoration(color: Colors.grey.shade800
                                  ,borderRadius: BorderRadius.circular(25)),
                              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                              child: Row(
                                children: [
                                  Icon(LineIcons.car,color: Colors.white,size: 30,),
                                  SizedBox(width: 5,),
                                  Text('Arabalarım',style: TextStyle(color: Colors.white,fontSize: 30),),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 35,),
                      FadeAnimation(1.2,
                        Container(
                          padding: EdgeInsets.only(left: 20, right: 50),
                          alignment: Alignment.bottomLeft,
                          child: InkWell(
                            onTap: (){
                            Navigator.pushNamed(context, '/hakkinda');},
                            child: Container(
                              decoration: BoxDecoration(color: Colors.grey.shade800
                                ,borderRadius: BorderRadius.circular(25),),
                              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                              child: Row(
                                children: [
                                  Icon(Icons.person,color: Colors.white,size: 30,),
                                  SizedBox(width: 5,),
                                  Text('Hakkında',style: TextStyle(color: Colors.white,fontSize: 30),),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 35,),

                      FadeAnimation(1.3,
                        Container(
                          padding: EdgeInsets.only(left: 20, right: 50),
                          alignment: Alignment.bottomLeft,
                          child: InkWell(
                            onTap: (){
                            Navigator.pushNamed(context, '/grafik');
                            },
                            child: Container(
                              decoration: BoxDecoration(color: Colors.grey.shade800
                                ,borderRadius: BorderRadius.circular(25),),
                              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                              child: Row(
                                children: [
                                  Icon(Icons.person,color: Colors.white,size: 30,),
                                  SizedBox(width: 5,),
                                  Text('Satılık Araçlar Grafiği',style: TextStyle(color: Colors.white,fontSize: 18),),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 35,),

                      FadeAnimation(1.4,
                        Container(
                          padding: EdgeInsets.only(left: 20,right: 50),
                          alignment: Alignment.bottomLeft,
                          child: InkWell(
                            onTap: (){_authService.signOut();
                            Navigator.pushNamed(context, '/giris');},
                            child: Container(
                              decoration: BoxDecoration(color: Colors.red.shade700
                                ,borderRadius: BorderRadius.circular(25),),
                              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                              child: Row(
                                children: [
                                  Icon(LineIcons.alternateSignOut,color: Colors.white,size: 30,),
                                  SizedBox(width: 5,),
                                  Text('Çıkış Yap',style: TextStyle(color: Colors.white,fontSize: 30),),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
}
