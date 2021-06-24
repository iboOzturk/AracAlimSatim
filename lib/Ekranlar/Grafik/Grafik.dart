import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'indicator.dart';
import '../../Services/car_service.dart';
import '../../Utils/utils.dart';
import '../../Widgets/homebutton.dart';
class GrafikPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State {
  int touchedIndex = -1;
  CarService _carService=CarService();
  int bmwS;
  int mercoS;
  int audiS;
  int fordS;
  @override
  void initState() {
         //_carService.markaSay();
      super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: FutureBuilder(
        future: _carService.markaSay(),
        builder: (BuildContext context,AsyncSnapshot snapshot){
          bmwS=_carService.bmwC;
          mercoS=_carService.mercedesC;
          audiS=_carService.audiC;
          fordS=_carService.fordC;
          if(snapshot.connectionState==ConnectionState.waiting){
            //return Center(child: CircularProgressIndicator());
            return Container(
              alignment: Alignment.center,
                color: Colors.grey.shade900,child: Image.asset('assets/images/ozturkcarLogo2.png')
            );
          }

        return Container(alignment: Alignment.center,color: Colors.grey.shade900,
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('İkinci el en çok satan markalar',style: MenuBeyazKalin,),
              AspectRatio(
                aspectRatio: 1.3,
                child: Card(
                  color: Colors.orange.shade800,
                  child: Row(
                    children: <Widget>[
                      const SizedBox(
                        height: 18,
                      ),
                      Expanded(
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: PieChart(
                            PieChartData(
                              /*  pieTouchData: PieTouchData(touchCallback: (pieTouchResponse) {
                                  setState(() {
                                    final desiredTouch = pieTouchResponse.touchInput is! PointerExitEvent &&
                                        pieTouchResponse.touchInput is! PointerUpEvent;
                                    if (desiredTouch && pieTouchResponse.touchedSection != null) {
                                      touchedIndex = pieTouchResponse.touchedSection.touchedSectionIndex;
                                    } else {
                                      touchedIndex = -1;
                                    }
                                  });
                                }),*/
                                borderData: FlBorderData(
                                  show: false,
                                ),
                                sectionsSpace: 0,
                                centerSpaceRadius: 40,
                                sections: showingSections()),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  <Widget>[
                          Text('Marka sayıları;',style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                          SizedBox(
                            height: 4,
                          ),
                          Indicator(textColor: Colors.black,
                            color: Color(0xff0293ee),
                            text: 'BMW: '+bmwS.toString(),
                            isSquare: true,
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Indicator(textColor: Colors.black,
                            color: Color(0xfff8d700),
                            text: 'Mercedes: '+mercoS.toString(),
                            isSquare: true,
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Indicator(textColor: Colors.black,
                            color: Color(0xff845bef),
                            text: 'Audi: '+audiS.toString(),
                            isSquare: true,
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Indicator(textColor: Colors.black,
                            color: Color(0xff13d38e),
                            text: 'Ford: '+fordS.toString(),
                            isSquare: true,
                          ),
                          SizedBox(
                            height: 18,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 28,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              MenuButton(gideceksayfa: 'home', ikonrenk: Colors.black, ikonarkarenk: Colors.orange.shade700, ButonRenk: Colors.orange.shade700, ikon: Icons.home, metin: 'Geri Dön' , genislik: 150 , topleft: 30, bottomleft: 30, bottomright: 30, topright: 30)
            ],
          ),
        ); }
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: bmwS.toDouble(),
            title: 'BMW',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: Colors.black),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8d700),
            value: mercoS.toDouble(),
            title: 'Mercedes',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: Colors.black),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: audiS.toDouble(),
            title: 'Audi',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: Colors.black),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: fordS.toDouble(),
            title: 'Ford',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: Colors.black),
          );
        default:
          throw Error();
      }
    });
  }
}