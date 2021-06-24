import 'package:deneme2/Utils/utils.dart';
import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    Key key,
    @required this.gideceksayfa,
    @required this.ikonrenk,
    @required this.ikonarkarenk,
    @required this.ButonRenk,
    @required this.ikon,
    @required this.metin,
    @required this.genislik,
    @required this.topleft,
    @required this.bottomleft,
    @required this.bottomright,
    @required this.topright,

  })  : super(key: key);

  final String gideceksayfa;
  final Color ikonrenk;
  final Color ikonarkarenk;
  final Color ButonRenk;
  final IconData ikon;
  final String metin;
  final double genislik;
  final double topright;
  final double topleft;
  final double bottomright;
  final double bottomleft;

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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: ikonarkarenk,
                foregroundColor: ikonrenk,
                child: Icon(ikon),
              ),
              SizedBox(width: 10,),
              Text(metin,style: MenuSiyahKalin,),
            ],
          ),
          width: genislik,height: 70,
          decoration: BoxDecoration(
            color: ButonRenk,
            borderRadius: BorderRadius.only(
              topRight:  Radius.circular(topright),bottomLeft: Radius.circular(bottomleft),
              topLeft:  Radius.circular(topleft),bottomRight: Radius.circular(bottomright),
            )
          ),
        ));
  }
}
