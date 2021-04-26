import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Hakkinda extends StatefulWidget {
  @override
  _HakkindaState createState() => _HakkindaState();
}

class _HakkindaState extends State<Hakkinda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        ///appbar dekarasyonu
        backgroundColor: Colors.orange,leading: Icon(Icons.person),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20))
        ),
        centerTitle: true,
        title: Text('Hakkında'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ///Hakkında texti
            Expanded(
              flex: 3,
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 15,right: 15),
                child: Container(
                  decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25),
                          side: BorderSide(width: 3,color: Colors.orange)
                      )
                  ),
                  width: 415,height: 300,alignment: Alignment.center,padding: EdgeInsets.only(left: 10,right: 10),
                  child: Text(
                    'Bu uygulama Dr. Öğretim Üyesi Ahmet Cevahir ÇINAR tarafından yürütülen 3301456 kodlu MOBİL PROGRAMLAMA dersi kapsamında 193301066 numaralı İbrahim ÖZTÜRK tarafından 30 Nisan 2021 günü yapılmıştır.',
                    style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600,color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            ///Anamenüye dönme butonu
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: OutlineButton(
                  borderSide: BorderSide(color: Colors.orange, width: 3),padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  child: Icon(Icons.home,size: 30,color: Colors.white,),
                ),
                padding: EdgeInsets.all(20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
