class UserModel {
  final String uid;
  final String name;
  final String email;
  final String profilePicUrl;
  final String? phone;
  final String? city;
  final String? bio;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.profilePicUrl,
     this.bio,
     this.city,
     this.phone
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'profilePicUrl': profilePicUrl,
      'bio': bio,
      'city': city,
      'phone': phone

    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      profilePicUrl: map['profilePicUrl'] ?? '',
      phone: map['phone'] ?? '0000000',
      bio: map['bio'] ?? 'kissan',
      city: map['city'] ?? 'RYK'
    );
  }
}
