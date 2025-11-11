class DetailModel {
  String? typename;
  List<ConfigurableOption>? configurableOptions;
  ConfigurableProductOptionsSelection? configurableProductOptionsSelection;
  List<Variant>? variants;
  List<CustomOptionModel>? options;
  List<AccessoryModel>? accessoriesBoughtTogether;
  List<UpsellProductModel>? upsellProducts;
  List<dynamic>? oldProducts;
  List<dynamic>? relatedProducts;
  List<dynamic>? crosssellProducts;
  int? installmentProducts;
  int? attributeSetId;
  String? canonicalUrl;
  String? color;
  int? id;
  String? manufacturer;
  String? metaDescription;
  String? metaKeyword;
  String? metaTitle;
  String? name;
  String? optionsContainer;
  String? percent;
  int? ratingSummary;
  int? reviewCount;
  String? sku;
  String? stockStatus;
  String? typeId;
  String? uid;
  String? updatedAt;
  String? urlKey;
  String? urlPath;
  List<ProductImage>? mediaGallery;
  ProductImage? image;
  PriceRange? priceRange;
  HtmlContent? shortDescription;
  HtmlContent? description;
  ProductImage? smallImage;
  ProductImage? thumbnail;
  String? imageBanner;
  String? imageBannerRenew;
  List<Attribute>? attributes;

  DetailModel();

  DetailModel.fromJson(Map<String, dynamic> json) {
    typename = json['__typename'];
    configurableOptions = (json['configurable_options'] as List?)
        ?.map((e) => ConfigurableOption.fromJson(e))
        .toList();
    configurableProductOptionsSelection =
    json['configurable_product_options_selection'] != null
        ? ConfigurableProductOptionsSelection.fromJson(
        json['configurable_product_options_selection'])
        : null;
    variants = (json['variants'] as List?)
        ?.map((e) => Variant.fromJson(e))
        .toList();
    options = (json['options'] as List?)?.map((e) =>
        CustomOptionModel.fromJson(e)).toList();
    accessoriesBoughtTogether = (json['accessories_bought_together'] as List?)
        ?.map((e) => AccessoryModel.fromJson(e))
        .toList();
    upsellProducts = (json['upsell_products'] as List?)?.map((e) =>
        UpsellProductModel.fromJson(e)).toList();
    oldProducts = json['old_products'];
    relatedProducts = json['related_products'];
    crosssellProducts = json['crosssell_products'];
    installmentProducts = json['Installment_products'];
    attributeSetId = json['attribute_set_id'];
    canonicalUrl = json['canonical_url'];
    color = json['color'];
    id = json['id'];
    manufacturer = json['manufacturer'];
    metaDescription = json['meta_description'];
    metaKeyword = json['meta_keyword'];
    metaTitle = json['meta_title'];
    name = json['name'];
    optionsContainer = json['options_container'];
    percent = json['percent'];
    ratingSummary = json['rating_summary'];
    reviewCount = json['review_count'];
    sku = json['sku'];
    stockStatus = json['stock_status'];
    typeId = json['type_id'];
    uid = json['uid'];
    updatedAt = json['updated_at'];
    urlKey = json['url_key'];
    urlPath = json['url_path'];
    mediaGallery = (json['media_gallery'] as List?)?.map((e) => ProductImage.fromJson(e)).toList();
    image = json['image'] != null ? ProductImage.fromJson(json['image']) : null;
    priceRange = json['price_range'] != null ? PriceRange.fromJson(json['price_range']) : null;
    shortDescription = json['short_description'] != null ? HtmlContent.fromJson(json['short_description']) : null;
    description = json['description'] != null ? HtmlContent.fromJson(json['description']) : null;
    smallImage = json['small_image'] != null ? ProductImage.fromJson(json['small_image']) : null;
    thumbnail = json['thumbnail'] != null ? ProductImage.fromJson(json['thumbnail']) : null;
    imageBanner = json['image_banner'];
    imageBannerRenew = json['image_banner_renew'];
    attributes = (json['attributes'] as List?)?.map((e) =>
        Attribute.fromJson(e)).toList();
  }
}
class ConfigurableOption {
  String? label;
  String? attributeCode;
  String? uid;
  String? attributeUid;
  List<ConfigurableOptionValue>? values;

  ConfigurableOption();

  ConfigurableOption.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    attributeCode = json['attribute_code'];
    uid = json['uid'];
    attributeUid = json['attribute_uid'];
    values = (json['values'] as List?)
        ?.map((e) => ConfigurableOptionValue.fromJson(e))
        .toList();
  }
}

class ConfigurableOptionValue {
  String? defaultLabel;
  String? label;
  String? uid;
  SwatchData? swatchData;

  ConfigurableOptionValue();

