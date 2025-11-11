import 'package:equatable/equatable.dart';

class BaseResponse extends Equatable {
  final String? status;
  final int? statusCode;
  final String? responseStatus;
  final data;
  final totalPage;
  final String? message;
  final Map<String, dynamic>? lang;

  BaseResponse(
      {this.status,
      this.statusCode,
      this.responseStatus,
      this.data,
      this.totalPage,
      this.message,
      this.lang,});

  Map<String, dynamic> toMap() {
    return {
      "status": status,
      "statusCode": statusCode,
      "data": data,
      "responseStatus": responseStatus,
      "message": message,
      "lang": lang,
    };
  }

  factory BaseResponse.fromMap(Map<String, dynamic> map) {
    return BaseResponse(
        statusCode: map['statusCode'],
        responseStatus: map['responseStatus'],
        status: map['error'],
        data: map['data'],
        message: map['message'],
        lang: map['lang']);
  }

  @override
  List<Object?> get props =>
      [status, statusCode, data, responseStatus, message, lang];
}
