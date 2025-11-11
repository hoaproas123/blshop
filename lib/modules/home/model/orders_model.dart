import 'package:blshop/modules/home/model/orders_detail_model.dart';

class OrderModel {
  int? id;
  String? code;
  DateTime? purchaseDate;
  int? branchId;
  String? branchName;
  int? soldById;
  String? soldByName;
  int? customerId;
  String? customerCode;
  String? customerName;
  double? total;
  double? totalPayment;
  double? discount;
  int? status;
  String? statusValue;
  int? retailerId;
  bool? usingCod;
  DateTime? modifiedDate;
  DateTime? createdDate;
  int? priceBookId;
  String? extra;
  List<OrderDetail>? orderDetails;

  OrderModel({
    this.id,
    this.code,
    this.purchaseDate,
    this.branchId,
    this.branchName,
    this.soldById,
    this.soldByName,
    this.customerId,
    this.customerCode,
    this.customerName,
    this.total,
    this.totalPayment,
    this.discount,
    this.status,
    this.statusValue,
    this.retailerId,
    this.usingCod,
    this.modifiedDate,
    this.createdDate,
    this.priceBookId,
    this.extra,
    this.orderDetails,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      code: json['code'],
      purchaseDate: json['purchaseDate'] != null ? DateTime.parse(json['purchaseDate']) : null,
      branchId: json['branchId'],
      branchName: json['branchName'],
      soldById: json['soldById'],
      soldByName: json['soldByName'],
      customerId: json['customerId'],
      customerCode: json['customerCode'],
      customerName: json['customerName'],
      total: (json['total'] as num?)?.toDouble(),
      totalPayment: (json['totalPayment'] as num?)?.toDouble(),
      discount: (json['discount'] as num?)?.toDouble(),
      status: json['status'],
      statusValue: json['statusValue'],
      retailerId: json['retailerId'],
      usingCod: json['usingCod'],
      modifiedDate: json['modifiedDate'] != null ? DateTime.parse(json['modifiedDate']) : null,
      createdDate: json['createdDate'] != null ? DateTime.parse(json['createdDate']) : null,
      priceBookId: json['PriceBookId'],
      extra: json['Extra'],
      orderDetails: (json['orderDetails'] as List<dynamic>?)
          ?.map((e) => OrderDetail.fromJson(e))
          .toList(),
    );
  }
}