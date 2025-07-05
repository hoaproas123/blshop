import 'package:blshop/core/base_response.dart';
import 'package:blshop/modules/login/model/login_model.dart';
import 'package:get/get.dart';
import '../../../services/http_provider.dart';

class LoginProvider extends GetConnect {


  final HttpProvider http;

  LoginProvider({required this.http});

  Future<BaseResponse?> loadOrders(LoginModel loginModel) async {
    return await http.doGet(loginModel.url??"", null).then((response) {
      return BaseResponse(
          statusCode: response.statusCode,
          responseStatus: response.statusMessage,
          status: response.data['status'].toString(),
          data: (response.data['total'] != 0)
              ? response.data['data'][0]
              : {},
          message:
              response.data['message'] ?? "");
    }).catchError((onError) {
      return BaseResponse(responseStatus: onError.toString(), statusCode: 400);
    });
  }
}
