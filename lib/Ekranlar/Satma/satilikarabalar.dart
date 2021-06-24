import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;
import '../../Services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../Utils/utils.dart';
import '../../Services/car_service.dart';
import 'package:line_icons/line_icon.dart';

final userRef=FirebaseFirestore.instance.collection('Kullanıcılar');

class SatilikArabalar extends StatefulWidget {
  @override
  _SatilikArabalarState createState() => _SatilikArabalarState();
}

class _SatilikArabalarState extends State<SatilikArabalar> {
  double ovallik=25;
  String logoUrl='';
  @override
  void initState(){
   // getUsers();
    super.initState();
  }
  final _firestore=FirebaseFirestore.instance;
  FirebaseAuth _auth=FirebaseAuth.instance;
  CarService _carService=CarService();
  getUsers() {
    String nameRef=_auth.currentUser.uid;
    userRef.get().then((querySnapshots) {
      debugPrint("User koleksiyundaki eleman sayısı: "+ querySnapshots.docs.length.toString());
      for(int i=0;i<querySnapshots.docs.length;i++){
        debugPrint("Deneme: "+querySnapshots.docs[i].data().toString());
      }
      debugPrint(nameRef.toString());
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(title: Text('İkinci El Satılık Araçlar ',style: BeyazText,)
        ,backgroundColor: Colors.black,
        leading: IconButton(onPressed: (){Navigator.pushNamed(context, '/ikinciel');},icon: Icon(Icons.arrow_back,color: Colors.white,),),
      ),
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
          //stream: usersRef.snapshots(),
            stream: _carService.getCarDetay(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> asyncSnapshot){

              if(asyncSnapshot.hasError){
                return Center(
                  child: Text('Bir Hata oluştu'),
                );
              }
              if(asyncSnapshot.connectionState==ConnectionState.waiting){
                return Center(child: CircularProgressIndicator());
              }
              return new ListView(
                  children: asyncSnapshot.data.docs.map((DocumentSnapshot document) {
                    Future<void> _showChoiseDialog(BuildContext context) {
                      return showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                                title: Text(
                                  "Satın almak istediğinize emin misiniz?"+'\n'
                                      'Fiyat: '+document['fiyat']+'\$',
                                  textAlign: TextAlign.center,
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(8.0))),
                                content: Container(
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        GestureDetector(
                                          onTap: () {
                                            _carService
                                                .removeCar(document.id).then((value) {
                                              _carService.ArabaEkle2(
                                                  document['marka'], document['model'], document['fiyat'],
                                                  document['motor hacmi'], document['motor güç'], document['yakıt']
                                                  , document['tip']);
                                            });
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "Evet",
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "Vazgeç",
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    )));
                          });
                    }

                    return Column(
                      children: [
                        GestureDetector(

                          child: Card(
                            elevation: 10,shadowColor: Colors.grey,
                            color: Colors.orange.shade900,shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: 10,),
                                new ListTile(
                                  leading: CircleAvatar(
                                    maxRadius: 30,
                                    backgroundColor: Colors.orange.shade900,
                                    child: Image.network(_carService.getCarLogo(document['marka'])),
                                  ),
                                  title: Container(alignment: Alignment.centerLeft,
                                      padding: EdgeInsets.only(left: 10,right: 10),
                                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          new Text(document['marka']+' '+document['model'],style: BaslikBeyazText,textAlign: TextAlign.left,),
                                          new Divider(color: Colors.white,height: 10,thickness: 3,),
                                        ],
                                      )),
                                  subtitle: Container(
                                      padding: EdgeInsets.only(left: 10,right: 10),
                                      alignment: Alignment.bottomLeft,
                                      child: Column(textDirection: TextDirection.ltr,
                                        children: [
                                          new Text('Motor Hacmi: '+document['motor hacmi']+'\n'+
                                              'Motor Güç: '+document['motor güç']+'\n'+
                                              'Yakıt: '+document['yakıt']+'\n'+
                                              'Fiyat: '+document['fiyat']+'\$'+'\n\n'
                                              'Satan Kişi: '+document['satan kişi'],style: BeyazText,),
                                        ],
                                      )),
                                  trailing: new IconButton(onPressed: (){_showChoiseDialog(context);},
                                      padding: EdgeInsets.only(right: 20,top: 20),
                                      icon: Icon(Icons.shopping_cart,color: Colors.white,size: 55,)),
                                ),
                                SizedBox(height: 10,),
                              ],),
                          ),
                        ),
                        SizedBox(height: 10,)
                      ],);
                  }).toList(),
              );}
        ),
      ),
    );
  }
}


