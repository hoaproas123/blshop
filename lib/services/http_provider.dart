import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HttpProvider  {
  final Dio httpClient;

  HttpProvider({required this.httpClient});

  Future<Response> doGet(String url, dynamic data) {
    var endpoint = dotenv.env['BASEURL'].toString() + url;
    return httpClient.get(
      endpoint,
      data: data,
      options: Options(
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Bearer ${dotenv.env['TOKEN'].toString()}',
          'Retailer': 'blshop',
        },
      ),
    );

  }
}
