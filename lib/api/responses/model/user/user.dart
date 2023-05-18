import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  User({
    this.id,
    this.token,
    this.tokenExpires,
    this.firstName,
    this.lastName,
    this.contactNo,
    this.empCode,
    this.role,
    this.sapEmployee,
    this.email,
  });

  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'token')
  String? token;
  @JsonKey(name: 'tokenExpires')
  String? tokenExpires;
  @JsonKey(name: 'firstName')
  String? firstName;
  @JsonKey(name: 'lastName')
  String? lastName;
  @JsonKey(name: 'contactNo')
  String? contactNo;
  @JsonKey(name: 'empCode')
  String? empCode;
  @JsonKey(name: 'role')
  String? role;
  @JsonKey(name: 'sapEmployee')
  String? sapEmployee;
  @JsonKey(name: 'email')
  String? email;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
