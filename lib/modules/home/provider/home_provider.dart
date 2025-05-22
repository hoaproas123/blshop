import 'package:blshop/core/base_response.dart';
import 'package:blshop/modules/home/model/home_model.dart';
import 'package:get/get.dart';
import '../../../services/http_provider.dart';

class HomeProvider extends GetConnect {


  final HttpProvider http;

  HomeProvider({required this.http});

  Future<BaseResponse?> loadData(HomeModel homeModel) async {
    return await http.doGet(homeModel.url??"", null).then((response) {
      return BaseResponse(
          statusCode: response.statusCode,
          responseStatus: response.statusMessage,
          status: response.data['status'].toString(),
          data: response.data ?? {},
          message:
              response.data['message'] ?? "");
    }).catchError((onError) {
      return BaseResponse(responseStatus: onError.toString(), statusCode: 400);
    });
  }
}
