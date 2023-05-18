// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String?,
      token: json['token'] as String?,
      tokenExpires: json['tokenExpires'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      contactNo: json['contactNo'] as String?,
      empCode: json['empCode'] as String?,
      role: json['role'] as String?,
      sapEmployee: json['sapEmployee'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'token': instance.token,
      'tokenExpires': instance.tokenExpires,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'contactNo': instance.contactNo,
      'empCode': instance.empCode,
      'role': instance.role,
      'sapEmployee': instance.sapEmployee,
      'email': instance.email,
    };
