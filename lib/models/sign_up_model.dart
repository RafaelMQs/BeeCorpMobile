class SignUpModel {
  final String userName;
  final String userEmail;
  final String userPassword;
  final String userPhone;
  final String userZipCode;
  final String userAddress;

  SignUpModel(this.userName, this.userEmail, this.userPassword, this.userPhone,
      this.userZipCode, this.userAddress);

  Map<String, String> toMap() => {
        'userName': userName,
        'userEmail': userEmail,
        'userPassword': userPassword,
        'userPhone': userPhone,
        'userZipCode': userZipCode,
        'userAddress': userAddress
      };

  factory SignUpModel.fromMap(Map map) => SignUpModel(
      map['userName'],
      map['userEmail'],
      map['userPassword'],
      map['userPhone'],
      map['userZipCode'],
      map['userAddress']);
}
