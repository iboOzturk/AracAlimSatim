import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuyedPage extends StatefulWidget {
  @override
  _BuyedPageState createState() => _BuyedPageState();
}

class _BuyedPageState extends State<BuyedPage> {
  @override
  Widget build(BuildContext context) {
    final TextStyle metinstil=GoogleFonts.mcLaren(fontSize: 35,fontWeight: FontWeight.w500);
    var data1=[];
    data1=ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Center(
        child: Container(alignment: Alignment.center,
          decoration: ShapeDecoration(shape: RoundedRectangleBorder(),
              gradient: LinearGradient(
                  colors: [Colors.greenAccent[400],Colors.greenAccent[100],Colors.greenAccent[700],Colors.greenAccent[200]],
                      begin: Alignment.bottomLeft,end: Alignment.topRight
              )
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('HAYIRLI OLSUN!',style: metinstil,),
              Text(data1[0].toString()+' '+data1[1].toString(),textAlign: TextAlign.center,style: metinstil,),
              Image.asset(data1[3].toString()),
              Text(data1[2].toString(),textAlign: TextAlign.center,style: metinstil,),
              Padding(padding: EdgeInsets.only(bottom: 50)),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor:Colors.grey[800] ,
        onPressed: (){Navigator.pushNamed(context, '/home');},
        child: Icon(Icons.home,color: Colors.orange,),),

    );
  }
}
