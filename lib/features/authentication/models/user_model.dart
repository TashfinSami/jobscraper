class UserModel {
  String firstName;
  String lastName;

  UserModel({
    required this.firstName,
    required this.lastName,
  });

  String get fullName => '$firstName $lastName';

  static UserModel empty() => UserModel(firstName: '', lastName: '');

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      firstName: data['firstName'] as String,
      lastName: data['lastName'] as String,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is UserModel && runtimeType == other.runtimeType && firstName == other.firstName && lastName == other.lastName;

  @override
  int get hashCode => firstName.hashCode ^ lastName.hashCode;
}
