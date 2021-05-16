import 'package:firebase_database/firebase_database.dart';

class User {
  String userId;
  String email;
  String phoneNumber;

  User(this.userId, this.phoneNumber, this.email);

  User.fromSnapshot(DataSnapshot snapshot)
      : userId = snapshot.value["userId"],
        phoneNumber = snapshot.value["phoneNumber"],
        email = snapshot.value["email"];

  toJson() {
    return {"userId": userId, "phoneNumber": phoneNumber, "email": email};
  }
}
