import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_app/models/user_model.dart';

class FirebaseFunctions {
  static CollectionReference<UserModel> getUserCollection() {
   return FirebaseFirestore.instance.collection('User').withConverter<UserModel>(
      fromFirestore: (snapshot, _) {
        return UserModel.fromJson(snapshot.data()!);
      },
      toFirestore: (userModel, _) {
        return userModel.toJson();
      },
    );
  }

   void addUser(UserModel model){
    var collection=getUserCollection();
    var docRef=collection.doc();
    model.id=docRef.id;
    docRef.set(model);
  }

  static Stream<QuerySnapshot<UserModel>>getUser(){
    var collection=getUserCollection();
    return collection.snapshots();
  }
}
