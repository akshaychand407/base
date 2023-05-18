import 'package:json_annotation/json_annotation.dart';
import '../model/user/user.dart';
part 'sign_in_response.g.dart';

@JsonSerializable()
class SignInResponse {
  SignInResponse({
    required this.code,
    required this.message,
    required this.data,
  });
  @JsonKey(name: 'code')
  late final int code;
  @JsonKey(name: 'message')
  late final String message;
  @JsonKey(name: 'data')
  late final User? data;

  factory SignInResponse.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignInResponseToJson(this);
}
