import 'package:firebase_auth/firebase_auth.dart';
import 'package:flowers/models/user.dart';
import 'package:flowers/screens/services/database.dart';

class Authentication{

  FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebase(FirebaseUser user){
     return user == null ? null : User(uid: user.uid);
  }

   Stream<User> get userStream{
     return _auth.onAuthStateChanged.map((FirebaseUser user) => _userFromFirebase(user));
   }


  Future logIn(String email, String password)async{
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      _userFromFirebase(user);
    }catch(e){
      print(e.toString());
    }
  }

  Future register(String email, String password)async{
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      await Database(uid: user.uid).updateData("New User", "Surname");
      _userFromFirebase(user);
      print("Register method called");
    }catch(e){
      print(e.toString());
    }
  }


  Future logOut()async{
    try{
      _auth.signOut();
    }catch(e){
      print(e.toString());
    }
  }

}