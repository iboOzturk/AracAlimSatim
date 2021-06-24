import 'package:flutter/material.dart';
import '../../Utils/utils.dart';
import '../../Widgets/ikincielbuton.dart';
class IkinciElPage extends StatefulWidget {
  @override
  _IkinciElPageState createState() => _IkinciElPageState();
}

class _IkinciElPageState extends State<IkinciElPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: Text('İkinci El Piyasası'),
        leading: IconButton(onPressed: (){
          Navigator.pushNamed(context, '/home');
        },icon: Icon(Icons.arrow_back_ios),),
      ),
      body: Container(alignment: Alignment.center,
        color: Colors.orange.shade600,
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/ikincielaraba.png',color: Colors.grey.shade900,),
            SizedBox(height: 20,),
            IkinciElButton(gideceksayfa: 'sell',  metin: 'Sat', topleft: 30, bottomleft: 30, bottomright: 100, topright: 100,ikon: Icons.shopping_cart,),
            SizedBox(height: 20,),
            IkinciElButton(gideceksayfa: 'satilik', metin: 'Satılık Araçları gör', topleft: 120, bottomleft: 120, bottomright: 30, topright: 30,ikon: Icons.car_rental,),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
