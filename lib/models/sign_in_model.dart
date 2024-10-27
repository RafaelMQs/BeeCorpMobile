class SignInModel {
  final String userId;
  final String userName;
  final String userEmail;
  final String userPhone;
  final String userZipCode;
  final String userAddress;

  SignInModel(this.userId, this.userName, this.userEmail, this.userPhone,
      this.userZipCode, this.userAddress);

  Map<String, String> toMap() => {
        'userId': userId,
        'userName': userName,
        'userEmail': userEmail,
        'userPhone': userPhone,
        'userZipCode': userZipCode,
        'userAddress': userAddress
      };

  factory SignInModel.fromMap(Map map) => SignInModel(
        map['userId'],
        map['userName'],
        map['userEmail'],
        map['userPhone'],
        map['userZipCode'],
        map['userAddress'],
      );
}
