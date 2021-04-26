import 'package:flutter/material.dart';
import '../Arabalar/cars.dart';
class CarList extends StatefulWidget {
  @override
  _CarListState createState() => _CarListState();
}

class _CarListState extends State<CarList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.grey[300],
      appBar: AppBar(centerTitle: true,backgroundColor: Colors.grey[300],
        flexibleSpace: Container(
            decoration: BoxDecoration(gradient: LinearGradient(
                colors: [Colors.grey[600],Colors.grey[800],Colors.black,Colors.grey[400]],
                begin: Alignment.bottomLeft,end: Alignment.topRight
            )
            ),
        ),actions: [IconButton(icon: Icon(Icons.shopping_cart,color: Colors.white,), onPressed: (){
          Navigator.pushNamed(context, '/arabatip');
        })],
        leading: IconButton(onPressed: (){Navigator.pushNamed(context, '/home');},
          icon: Icon(Icons.arrow_back_ios,color: Colors.white,),),
        title: Text('Fiyat Listesi',style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        decoration: BoxDecoration(gradient: LinearGradient(
            colors: [Colors.grey[600],Colors.grey[800],Colors.black,Colors.grey[400]],
            begin: Alignment.bottomLeft,end: Alignment.topRight
        )
        ),
        child: GridView.builder(
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          physics: ScrollPhysics(),
          itemCount: allCars.cars.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context,int index)=>Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Container(

                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                child: Container(
                 // padding: EdgeInsets.symmetric(horizontal: 1,vertical: 1),
                  decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                  child: Column(textDirection: TextDirection.ltr,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(allCars.cars[index].yol,),
                      Text(allCars.cars[index].baslik,textAlign: TextAlign.center,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      Text(allCars.cars[index].fiyat.toString()+"\$",style: TextStyle(fontSize: 15,color: Colors.red[600],fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
