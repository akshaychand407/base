import 'package:json_annotation/json_annotation.dart';
part 'no_data_response.g.dart';

@JsonSerializable()
class NoDataResponse {
  NoDataResponse({
    required this.code,
    required this.message,
    required this.data,
  });
  @JsonKey(name: 'code')
  late final int code;
  @JsonKey(name: 'message')
  late final String message;
  @JsonKey(name: 'data')
  List<dynamic> data;

  factory NoDataResponse.fromJson(Map<String, dynamic> json) =>
      _$NoDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NoDataResponseToJson(this);
}
