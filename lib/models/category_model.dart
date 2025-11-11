class CategoryModel {
  int? id;
  String? name;
  String? iconImage;
  String? image;
  String? metaTitle;
  String? displayMode;
  String? urlKey;
  String? urlPath;
  String? path;
  String? contentHot;
  String? description;
  int? position;
  int? show;
  int? checkShowCategoryInPage;
  int? isShowCategorySlider;
  String? childrenCount;
  List<CategoryModel>? children;

  CategoryModel({
    this.id,
    this.name,
    this.description,
    this.childrenCount,
});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    iconImage = json['icon_image'];
    image = json['image'];
    metaTitle = json['meta_title'];
    displayMode = json['display_mode'];
    urlKey = json['url_key'];
    urlPath = json['url_path'];
    path = json['path'];
    contentHot = json['content_hot'];
    description = json['description'];
    position = json['position'];
    show = json['show'];
    checkShowCategoryInPage = json['check_show_category_in_page'];
    isShowCategorySlider = json['is_show_category_slider'];
    childrenCount = json['children_count']?.toString();

    if (json['children'] != null) {
      children = <CategoryModel>[];
      json['children'].forEach((v) {
        children!.add(CategoryModel.fromJson(v));
      });
    }
  }
}