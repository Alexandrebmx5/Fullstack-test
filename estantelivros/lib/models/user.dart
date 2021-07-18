
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class UserUser extends ChangeNotifier {

  UserUser({this.email, this.password, this.name, this.id});

  UserUser.fromDocument(DocumentSnapshot document){
    id = document.id;
    name = document.get('name') as String;
    email = document.get('email') as String;
  }

  String id;
  String name;
  String email;
  String password;

  String confirmPassword;

  DocumentReference get firestoreRef =>
      FirebaseFirestore.instance.doc('users/$id');

  bool _loading = false;
  bool get loading => _loading;
  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> saveData() async {
    await firestoreRef.set(toMap());
  }

  Map<String, dynamic> toMap(){
    return {
      'name': name,
      'email': email,
    };
  }

  Future<void> save() async {
    loading = true;

    if (id == null) {
      final doc = await firestoreRef.collection('users').add(toMap());
      id = doc.id;
    } else {
      await firestoreRef.update(toMap());
    }
    loading = false;
  }

  @override
  String toString() {
    return 'User{id: $id, name: $name, email: $email, password: $password, confirmPassword: $confirmPassword}';
  }
}