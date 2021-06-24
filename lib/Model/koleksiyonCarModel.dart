class KoleksiyonCar {
  int id;
  String collecCarMarka;
  String ureticiFirma;
  String kimden;
  String collecCarFiyat;

  KoleksiyonCar({this.collecCarMarka, this.ureticiFirma,this.kimden, this.collecCarFiyat});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["marka"] = collecCarMarka;
    map["firma"] = ureticiFirma;
    map["kimden"] = kimden;
    map["fiyat"] = collecCarFiyat;
    return map;
  }

  KoleksiyonCar.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    collecCarMarka = map["marka"];
    ureticiFirma = map["firma"];
    kimden = map["kimden"];
    collecCarFiyat = map["fiyat"];
  }
}