import 'dart:convert';

class ListProductModel{
  int? selectIndex;
  final String title;
  final List<ProductModel> listProductModel;

  ListProductModel({
    this.selectIndex = 0,
    required this.title,
    required this.listProductModel
  });
}

class ProductModel {
  String? imageBanner;
  String? sku;
  String? uid;
  String? name;
  String? urlKey;
  String? stockStatus;
  int? id;
  String? metaDescription;
  String? metaTitle;
  String? newFromDate;
  String? newToDate;
  int? ratingSummary;
  int? reviewCount;
  Thumbnail? thumbnail;
  Thumbnail? image;
  PriceRange? priceRange;
  String? color;
  String? countryOfManufacture;
  String? dailySale;
  RatingSummaryStart? ratingSummaryStart;
  AttributeNew? attributeNew;

  ProductModel.fromJson(Map<String, dynamic> json) {
    imageBanner = json['image_banner'];
    sku = json['sku'];
    uid = json['uid'];
    name = json['name'];
    urlKey = json['url_key'];
    stockStatus = json['stock_status'];
    id = json['id'];
    metaDescription = json['meta_description'];
    metaTitle = json['meta_title'];
    newFromDate = json['new_from_date'];
    newToDate = json['new_to_date'];
    ratingSummary = json['rating_summary'];
    reviewCount = json['review_count'];
    thumbnail =
    json['thumbnail'] != null ? Thumbnail.fromJson(json['thumbnail']) : null;
    image = json['image'] != null ? Thumbnail.fromJson(json['image']) : null;
    priceRange = json['price_range'] != null
        ? PriceRange.fromJson(json['price_range'])
        : null;
    color = json['color']?.toString();
    countryOfManufacture = json['country_of_manufacture'];
    dailySale = json['daily_sale'];
    ratingSummaryStart = json['rating_summary_start'] != null
        ? RatingSummaryStart.fromJson(json['rating_summary_start'])
        : null;
    attributeNew = json['attribute_new'] != null
        ? AttributeNew.fromJson(json['attribute_new'])
        : null;
  }
}

class Thumbnail {
  String? url;
  int? position;
  Thumbnail.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    position = json['position'];
  }
}

class PriceRange {
  MaximumPrice? maximumPrice;
  MaximumPrice? minimumPrice;

  PriceRange();

  PriceRange.fromJson(Map<String, dynamic> json) {
    maximumPrice = json['maximum_price'] != null
        ? MaximumPrice.fromJson(json['maximum_price'])
        : null;
    minimumPrice = json['minimum_price'] != null
        ? MaximumPrice.fromJson(json['minimum_price'])
        : null;
  }
}

class MaximumPrice {
  Discount? discount;
  PriceValue? finalPrice;
  PriceValue? regularPrice;

  MaximumPrice.fromJson(Map<String, dynamic> json) {
    discount =
    json['discount'] != null ? Discount.fromJson(json['discount']) : null;
    finalPrice = json['final_price'] != null
        ? PriceValue.fromJson(json['final_price'])
        : null;
    regularPrice = json['regular_price'] != null
        ? PriceValue.fromJson(json['regular_price'])
        : null;
  }
}

class Discount {
  int? amountOff;
  int? percentOff;


  Discount.fromJson(Map<String, dynamic> json) {
    amountOff = json['amount_off'];
    percentOff = json['percent_off'];
  }
}

class PriceValue {
  String? currency;
  double? value;

  PriceValue.fromJson(Map<String, dynamic> json) {
    currency = json['currency'];
    value =
    (json['value'] is int) ? (json['value'] as int).toDouble() : json['value'];
  }
}

class RatingSummaryStart {
  int? star1;
  int? star2;
  int? star3;
  int? star4;
  int? star5;

  RatingSummaryStart.fromJson(Map<String, dynamic> json) {
    star1 = json['star_1'];
    star2 = json['star_2'];
    star3 = json['star_3'];
    star4 = json['star_4'];
    star5 = json['star_5'];
  }
}

class AttributeNew {
  String? prepayNew;
  String? percentNew;
  String? priceOriginalNew;
  String? buyupPriceNew;
  String? renewContentNew;
  String? brandNew;
  String? categoryForProductNew;
  String? isPreOrderNew;
  String? subsidyNew;
  String? buybackPriceNew;
  List<ConfigRenewNew>? configRenewNew;
  
  AttributeNew.fromJson(Map<String, dynamic> json) {
    prepayNew = json['prepay_new'];
    percentNew = json['percent_new'];
    priceOriginalNew = json['price_original_new'];
    buyupPriceNew = json['buyup_price_new'];
    renewContentNew = json['renew_content_new'];
    brandNew = json['brand_new'];
    categoryForProductNew = json['category_for_product_new'];
    isPreOrderNew = json['is_pre_order_new'];
    subsidyNew = json['subsidy_new'];
    buybackPriceNew = json['buyback_price_new'];

    // decode chuỗi JSON trong config_renew_new
    if (json['config_renew_new'] != null) {
      final List parsed = jsonDecode(json['config_renew_new']);
      configRenewNew = parsed.map((e) => ConfigRenewNew.fromJson(e)).toList();
    }
  }
}

class ConfigRenewNew {
  String? recordId;
  String? type;
  String? accessoriesWarranty;
  String? percent;
  String? price;
  String? priceBachlong;
  String? initialize;

  ConfigRenewNew.fromJson(Map<String, dynamic> json) {
    recordId = json['record_id'];
    type = json['type'];
    accessoriesWarranty = json['accessories_warranty'];
    percent = json['percent'];
    price = json['price'];
    priceBachlong = json['price_bachlong'];
    initialize = json['initialize'];
  }
}
