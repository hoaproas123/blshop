
import 'package:blshop/core/base_response.dart';
import 'package:blshop/modules/category/provider/category_provider.dart';
import 'package:blshop/modules/home/model/home_model.dart';



class CategoryRepository {
  final CategoryProvider categoryProvider;

  CategoryRepository({required this.categoryProvider});

  Future<BaseResponse?> loadProductFromCategoryId(int id,{int page=1, String search=''}) =>
      categoryProvider.loadProductFromCategoryId(id,page: page,search: search);


}
