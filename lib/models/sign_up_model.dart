class SignUpModel {
  final String userId;
  final String userName;
  final String userEmail;
  final String userPassword;
  final String userPhone;
  final String userZipCode;
  final String userAddress;

  SignUpModel(this.userId, this.userName, this.userEmail, this.userPassword,
      this.userPhone, this.userZipCode, this.userAddress);

  Map<String, String> toMap() => {
        'userId': userId,
        'userName': userName,
        'userEmail': userEmail,
        'userPassword': userPassword,
        'userPhone': userPhone,
        'userZipCode': userZipCode,
        'userAddress': userAddress
      };

  factory SignUpModel.fromMap(Map map) => SignUpModel(
      map['userId'],
      map['userName'],
      map['userEmail'],
      map['userPassword'],
      map['userPhone'],
      map['userZipCode'],
      map['userAddress']);
}
