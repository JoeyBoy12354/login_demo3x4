class UserModel {
  final String id;
  final String email;

  UserModel({
    required this.id,
    required this.email,
  });

  factory UserModel.fromFirebase(dynamic user) {
    return UserModel(
      id: user.uid,
      email: user.email,
    );
  }
}
