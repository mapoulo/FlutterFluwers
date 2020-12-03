import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flowers/models/flowers.dart';
import 'package:flowers/models/user.dart';

class Database{

  String uid;
  Database({this.uid});

  final CollectionReference userCollection = Firestore.instance.collection("Users");
  final CollectionReference flowersColection = Firestore.instance.collection("Flowers");

  Future updateData(String name, String surname)async{
    await userCollection.document(uid).setData({
      "name": name,
      "surname": surname
    });
  }

  UserData _getUserData(DocumentSnapshot snapshot){
    return UserData(
      uid: uid,
      name: snapshot.data["name"],
      surname: snapshot.data["surname"]
    );
  }


  List<Flowers> _getFlowers(QuerySnapshot snapshot){
    return snapshot.documents.map((doc) {
      return Flowers(
        name: doc.data['name'] ?? 'name',
        image: doc.data['flower'] ?? 'flower'
      );
    }).toList();
  }

  Stream<List<Flowers>> get flowerStream{
    return flowersColection.snapshots().map(_getFlowers);
  }

 Stream<UserData> get userData{
   return userCollection.document(uid).snapshots().map(_getUserData);
 }
 
}