  ConfigurableOptionValue.fromJson(Map<String, dynamic> json) {
    defaultLabel = json['default_label'];
    label = json['label'];
    uid = json['uid'];
    swatchData = json['swatch_data'] != null
        ? SwatchData.fromJson(json['swatch_data'])
        : null;
  }
}

class SwatchData {
  String? typename;
  String? value;

  SwatchData();

  SwatchData.fromJson(Map<String, dynamic> json) {
    typename = json['__typename'];
    value = json['value'];
  }
}

class ConfigurableProductOptionsSelection {
  String? typename;
  List<ConfigurableOptionSelection>? configurableOptions;

  ConfigurableProductOptionsSelection();

  ConfigurableProductOptionsSelection.fromJson(Map<String, dynamic> json) {
    typename = json['__typename'];
    configurableOptions = (json['configurable_options'] as List?)
        ?.map((e) => ConfigurableOptionSelection.fromJson(e))
        .toList();
  }
}

class ConfigurableOptionSelection {
  String? attributeCode;
  String? label;
  String? uid;
  List<OptionValueSelection>? values;

  ConfigurableOptionSelection();

  ConfigurableOptionSelection.fromJson(Map<String, dynamic> json) {
    attributeCode = json['attribute_code'];
    label = json['label'];
    uid = json['uid'];
    values = (json['values'] as List?)
        ?.map((e) => OptionValueSelection.fromJson(e))
        .toList();
  }
}

class OptionValueSelection {
  String? typename;
  String? uid;
  String? label;
  bool? isUseDefault;
  bool? isAvailable;

  OptionValueSelection();

  OptionValueSelection.fromJson(Map<String, dynamic> json) {
    typename = json['__typename'];
    uid = json['uid'];
    label = json['label'];
    isUseDefault = json['is_use_default'];
    isAvailable = json['is_available'];
  }
}

class Variant {
  List<Attribute>? attributes;
  Product? product;

  Variant();

  Variant.fromJson(Map<String, dynamic> json) {
    attributes = (json['attributes'] as List?)
        ?.map((e) => Attribute.fromJson(e))
        .toList();
    product =
    json['product'] != null ? Product.fromJson(json['product']) : null;
  }
}

class Attribute {
  String? code;
  String? attributeCode;
  String? label;
  String? uid;
  int? valueIndex;
  String? value;

  Attribute();

  Attribute.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    attributeCode = json['attribute_code'];
    label = json['label'];
    uid = json['uid'];
    valueIndex = json['value_index'];
    value = json['value'];
  }
}

class Product {
  String? typename;
  String? sku;
  String? name;
  dynamic dailySale;
  ProductImage? image;
  PriceRange? priceRange;
  ProductImage? smallImage;
  String? urlKey;

  Product();

  Product.fromJson(Map<String, dynamic> json) {
    typename = json['__typename'];
    sku = json['sku'];
    name = json['name'];
    dailySale = json['daily_sale'];
    image = json['image'] != null ? ProductImage.fromJson(json['image']) : null;
    priceRange = json['price_range'] != null
        ? PriceRange.fromJson(json['price_range'])
        : null;
    smallImage = json['small_image'] != null
        ? ProductImage.fromJson(json['small_image'])
        : null;
    urlKey = json['url_key'];
  }
}

class ProductImage {
  String? typename;
  bool? disabled;
  String? label;
  int? position;
  String? url;

  ProductImage();

  ProductImage.fromJson(Map<String, dynamic> json) {
    typename = json['__typename'];
    disabled = json['disabled'];
    label = json['label'];
    position = json['position'];
    url = json['url'];
  }
}

class PriceRange {
  ProductPrice? maximumPrice;
  ProductPrice? minimumPrice;

  PriceRange();

  PriceRange.fromJson(Map<String, dynamic> json) {
    maximumPrice = json['maximum_price'] != null
        ? ProductPrice.fromJson(json['maximum_price'])
        : null;
    minimumPrice = json['minimum_price'] != null
        ? ProductPrice.fromJson(json['minimum_price'])
        : null;
  }
}

class ProductPrice {
  String? typename;
  ProductDiscount? discount;
  Money? finalPrice;
  Money? regularPrice;

  ProductPrice();

  ProductPrice.fromJson(Map<String, dynamic> json) {
    typename = json['__typename'];
    discount = json['discount'] != null
        ? ProductDiscount.fromJson(json['discount'])
        : null;
    finalPrice = json['final_price'] != null
        ? Money.fromJson(json['final_price'])
        : null;
    regularPrice = json['regular_price'] != null
        ? Money.fromJson(json['regular_price'])
        : null;
  }
}

class ProductDiscount {
  String? typename;
  int? amountOff;
  double? percentOff;

  ProductDiscount();

