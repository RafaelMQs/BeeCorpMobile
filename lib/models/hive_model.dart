class HiveModel {
  final String hiveId;
  final String userId;
  final String hiveCode;
  final String hiveWeight;
  final String hiveStatus;
  final String hiveCreationDate;

  HiveModel(this.hiveId, this.userId, this.hiveCode, this.hiveWeight,
      this.hiveStatus, this.hiveCreationDate);

  Map<String, String> toMap() => {
        'hiveId': hiveId,
        'userId': userId,
        'hiveCode': hiveCode,
        'hiveWeight': hiveWeight,
        'hiveStatus': hiveStatus,
        'hiveCreationDate': hiveCreationDate,
      };

  factory HiveModel.fromMap(Map map) => HiveModel(
      map['hiveId'],
      map['userId'],
      map['hiveCode'],
      map['hiveWeight'],
      map['hiveStatus'],
      map['hiveCreationDate']);
}
