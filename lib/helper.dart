import 'package:firebase_database/firebase_database.dart';

// variables
bool isAdmin = false;

// database
final databaseReference = FirebaseDatabase.instance.reference();

void createData() {
  databaseReference
      .child("items")
      .set({'name': 'Deepak Nishad', 'description': 'Team Lead'});
}
