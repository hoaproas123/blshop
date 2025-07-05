
import 'package:blshop/core/base_response.dart';
import 'package:blshop/modules/detail_order/model/detail_order_model.dart';
import 'package:blshop/modules/detail_order/provider/detail_order_provider.dart';
import 'package:blshop/modules/home/model/home_model.dart';



class DetailOrderRepository {
  final DetailOrderProvider detailOrderProvider;

  DetailOrderRepository({required this.detailOrderProvider});

  Future<BaseResponse?> loadOrders(DetailOrderModel detailOrderModel) =>
      detailOrderProvider.loadOrders(detailOrderModel);

  Future<BaseResponse?> loadCustomers(DetailOrderModel detailOrderModel) =>
      detailOrderProvider.loadCustomers(detailOrderModel);
}
