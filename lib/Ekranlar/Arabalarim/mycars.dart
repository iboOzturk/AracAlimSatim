import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:line_icons/line_icons.dart';
import '/Services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '/Services/car_service.dart';
import '/Utils/utils.dart';


final userRef=FirebaseFirestore.instance.collection('Kullanıcılar');

class MyCarsPage extends StatefulWidget {
  @override
  _MyCarsPageState createState() => _MyCarsPageState();
}

class _MyCarsPageState extends State<MyCarsPage> {
  @override
  void initState(){
    getUsers();
    sayfaYenile();
    super.initState();
  }

  final _firestore=FirebaseFirestore.instance;
  FirebaseAuth _auth=FirebaseAuth.instance;
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
  ///satış işleminden sonra
  sayfaYenile(){
    _statusService.ArabalariAl();
  }

  CarService _statusService=CarService();
  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
        future: _statusService.ArabalariAl(),
        builder: (context,index){
          return Scaffold(
            backgroundColor: Colors.orange.shade700,
            appBar: AppBar(title: Text(_statusService.isim),backgroundColor: Colors.orange.shade900,),
            body: FutureBuilder(
                future:_statusService.ArabalariAl(),
                builder: (context,listsnap) {
                  if (listsnap.connectionState == ConnectionState.none &&
                      listsnap.hasData == null) {
                    //print('project snapshot data is: ${projectSnap.data}');
                  }
                  if(listsnap.connectionState==ConnectionState.waiting){
                    return Center(child: CircularProgressIndicator(color: Colors.black,strokeWidth: 10,));
                  }
                  ///_statusService.isim==null
                  if(_statusService.kontrol>0){
                    return ListView.builder(
                        itemCount: _statusService.carUz,
                        itemBuilder: (context,i){
                          Future<void> _showChoiseDialog(BuildContext context) {
                            return showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                      title: Text(
                                        "Satmak istediğinize emin misiniz?",
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
                                                  _statusService
                                                      .removeMyCar(_statusService.id,_statusService.arabaIDleri[i]).then((value) {
                                                    _statusService.ArabaEkle(_statusService.isim,
                                                        _statusService.arabaMarkalari[i],_statusService.arabaModelleri[i],
                                                        _statusService.arabaFiyatlari[i],_statusService.arabaHacimleri[i],
                                                        _statusService.arabaGucleri[i],_statusService.arabaYakitlari[i],
                                                        _statusService.arabaTipleri[i]
                                                    );

                                                  });
                                                  setState(() {
                                                    Navigator.pop(context);
                                                  });
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
                                                      color: Colors.blue,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          )));
                                });
                          }
                          Future<void> _showDetay(BuildContext context) {
                            return showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(backgroundColor: Colors.grey.shade800,
                                      title: Text(
                                        _statusService.arabaMarkalari[i]+' '+
                                            _statusService.arabaModelleri[i],
                                        textAlign: TextAlign.center,style: BaslikBeyazText,
                                      ),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(16.0))),
                                      content: Container(
                                          height: 240,
                                          width: 60,
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade900,
                                          ),
                                          child: Column(
                                            children: [
                                              Container(
                                                child: Column(
                                                  children: [
                                                    SizedBox(height: 20,),
                                                    Image.network(_statusService.resimler[i],width: 80,height: 80,),
                                                    SizedBox(height: 5,),
                                                    Text('Motor Hacmi: '+_statusService.arabaHacimleri[i]+'\n'+
                                                        'Motor Gücü: '+_statusService.arabaGucleri[i]+'\n'+
                                                        'Yakıt: '+_statusService.arabaYakitlari[i]+'\n'+
                                                        'Tip: '+_statusService.arabaTipleri[i],
                                                      style: BeyazText,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 5),
                                              Text('Fiyat: '+_statusService.arabaFiyatlari[i]+' \$',style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),
                                              SizedBox(height: 5),
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  "Kapat",
                                                  style: TextStyle(
                                                      color: Colors.blue,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          )));
                                });
                          }

                          return InkWell(
                            onLongPress: (){_showDetay(context);},
                            child: Card(  color: Colors.grey.shade900,shadowColor: Colors.white,elevation: 5,
                              child: Column(
                                children: [
                                  SizedBox(height: 20,),
                                  ListTile(
                                    leading: CircleAvatar(maxRadius: 30,backgroundColor: Colors.grey.shade900,child: Image.network(_statusService.resimler[i],fit: BoxFit.contain,),),
                                    title: Container(
                                      padding: EdgeInsets.only(left: 10,right: 10),
                                      child: Text(_statusService.arabaMarkalari[i]+
                                          ' '+_statusService.arabaModelleri[i],style: BaslikBeyazText,),
                                    ),
                                    subtitle: Container(
                                      padding: EdgeInsets.only(left: 10,right: 10),
                                      child: Text(_statusService.arabaFiyatlari[i]+' \$',
                                        style: TextStyle(color: Colors.green,fontSize: 15,fontWeight: FontWeight.w300),),
                                    ),
                                    /*
                                subtitle: Container(
                                  padding: EdgeInsets.only(left: 10,right: 10),
                                  alignment: Alignment.centerLeft,
                                  child: Column(mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                     Text('Hacim: '+_statusService.arabaHacimleri[i]+'\n'
                                          'Güç: '+_statusService.arabaGucleri[i]+'\n'
                                           'Yakıt: '+_statusService.arabaYakitlari[i]+'\n'
                                          'Tip: '+_statusService.arabaTipleri[i]+'\n'
                                          'Fiyat: '+_statusService.arabaFiyatlari[i],
                                        style: BeyazText,textAlign: TextAlign.left,),
                                    ],
                                  ),
                                ), */
                                    trailing: ElevatedButton(
                                      child: Text('Sat',),
                                      onPressed: (){
                                        _showChoiseDialog(context);
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 20,),
                                ],
                              ),
                            ),
                          );
                        });
                  }else{
                    return Center(
                      child: Container(
                          width: MediaQuery.of(context).size.width-50,
                          height: MediaQuery.of(context).size.height-200,
                          decoration: ShapeDecoration(color: Colors.black12,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  side: BorderSide(width: 2,color: Colors.black)
                              )
                          ),
                          padding: EdgeInsets.only(left: 15,right: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.error_outline,size: 150,color:Colors.black ,),
                              SizedBox(height: 5,),
                              Text('Sayın '+_statusService.isim+' size ait araba bulunmamaktadır.',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,),),
                            ],
                          )),
                    );
                  }
                }),
          );
        });
    /*
       */
  }
}
/* return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: ElevatedButton(onPressed: (){getUsers();},child: Text('Ampüle Bas'),),
      ),
    );
 */

