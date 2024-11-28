class AuthResponseModel {
  final bool status;
  final String? message;
  final UserData? data;

  AuthResponseModel({
    required this.status,
    this.message,
    this.data,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? UserData.fromJson(json['data']) : null,
    );
  }
}

class UserData {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String image;
  final String token;
  final int points;
  final int credit;

  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.token,
    required this.points,
    required this.credit,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      image: json['image'] ?? '',
      token: json['token'],
      points: json['points'] ?? 0,
      credit: json['credit'] ?? 0,
    );
  }
}
