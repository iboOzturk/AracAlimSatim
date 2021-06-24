import 'package:deneme2/Utils/utils.dart';
import 'package:flutter/material.dart';
import 'guncelleKoleksiyon.dart';
import 'ekleKoleksiyon.dart';
import '/Services/db_helper.dart';
import '../../Model/koleksiyonCarModel.dart';
import 'package:url_launcher/url_launcher.dart';

class SahibindenPage extends StatefulWidget {
  @override
  _SahibindenPageState createState() => _SahibindenPageState();
}

class _SahibindenPageState extends State<SahibindenPage> {
  DbHelper _dbHelper;

  @override
  void initState() {
    _dbHelper = DbHelper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: FutureBuilder(
        future: _dbHelper.getCollecCar('Sahibinden'),
        builder: (BuildContext context, AsyncSnapshot<List<KoleksiyonCar>> snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          if (snapshot.data.isEmpty) return Center(child: Text("Sahibindende ürün yok"));
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
                        content: Text("${koleksiyoncar.collecCarMarka} has been deleted"),
                        action: SnackBarAction(
                          label: "UNDO",
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
                        color: Colors.orange.shade700,shadowColor: Colors.orange,elevation: 15,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
                            topRight: Radius.circular(25),topLeft: Radius.circular(25)
                        ),side: BorderSide(color: Colors.black,width: 1)
                        ),
                        child: ListTile(
                          title: koleksiyoncar.collecCarMarka==null?Text('Boş'):Text(koleksiyoncar.collecCarMarka,style: SiyahText,),
                          subtitle: Container(
                            child: Text(koleksiyoncar.ureticiFirma,style: SiyahText),
                          ),
                          trailing:Text(koleksiyoncar.collecCarFiyat,style: SiyahText),
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