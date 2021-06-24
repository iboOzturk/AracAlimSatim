import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  ///giriş yap fonksiyonu
  Future<String> signIn({String email,  String password}) async {
    try{
      await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Hosgeldin";
    }on FirebaseAuthException catch(e){
      if(e.code=='user-not-found'){
        return 'Hesap Bulunamadı';
      }else if(e.code=='wrong-password'){
        return 'Şifre Yanlış';
      }

      return 'Hatalı giriş';
    }catch(e){
      return 'Hataaa: '+e.toString();
    }
  }

  ///çıkış yap fonksiyonu
  signOut() async {
    return await _auth.signOut();
  }

  ///kayıt ol fonksiyonu
  Future<String> signUp(
      {String name, String email, String password}) async {

    try{
      //DocumentReference documentReference=_firestore.doc(_auth.currentUser.uid);
      var user=
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await _firestore
          .collection("Kullanıcılar")
          .doc(user.user.uid)
          .set({'isim': name, 'email': email});
      return "Olusturuldu";
    }on FirebaseAuthException catch(e){
      if(e.code=='wrong-password'){
        return 'Sifre kotu';
      }else if(e.code=='email-already-in-use'){
        return 'Bu hesap zaten var ';
      }
    }
    catch(e){
      return "Hatalı Giris: "+e.toString();
    }
    return 'Hatalı giris';

  }

  ///Şifre sıfırlama fonksiyonu
  Future<String> resetPass({String email}) async{
    try{
      await _auth.sendPasswordResetEmail(email: email);
      return 'Email Gonderildi';
    }catch(e){
      return 'Hatali Giris';
    }
  }


}