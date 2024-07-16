import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  String firstname;
  String lastname;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;

  UserModel({
    this.id = '',
    required this.firstname,
    required this.lastname,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  //Helper function to get the full name
  String get fullName => '$firstname $lastname';

  static List<String> nameParts(fullname) => fullname.split(' ');

  //function to generate username from full name
  static String generateUsername(fullname) {
    List<String> nameParts = fullname.split(' ');
    String firstname = nameParts[0].toLowerCase();
    String lastname = nameParts.length > 1 ? nameParts[1].toLowerCase() : '';
    String camelCaseUsername = '$firstname$lastname';
    String usernameWithPrefix = "ss_$camelCaseUsername";
    return usernameWithPrefix;
  }

  //empty user model
  factory UserModel.empty() {
    return UserModel(
      id: '',
      firstname: '',
      lastname: '',
      username: '',
      email: '',
      phoneNumber: '',
      profilePicture: '',
    );
  }

  //convert model to JSON structure for storing data in firebase
  Map<String, dynamic> toJson() {
    return {
      'Firstname': firstname,
      'Lastname': lastname,
      'Username': username,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
    };
  }

  //from json
  factory UserModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    if (snapshot.data() != null) {
      final data = snapshot.data()!;
      return UserModel(
        id: snapshot.id,
        firstname: data['Firstname'] ?? '',
        lastname: data['Lastname'] ?? '',
        username: data['Username'] ?? '',
        email: data['Email'] ?? '',
        phoneNumber: data['PhoneNumber'] ?? '',
        profilePicture: data['ProfilePicture' ?? ''],
      );
    } else {
      return UserModel.empty();
    }
  }
}
