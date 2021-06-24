import 'package:deneme2/Utils/utils.dart';
import 'package:flutter/material.dart';
import 'guncelleKoleksiyon.dart';
import 'ekleKoleksiyon.dart';
import '/Services/db_helper.dart';
import '../../Model/koleksiyonCarModel.dart';
import 'package:url_launcher/url_launcher.dart';

class MagazadanPage extends StatefulWidget {
  @override
  _MagazadanPageState createState() => _MagazadanPageState();
}

class _MagazadanPageState extends State<MagazadanPage> {
  DbHelper _dbHelper;

  @override
  void initState() {
    _dbHelper = DbHelper();
    _dbHelper.getCollecCar('Mağazadan');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 111, 0),
      body: FutureBuilder(
        future: _dbHelper.getCollecCar('Mağazadan'),
        builder: (BuildContext context, AsyncSnapshot<List<KoleksiyonCar>> snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          if (snapshot.data.isEmpty) return Center(child: Text("Mağazada ürün yok"));
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                KoleksiyonCar koleksiyoncar = snapshot.data[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditContactPage(
                          koleksiyoncar: koleksiyoncar,
                        ),
                      ),
                    );
                  },
                  child: Dismissible(
                    key: UniqueKey(),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      alignment: Alignment.centerRight,
                      color: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onDismissed: (direction) async {
                      await _dbHelper.removeCollecCar(koleksiyoncar.id);
                      setState(() {});
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text("${koleksiyoncar.collecCarMarka} silindi"),
                        action: SnackBarAction(
                          label: "Geri Al",textColor: Colors.white,
                          onPressed: () async {
                            await _dbHelper.insertCollecCar(koleksiyoncar);
                            setState(() {});
                          },
                        ),
                      ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Card(
                        color: Colors.grey.shade900,elevation: 10,shadowColor: Colors.grey.shade900,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(25),bottomLeft: Radius.circular(25)
                        ),side: BorderSide(color: Colors.white,width: 1)
                        ),
                        child: ListTile(
                          title: koleksiyoncar.collecCarMarka==null?Text('Boş'):Text(koleksiyoncar.collecCarMarka,style: BeyazText,),
                          subtitle: Container(
                            child: Text(koleksiyoncar.ureticiFirma,style: BeyazText),
                          ),
                          trailing:Text(koleksiyoncar.collecCarFiyat,style: BeyazText),
                        ),
                      ),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }

}