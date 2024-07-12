class UserModel {
  final String id;
  String firstname;
  String lastname;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;

  UserModel({
    required this.id,
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
}
