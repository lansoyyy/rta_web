import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future addUser(fname, lname, email, type, badge, position, station, gender,
    username, id) async {
  final docUser = FirebaseFirestore.instance.collection('Users').doc(id);

  final json = {
    'fname': fname,
    'lname': lname,
    'email': email,
    'type': type,
    'badge': badge,
    'position': position,
    'station': station,
    'gender': gender,
    'username': username,
    'uid': id,
    'dateTime': DateTime.now(),
    'id': docUser.id
  };

  await docUser.set(json);
}
