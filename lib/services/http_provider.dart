import 'package:blshop/core/token_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
class HttpProvider  {
  final Dio httpClient;
  HttpProvider({required this.httpClient});

  Future<String?> getToken() async {
    final existingToken = await TokenStorage.getValidAccessToken();
    if (existingToken != null) {
      return existingToken;
    }
    try {
      final response = await Dio().post(
        '${dotenv.env['ACCESS_TOKEN_URL']}',
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
            'Retailer': 'blshop',
          },
        ),
        data: {
          'grant_type': 'client_credentials',
          'client_id': '${dotenv.env['CLIENT_ID']}',
          'client_secret': '${dotenv.env['CLIENT_SECRET']}',
          'scope': 'PublicApi.Access',
        },
      );

      final token = response.data['access_token'];
      final expiresIn = response.data['expires_in']; // Thường là số giây (e.g. 3600)
      await TokenStorage.saveToken(token, expiresIn);
      return token;
    } catch (e) {
      print('❌ Lỗi lấy token: $e');
    }
  }
  Future<Response> doGet(String url, dynamic data) async {
    String? accessToken=await getToken();
    var endpoint = dotenv.env['BASEURL'].toString() + url;
    return httpClient.get(
      endpoint,
      data: data,
      options: Options(
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Bearer $accessToken',
          'Retailer': 'blshop',
        },
      ),
    );

  }
  Future<Response> doPostWithGraphSQL(dynamic query, {dynamic variables}) async {
    var endpoint = dotenv.env['GRAPHSQL_DATA_URL'].toString() ;
    return httpClient.post(
      endpoint,
      data: {
        'query': query,
        if (variables != null) 'variables': variables,
      },
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
        validateStatus: (status) => status != null && status < 600, // không throw lỗi
      ),
    );

  }
}
