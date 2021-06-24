import 'package:deneme2/Utils/utils.dart';
import 'package:flutter/material.dart';


import '/Services/db_helper.dart';
import '../../Model/koleksiyonCarModel.dart';

class EditContactPage extends StatelessWidget {
  final KoleksiyonCar koleksiyoncar;

  const EditContactPage({Key key, @required this.koleksiyoncar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(onPressed: (){
        Navigator.pushNamed(context, '/koleksiyon');
      },icon: Icon(Icons.arrow_back_ios),),
        title: Text(koleksiyoncar.collecCarMarka),
      ),
      body: Container(
        color: Colors.grey.shade900,width: MediaQuery.of(context).size.width,
          child: KoleksiyonForm(
              koleksiyoncar: koleksiyoncar, child: EditContactForm()
          )
      ),
    );
  }
}

class KoleksiyonForm extends InheritedWidget {
  final KoleksiyonCar koleksiyoncar;

  KoleksiyonForm({Key key, @required Widget child, @required this.koleksiyoncar}) :
        super(key: key, child: child);

  static KoleksiyonForm of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<KoleksiyonForm>();
  }

  @override
  bool updateShouldNotify(KoleksiyonForm oldWidget) {
    return koleksiyoncar.id != oldWidget.koleksiyoncar.id;
  }
}

class EditContactForm extends StatefulWidget {
  @override
  _EditContactFormState createState() => _EditContactFormState();
}

class _EditContactFormState extends State<EditContactForm> {
  final _formKey = GlobalKey<FormState>();
  DbHelper _dbHelper;

  @override
  void initState() {
    _dbHelper = DbHelper();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    KoleksiyonCar koleksiyoncar = KoleksiyonForm.of(context).koleksiyoncar;

    return Column(mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Form(
          key: _formKey,
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(alignment: Alignment.center,
                width: 350,height: 250,color: Colors.orange.shade700,
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(koleksiyoncar.collecCarMarka+' \n'+koleksiyoncar.ureticiFirma,style: MenuSiyahKalin,),
                    SizedBox(height: 15,),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 70),
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            labelText: "Fiyat",labelStyle: SiyahText,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),)
                        ),
                        initialValue: koleksiyoncar.collecCarFiyat,
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
                  ],
                ),
              ),
             /*
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(hintText: "Fiyat"),
                  initialValue: koleksiyoncar.collecCarFiyat,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Fiyatı Doldur";
                    }
                  },
                  onSaved: (value) {
                    koleksiyoncar.collecCarFiyat = value;
                  },
                ),
              ), */
              RaisedButton(
                color: Colors.amber.shade400,
                textColor: Colors.white,
                child: Text("Güncelle"),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();

                    await _dbHelper.updateCollecCar(koleksiyoncar);
                    setState(() {

                    });
                    var snackBar = Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text("${koleksiyoncar.collecCarMarka} Kaydedildi")),
                    );

                   // Navigator.push(context, MaterialPageRoute(builder: (context)=>ContactPage()));
                  }
                },
              ),
              RaisedButton(

                color: Colors.red,
                textColor: Colors.white,
                child: Text("Sil"),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();

                    await _dbHelper.removeCollecCar(koleksiyoncar.id);
                    setState(() {

                    });
                    var snackBar = Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text("${koleksiyoncar.collecCarMarka} Silindi")),
                    );

                    snackBar.closed.then((onValue) {
                      Navigator.pop(context);
                    });
                  //  Navigator.push(context, MaterialPageRoute(builder: (context)=>ContactPage()));
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

}
