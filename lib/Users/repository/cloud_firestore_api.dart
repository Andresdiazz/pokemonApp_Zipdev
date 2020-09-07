import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/user.dart';

class CloudFirestoreAPI {
  final String USERS = "users";

  final Firestore _db = Firestore.instance;

  void updateUserData(User user) async {
    DocumentReference ref = _db.collection(USERS).document(user.uid);
    return ref.setData({
      'uid': user.uid,
      'email': user.email,
      'name': user.name,
      'lastSignIn': DateTime.now()
    }, merge: true);
  }
}
