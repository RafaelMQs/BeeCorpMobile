class HiveModel {
  final String hiveId;
  final String userId;
  final String hiveCode;
  final String hiveWeight;
  final String hiveStatus;

  HiveModel(this.hiveId, this.userId, this.hiveCode, this.hiveWeight,
      this.hiveStatus);

  Map<String, String> toMap() => {
        'hiveId': hiveId,
        'userId': userId,
        'hiveCode': hiveCode,
        'hiveWeight': hiveWeight,
        'hiveStatus': hiveStatus
      };

  factory HiveModel.fromMap(Map map) => HiveModel(
        map['hiveId'],
        map['userId'],
        map['hiveCode'],
        map['hiveWeight'],
        map['hiveStatus'],
      );
}
