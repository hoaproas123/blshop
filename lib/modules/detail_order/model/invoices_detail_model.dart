class InvoicesDetail {
  int? productId;
  String? productCode;
  String? productName;
  int? categoryId;
  String? categoryName;
  int? quantity;
  double? price;
  double? discount;
  int? discountRatio;
  bool? usePoint;
  double? subTotal;
  String? note;
  String? serialNumbers;
  int? returnQuantity;
  int? tradeMarkId;
  String? tradeMarkName;

  InvoicesDetail({
    this.productId,
    this.productCode,
    this.productName,
    this.categoryId,
    this.categoryName,
    this.quantity,
    this.price,
    this.discount,
    this.discountRatio,
    this.usePoint,
    this.subTotal,
    this.note,
    this.serialNumbers,
    this.returnQuantity,
    this.tradeMarkId,
    this.tradeMarkName,
  });

  InvoicesDetail.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    productCode = json['productCode'];
    productName = json['productName'];
    categoryId = json['categoryId'];
    categoryName = json['categoryName'];
    quantity = json['quantity'];
    price = (json['price'] as num?)?.toDouble();
    discount = (json['discount'] as num?)?.toDouble();
    discountRatio = json['discountRatio'];
    usePoint = json['usePoint'];
    subTotal = (json['subTotal'] as num?)?.toDouble();
    note = json['note'];
    serialNumbers = json['serialNumbers'];
    returnQuantity = json['returnQuantity'];
    tradeMarkId = json['tradeMarkId'];
    tradeMarkName = json['tradeMarkName'];
  }
}