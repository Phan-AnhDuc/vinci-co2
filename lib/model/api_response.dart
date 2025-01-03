import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> {
  final String? message;
  final T data;
  final String? code;

  ApiResponse({
    this.message,
    required this.data,
    this.code,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) => _$ApiResponseFromJson(json, fromJsonT);
}
