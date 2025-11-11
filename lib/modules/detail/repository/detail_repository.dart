
import 'package:blshop/core/base_response.dart';
import 'package:blshop/modules/detail/provider/detail_provider.dart';



class DetailRepository {
  final DetailProvider detailProvider;

  DetailRepository({required this.detailProvider});

  Future<BaseResponse?> loadDetailProductFromUrl(String url) =>
      detailProvider.loadDetailProductFromUrl(url);


}
