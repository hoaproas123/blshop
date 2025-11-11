
import 'package:blshop/core/base_response.dart';
import 'package:blshop/modules/login/model/login_model.dart';
import 'package:blshop/modules/login/provider/login_provider.dart';



class LoginRepository {
  final LoginProvider loginProvider;

  LoginRepository({required this.loginProvider});

  Future<BaseResponse?> loadOrders(LoginModel loginModel) =>
      loginProvider.loadOrders(loginModel);

}
