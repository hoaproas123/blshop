
import 'package:blshop/modules/detail_order/model/invoices_detail_model.dart';

class InvoicesModel {
  int? id;
  String? uuid;
  String? code;
  DateTime? purchaseDate;
  int? branchId;
  String? branchName;
  int? soldById;
  String? soldByName;
  int? customerId;
  String? customerCode;
  String? customerName;
  int? orderId;
  String? orderCode;
  double? total;
  double? totalPayment;
  double? discount;
  int? discountRatio;
  int? status;
  String? statusValue;
  String? description;
  bool? usingCod;
  DateTime? createdDate;
  List<InvoicesDetail>? invoiceDetails;

  InvoicesModel({
    this.id,
    this.uuid,
    this.code,
    this.purchaseDate,
    this.branchId,
    this.branchName,
    this.soldById,
    this.soldByName,
    this.customerId,
    this.customerCode,
    this.customerName,
    this.orderId,
    this.orderCode,
    this.total,
    this.totalPayment,
    this.discount,
    this.discountRatio,
    this.status,
    this.statusValue,
    this.description,
    this.usingCod,
    this.createdDate,
    this.invoiceDetails,
  });

  InvoicesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    code = json['code'];
    purchaseDate = json['purchaseDate'] != null ? DateTime.parse(json['purchaseDate']) : null;
    branchId = json['branchId'];
    branchName = json['branchName'];
    soldById = json['soldById'];
    soldByName = json['soldByName'];
    customerId = json['customerId'];
    customerCode = json['customerCode'];
    customerName = json['customerName'];
    orderId = json['orderId'];
    orderCode = json['orderCode'];
    total = (json['total'] as num?)?.toDouble();
    totalPayment = (json['totalPayment'] as num?)?.toDouble();
    discount = (json['discount'] as num?)?.toDouble();
    discountRatio = json['discountRatio'];
    status = json['status'];
    statusValue = json['statusValue'];
    description = json['description'];
    usingCod = json['usingCod'];
    createdDate = json['createdDate'] != null ? DateTime.parse(json['createdDate']) : null;
    invoiceDetails = json['invoiceDetails'] != null
        ? (json['invoiceDetails'] as List).map((e) => InvoicesDetail.fromJson(e)).toList()
        : [];
  }
}