import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:timesheet/data/Userprovider.dart';

import '../model/user.dart';

class UserRepository {
  final UserProvider userProvider;
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  UserRepository(this.userProvider);

  Future<void> addUser(User user) async {
    DocumentReference docRef = await userCollection.add(user.toJson());
    user.id = docRef.id;
  }

  Future<void> updateUser(User user) async {
    await userCollection.doc(user.id).update(user.toJson());
  }

  Future<void> deleteUser(User user) async {
    await userCollection.doc(user.id).delete();
  }

  Future<User?> fetchUser() async {
    // Assuming there's only one user document in the collection
    QuerySnapshot snapshot = await userCollection.limit(1).get();
    if (snapshot.docs.isNotEmpty) {
      return User.fromSnapshot(snapshot.docs.first);
    }
    return null;
  }
}
