class VoucherModel {
  String? urlKey;
  String? code;
  String? couponType;
  String? currency;
  String? description;
  num? discountAmount;
  String? fromDate;
  bool? isActive;
  num? maxDiscount;
  String? name;
  int? ruleId;
  String? simpleAction;
  String? toDate;
  int? usesPerCustomer;

  VoucherModel.fromJson(Map<String, dynamic> json) {
    urlKey = json['url_key'];
    code = json['code'];
    couponType = json['coupon_type'];
    currency = json['currency'];
    description = json['description'];
    discountAmount = json['discount_amount'];
    fromDate = json['from_date'];
    isActive = json['is_active'];
    maxDiscount = json['max_discount'];
    name = json['name'];
    ruleId = json['rule_id'];
    simpleAction = json['simple_action'];
    toDate = json['to_date'];
    usesPerCustomer = json['uses_per_customer'];
  }
}