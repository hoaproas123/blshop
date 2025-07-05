
import 'package:blshop/core/base_response.dart';
import 'package:blshop/modules/home/model/home_model.dart';
import 'package:blshop/modules/home/provider/home_provider.dart';



class HomeRepository {
  final HomeProvider homeProvider;

  HomeRepository({required this.homeProvider});

  Future<BaseResponse?> loadOrders(HomeModel homeModel) =>
      homeProvider.loadOrders(homeModel);

  Future<BaseResponse?> loadCustomers(HomeModel homeModel) =>
      homeProvider.loadCustomers(homeModel);

  Future<BaseResponse?> loadIdCustomers(HomeModel homeModel) =>
      homeProvider.loadIdCustomers(homeModel);

  Future<BaseResponse?> loadVouchers() =>
      homeProvider.loadVouchers();

  Future<BaseResponse?> loadStoreAdress() =>
      homeProvider.loadStoreAddress();

  Future<BaseResponse?> loadBanner() =>
      homeProvider.loadBanner();

  Future<BaseResponse?> loadCategory() =>
      homeProvider.loadCategory();

  Future<BaseResponse?> loadProductFromCategoryId(int id) =>
      homeProvider.loadProductFromCategoryId(id);
}
