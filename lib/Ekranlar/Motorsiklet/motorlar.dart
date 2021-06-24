import 'package:deneme2/Utils/utils.dart';
import 'package:flutter/material.dart';
import '../../Services/motorapi.dart';
class MotorPage extends StatefulWidget {
  @override
  _MotorPageState createState() => _MotorPageState();
}

class _MotorPageState extends State<MotorPage> {

  TextEditingController fiyatctr=TextEditingController();
  Future<void> motorgetir() async{
    await getMotor();
  }
  @override
  void initState() {
      super.initState();
  }
  Future<Null> _refreshData() async {
    await Future.delayed(Duration(seconds: 3));
    getMotor();
    setState(() {
    });
  }
  Future<Null> _refreshData2() async {
    await Future.delayed(Duration(milliseconds: 1500));
    motorgetir();
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: Text('Motorlar'),
        leading: IconButton(
        onPressed: (){
          Navigator.pushNamed(context, '/home');
        },icon: Icon(Icons.arrow_back_ios),
      ),bottom: PreferredSize(child: Column(
        children: [
          Text('Çift tıklayarak fiyatı değiştirebilirsin.'),
          SizedBox(height: 8,)
        ],
      ),preferredSize: Size.fromHeight(15),),
      ),

      body: FutureBuilder(
            future: getMotor(),
              builder: (BuildContext context,AsyncSnapshot snapshot){
              if(snapshot.connectionState==ConnectionState.waiting){
                return Center(child: CircularProgressIndicator());
              }
              return RefreshIndicator(
                onRefresh: _refreshData,
                child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onDoubleTap: () {
                          return  showDialog(
                              context: context,
                              builder: (BuildContext context){
                                return AlertDialog(backgroundColor: Colors.orange.shade700,
                                    title: Text(
                                      "Motorun Fiyatını Değiştirin ",style: TextStyle(
                                        color: Colors.white
                                    ),
                                      textAlign: TextAlign.center,
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(8.0))),
                                    content: Container(
                                        height: 150,
                                        decoration: BoxDecoration(
                                          color: Colors.orange.shade700,
                                        ),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 10.0,right: 10),
                                              child: TextFormField(controller: fiyatctr,decoration: InputDecoration(
                                                  labelText: 'Fiyat',border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))
                                              ),),
                                            ),
                                            SizedBox(height: 20,),
                                            GestureDetector(
                                              onTap: ()async {
                                                await motorGuncelle(snapshot.data[index].MotorID, int.parse(fiyatctr.text));
                                                fiyatctr.text='';
                                                _refreshData2();
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "Tamam",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ))); }
                          );
                        },
                        child: Card(
                          color: Colors.grey.shade900,
                          child: ListTile(
                            title: Text(snapshot.data[index].MotorMarka,style: BeyazText,),
                            subtitle: Text(snapshot.data[index].MotorModel,style: BeyazText),
                            trailing: Text(snapshot.data[index].Fiyat.toString()+' \$',style: BeyazText),

                          ),
                        ),
                      );
                    }),
              );

          }
          ),
    );
  }
}
