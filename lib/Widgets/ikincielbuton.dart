import 'package:deneme2/Utils/utils.dart';
import 'package:flutter/material.dart';

class IkinciElButton extends StatelessWidget {
  const IkinciElButton({
    Key key,
    @required this.gideceksayfa,
    @required this.metin,
    @required this.topleft,
    @required this.bottomleft,
    @required this.bottomright,
    @required this.topright,
    @required this.ikon,

  })  : super(key: key);

  final String gideceksayfa;
  final String metin;
  final double topright;
  final double topleft;
  final double bottomright;
  final double bottomleft;
  final IconData ikon;

  @override
  Widget build(BuildContext context) {
    //double fontBoyut=13;
    final double _height = MediaQuery.of(context).size.height;
    double height = 0.18181818 * (0.5494399 * _height);
    // double height = 0.18181818 * (0.5894399 * _height);
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/$gideceksayfa');
        },
        child: Container(
          alignment: Alignment.center,
          child: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(ikon,color: Colors.white,),
              SizedBox(width: 10,),
              Text(metin,style: MenuBeyazKalin,),
            ],
          ),
          width: 230 ,height: 70,
          decoration: BoxDecoration(
              color: Colors.grey.shade900,
              borderRadius: BorderRadius.only(
                topRight:  Radius.circular(topright),bottomLeft: Radius.circular(bottomleft),
                topLeft:  Radius.circular(topleft),bottomRight: Radius.circular(bottomright),
              )
          ),
        ));
  }
}
