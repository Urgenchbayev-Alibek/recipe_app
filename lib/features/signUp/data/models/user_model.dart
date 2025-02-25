class UserModel {
  final String firstName, lastName, userName, email, password, phoneNumber;
  final DateTime dateOfBirth;

  UserModel( {
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.password,
    required this.dateOfBirth,
    required this.phoneNumber,
  }
  );

  Map<String, dynamic> toJson(UserModel model){
    return{
      "userName": userName,
      "fullName": "$firstName, $lastName",
      "email": email,
      "phoneNumber": phoneNumber,
      "birthDate": "${dateOfBirth.year}-${dateOfBirth.month}-${dateOfBirth.day}",
      "password": password,
    };
  }
}
