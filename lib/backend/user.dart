import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

UserCredential? currentUser;
List<String>? titles;
List<String>? description;
List<String>? videos;
List<String>? usernames;
List<DateTime>? date;
List<int>? supports;

int fireStoreSize = 0;
final FirebaseAuth auth = FirebaseAuth.instance;
final FirebaseFirestore store = FirebaseFirestore.instance;

class Data {
  CollectionReference posts = store.collection("posts");
  String ide = store.collection('posts').id;
}
