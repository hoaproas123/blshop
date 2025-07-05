class OrderDetail {
  int? productId;
  String? productCode;
  String? productName;
  bool? isMaster;
  int? quantity;
  double? price;
  double? discount;
  double? discountRatio;
  String? note;
  double? viewDiscount;

  OrderDetail({
    this.productId,
    this.productCode,
    this.productName,
    this.isMaster,
    this.quantity,
    this.price,
    this.discount,
    this.discountRatio,
    this.note,
    this.viewDiscount,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) {
    return OrderDetail(
      productId: json['productId'],
      productCode: json['productCode'],
      productName: json['productName'],
      isMaster: json['isMaster'],
      quantity: json['quantity'],
      price: (json['price'] as num?)?.toDouble(),
      discount: (json['discount'] as num?)?.toDouble(),
      discountRatio: (json['discountRatio'] as num?)?.toDouble(),
      note: json['note'],
      viewDiscount: (json['viewDiscount'] as num?)?.toDouble(),
    );
  }
}