  ProductDiscount.fromJson(Map<String, dynamic> json) {
    typename = json['__typename'];
    amountOff = json['amount_off'];
    percentOff = (json['percent_off'] as num?)?.toDouble();
  }
}

class Money {
  String? typename;
  String? currency;
  num? value;

  Money();

  Money.fromJson(Map<String, dynamic> json) {
    typename = json['__typename'];
    currency = json['currency'];
    value = json['value'];
  }
}

class CustomOptionModel {
  int? optionId;
  bool? required;
  int? sortOrder;
  String? title;
  String? uid;
  List<CustomOptionValueModel>? value;

  CustomOptionModel();

  CustomOptionModel.fromJson(Map<String, dynamic> json) {
      optionId = json['option_id'];
      required = json['required'];
      sortOrder = json['sort_order'];
      title = json['title'];
      uid = json['uid'];
      value = (json['value'] as List?)?.map((e) => CustomOptionValueModel.fromJson(e)).toList();
  }
}

class CustomOptionValueModel {
  int? optionTypeId;
  int? price;
  String? priceType;
  String? title;
  int? sortOrder;
  String? uid;

  CustomOptionValueModel();

  CustomOptionValueModel.fromJson(Map<String, dynamic> json) {
      optionTypeId = json['option_type_id'];
      price = json['price'];
      priceType = json['price_type'];
      title = json['title'];
      sortOrder = json['sort_order'];
      uid = json['uid'];
  }
}

class AccessoryModel {
  AttributeNew? attributeNew;
  int? id;
  String? name;
  int? ratingSummary;
  int? reviewCount;
  String? sku;
  String? uid;
  String? urlKey;
  ProductImage? image;
  PriceRange? priceRange;
  String? imageBanner;
  String? imageBannerRenew;

  AccessoryModel();

  AccessoryModel.fromJson(Map<String, dynamic> json) {
      attributeNew = json['attribute_new'] != null ? AttributeNew.fromJson(json['attribute_new']) : null;
      id = json['id'];
      name = json['name'];
      ratingSummary = json['rating_summary'];
      reviewCount = json['review_count'];
      sku = json['sku'];
      uid = json['uid'];
      urlKey = json['url_key'];
      image = json['image'] != null ? ProductImage.fromJson(json['image']) : null;
      priceRange = json['price_range'] != null ? PriceRange.fromJson(json['price_range']) : null;
      imageBanner = json['image_banner'];
      imageBannerRenew = json['image_banner_renew'];
  }
}
class AttributeNew {
  String? brandNew;
  String? buybackPriceNew;
  String? buyupPriceNew;
  String? categoryForProductNew;
  String? configRenewNew;
  String? isPreOrderNew;
  String? percentNew;
  String? prepayNew;
  String? priceOriginalNew;
  String? renewContentNew;
  String? subsidyNew;
  String? versionNew;

  AttributeNew();

  AttributeNew.fromJson(Map<String, dynamic> json) {
    brandNew = json['brand_new'];
    buybackPriceNew = json['buyback_price_new'];
    buyupPriceNew = json['buyup_price_new'];
    categoryForProductNew = json['category_for_product_new'];
    configRenewNew = json['config_renew_new'];
    isPreOrderNew = json['is_pre_order_new'];
    percentNew = json['percent_new'];
    prepayNew = json['prepay_new'];
    priceOriginalNew = json['price_original_new'];
    renewContentNew = json['renew_content_new'];
    subsidyNew = json['subsidy_new'];
    versionNew = json['version_new'];
  }
}
class HtmlContent {
  String? html;

  HtmlContent();

  factory HtmlContent.fromJson(Map<String, dynamic> json) {
    return HtmlContent()
      ..html = json['html'];
  }
}

class UpsellProductModel {
  AttributeNew? attributeNew;
  int? id;
  String? name;
  int? ratingSummary;
  int? reviewCount;
  String? sku;
  String? uid;
  String? urlKey;
  ProductImage? image;
  PriceRange? priceRange;
  String? imageBanner;
  String? imageBannerRenew;

  UpsellProductModel();

  UpsellProductModel.fromJson(Map<String, dynamic> json) {
    attributeNew = json['attribute_new'] != null ? AttributeNew.fromJson(json['attribute_new']) : null;

    id = json['id'];
    name = json['name'];
    ratingSummary = json['rating_summary'];
    reviewCount = json['review_count'];
    sku = json['sku'];
    uid = json['uid'];
    urlKey = json['url_key'];

    if (json['image'] != null) {
      ProductImage.fromJson(json['image']);
    }

    if (json['price_range'] != null) {
      PriceRange.fromJson(json['price_range']);
    }

    imageBanner = json['image_banner'];
    imageBannerRenew = json['image_banner_renew'];
  }
}
