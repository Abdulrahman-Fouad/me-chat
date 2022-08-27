class UserModel {
  final String name;
  final String uId;
  final String profilePic;
  final String phoneNumber;
  final bool isOnline;
  final List<dynamic> groupId;

  UserModel({
    required this.name,
    required this.uId,
    required this.profilePic,
    required this.phoneNumber,
    required this.isOnline,
    required this.groupId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'uId': uId,
      'profilePic': profilePic,
      'phoneNumber': phoneNumber,
      'isOnline': isOnline,
      'groupId': groupId,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      uId: map['uId'] as String,
      profilePic: map['profilePic'] as String,
      phoneNumber: map['phoneNumber'] as String,
      isOnline: map['isOnline'] as bool,
      groupId: List<dynamic>.from(
        (map['groupId'] as List<dynamic>),
      ),
    );
  }
}
