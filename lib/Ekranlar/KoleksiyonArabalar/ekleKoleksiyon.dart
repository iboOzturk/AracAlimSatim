import 'package:deneme2/Utils/utils.dart';
import 'package:flutter/material.dart';

import '/Services/db_helper.dart';
import '/../Model/koleksiyonCarModel.dart';

class AddCollecCarPage extends StatelessWidget {
  final KoleksiyonCar koleksiyoncar;

  const AddCollecCarPage({Key key, @required this.koleksiyoncar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(child: SingleChildScrollView(child: KoleksiyonForm(koleksiyoncar: koleksiyoncar, child: AddCollecCarForm()))),
    );
  }
}

class KoleksiyonForm extends InheritedWidget {
  final KoleksiyonCar koleksiyoncar;

  KoleksiyonForm({Key key, @required Widget child, @required this.koleksiyoncar}) : super(key: key, child: child);

  static KoleksiyonForm of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<KoleksiyonForm>();
  }

  @override
  bool updateShouldNotify(KoleksiyonForm oldWidget) {
    return koleksiyoncar.id != oldWidget.koleksiyoncar.id;
  }
}

class AddCollecCarForm extends StatefulWidget {
  @override
  _AddCollecCarFormState createState() => _AddCollecCarFormState();
}

class _AddCollecCarFormState extends State<AddCollecCarForm> {
  final _formKey = GlobalKey<FormState>();
  DbHelper _dbHelper;

  @override
  void initState() {
    _dbHelper = DbHelper();
    super.initState();
  }

  final _markalar=["Mercedes","BMW","Audi"];
  String _marka=null;
  final _firmalar=["Norev","Motorart","KK Scale","Autoart","Bauer"];
  String _firma=null;
  final _kimdens=["Sahibinden","Mağazadan"];
  String _kimden=null;
  TextEditingController fiyatctr=TextEditingController();

  @override
  Widget build(BuildContext context) {
    KoleksiyonCar koleksiyoncar = KoleksiyonForm.of(context).koleksiyoncar;
    double uzunluk=MediaQuery.of(context).size.height;
    double genislik=MediaQuery.of(context).size.width;

    return Container( width: genislik,height: uzunluk,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.orange.shade400,Colors.orange.shade900,
            Colors.grey.shade400,Colors.grey.shade900,
          ],
                stops: [0.4,0.409,0.41,0.411],
              begin: Alignment.topLeft,end: Alignment.bottomRight
        )
      ),
      child: Form(
        key: _formKey,
        child: Column(mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 50,),
            Container(
              width: genislik-40,height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.black,width: 1)
              ),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Marka: ',style: BaslikSiyah1Text,),
                  DropdownButton<String>(
                    underline: Divider(height: 1,color: Colors.black,thickness: 1,),
                    icon: Icon(Icons.keyboard_arrow_down,color: Colors.black,),
                    value: _marka==null?_marka:koleksiyoncar.collecCarMarka,
                    items: _markalar.map((String str){
                      return DropdownMenuItem(
                          value: str,
                          child: Text(str));
                    }).toList(),
                    onChanged: (String str){
                      updateMarka(str);
                      koleksiyoncar.collecCarMarka=str;
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              width: genislik-40,height: 50,
              decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.black,width: 1)
              ),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Firma: ',style: BaslikSiyah1Text,),
                  DropdownButton<String>(
                    underline: Divider(height: 1,color: Colors.black,thickness: 1,),
                    icon: Icon(Icons.keyboard_arrow_down,color: Colors.black,),
                    value: _firma==null?_firma:koleksiyoncar.ureticiFirma,
                    items: _firmalar.map((String str){
                      return DropdownMenuItem(
                          value: str,
                          child: Text(str));
                    }).toList(),
                    onChanged: (String str){
                      updateFirma(str);
                      koleksiyoncar.ureticiFirma=str;
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              width: genislik-40,height: 50,
              decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.black,width: 1)
              ),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Kimden: ',style: BaslikSiyah1Text,),

                  DropdownButton<String>(
                    underline: Divider(height: 1,color: Colors.black,thickness: 1,),
                    icon: Icon(Icons.keyboard_arrow_down,color: Colors.black,),
                    value: _kimden,
                    items: _kimdens.map((String str){
                      return DropdownMenuItem(
                          value: str,
                          child: Text(str));
                    }).toList(),
                    onChanged: (String str){
                      updateKimden(str);
                      koleksiyoncar.kimden=str;
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              width: genislik-40,height: 50,
              decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.black,width: 1)
              ),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelStyle: BaslikSiyah1Text,
                  labelText: "Fiyat gir",border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                ),),
                controller: fiyatctr,
                cursorColor: Colors.black,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Fiyatı Doldur";
                  }
                },
                onSaved: (value) {
                  koleksiyoncar.collecCarFiyat = value;
                },
              ),
            ),
            SizedBox(height: 50,),
            RaisedButton(
              color: Color.fromARGB(255, 240, 248, 0),
              textColor: Colors.black,
              padding: EdgeInsets.only(left: 120,right: 120,top: 20,bottom: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),side: BorderSide(width: 2,color: Colors.white)
              ),
              child: Text("Ekle",textAlign: TextAlign.center,style: MenuSiyahKalin,),
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();

                  if (koleksiyoncar.id == null) {
                    await _dbHelper.insertCollecCar(koleksiyoncar);
                  } else {
                    await _dbHelper.updateCollecCar(koleksiyoncar);
                  }

                   Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text("${koleksiyoncar.collecCarMarka} Kaydedildi")),
                  );
                  _kimden=null;
                  fiyatctr.text='';
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>ContactPage()));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
  void updateMarka(String value) {
    String marka;
    switch (value) {
      case "Mercedes":
        marka='Mercedes';
        break;
      case "BMW":
        marka='BMW';
        break;
      case "Audi":
        marka='Audi';
        break;
      default:
    }
    print(marka);
    setState(() {
      _marka=marka;
    });
  }
  ///final _firmalar=["Norev","Motorart","KK Scale","Autoart","Bauer"];
  void updateFirma(String value) {
    String firma;
    switch (value) {
      case "Norev":
        firma='Norev';
        break;
      case "Motorart":
        firma='Motorart';
        break;
      case "KK Scale":
        firma='KK Scale';
        break;
      case "Autoart":
        firma='Autoart';
        break;
      case "Bauer":
        firma='Bauer';
        break;
      default:
    }
    print(firma);
    setState(() {
      _firma=firma;
    });
  }
  void updateKimden(String value) {
    String kimden;
    switch (value) {
      case "Sahibinden":
        kimden='Sahibinden';
        break;
      case "Mağazadan":
        kimden='Mağazadan';
        break;
      default:
    }
    print(kimden);
    setState(() {
      _kimden=kimden;
    });
  }


}
