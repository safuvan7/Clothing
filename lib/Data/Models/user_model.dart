import 'package:app_project/Utils/device/formatter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  String firstname;
  String lastname;
  final String username;
  final String email;
  String phone;
  final String password;
  final DateTime createdAt;

  // constructor for user model
  UserModel({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.username,
    required this.email,
    required this.phone,
    required this.password,
    required this.createdAt
  });

  // helper function to get the full name
  String get fullName => '$firstname $lastname';

  // helper function to format phone number
  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phone);

  // static function to split full name into first and last name
  static List<String> nameParts(fullName) => fullName.split(" ");

  // Static function to generate to username from the full name
  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername = "$firstName$lastName";
    String usernameWithPrefix = "cwt_$camelCaseUsername";
    return usernameWithPrefix;
  }

  static UserModel empty() => UserModel(
      id: '',
      firstname: '',
      lastname: '',
      username: '',
      email: '',
      phone: '',
      password: '',
      createdAt: DateTime.now(),
  );

  // factory method to create a UserModel from a firebase document snapshot.
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    if (doc.data() != null){
      final data = doc.data() as Map<String, dynamic> ;
      return UserModel(
        id: doc.id,
        firstname: data['Firstname'] ?? '',
        lastname: data['Lastname'] ?? '',
        username: data['Username'] ?? '',
        email: data['Email'] ?? '',
        phone: data['Phone'] ?? '',
        password: data['Password'] ?? '',
        createdAt: (data['CreatedAt'] as Timestamp).toDate(),

      );
    } else {
      return UserModel.empty();
    }
  }

  // Convert model to json structure for string data in firebase
  Map<String, dynamic> toJson() {
    return {
      'Username': username,
      'Email': email,
      'Phone': phone,
      'Password': password,
      'Firstname' : firstname,
      'Lastname' : lastname,
      'CreatedAt' : Timestamp.fromDate(createdAt),
    };
  }
}
