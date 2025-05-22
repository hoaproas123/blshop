
import 'package:blshop/core/base_response.dart';
import 'package:blshop/modules/home/model/home_model.dart';
import 'package:blshop/modules/home/provider/home_provider.dart';



class HomeRepository {
  final HomeProvider homeProvider;

  HomeRepository({required this.homeProvider});

  Future<BaseResponse?> loadData(HomeModel homeModel) =>
      homeProvider.loadData(homeModel);
}
