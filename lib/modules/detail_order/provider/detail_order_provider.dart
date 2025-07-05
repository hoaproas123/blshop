import 'package:blshop/core/base_response.dart';
import 'package:blshop/modules/detail_order/model/detail_order_model.dart';
import 'package:get/get.dart';
import '../../../services/http_provider.dart';

class DetailOrderProvider extends GetConnect {


  final HttpProvider http;

  DetailOrderProvider({required this.http});

  Future<BaseResponse?> loadOrders(DetailOrderModel detailOrderModel) async {
    return await http.doGet(detailOrderModel.url??"", null).then((response) {
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

  Future<BaseResponse?> loadCustomers(DetailOrderModel detailOrderModel) async {
    return await http.doGet(detailOrderModel.url??"", null).then((response) {
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
