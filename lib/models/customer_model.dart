class CustomerModel {
  int? id;
  String? code;
  String? name;
  String? contactNumber;
  String? subNumber;
  String? address;
  int? retailerId;
  int? branchId;
  String? locationName;
  String? wardName;
  DateTime? modifiedDate;
  DateTime? createdDate;
  int? type;
  String? organization;
  String? taxCode;
  String? comments;
  String? groups;
  double? debt;
  double? totalInvoiced;
  double? totalRevenue;
  int? totalPoint;
  int? rewardPoint;

  CustomerModel({
    this.id,
    this.code,
    this.name,
    this.contactNumber,
    this.subNumber,
    this.address,
    this.retailerId,
    this.branchId,
    this.locationName,
    this.wardName,
    this.modifiedDate,
    this.createdDate,
    this.type,
    this.organization,
    this.taxCode,
    this.comments,
    this.groups,
    this.debt,
    this.totalInvoiced,
    this.totalRevenue,
    this.totalPoint,
    this.rewardPoint,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      id: json['id'],
      code: json['code'],
      name: json['name'],
      contactNumber: json['contactNumber'],
      subNumber: json['subNumber'],
      address: json['address'],
      retailerId: json['retailerId'],
      branchId: json['branchId'],
      locationName: json['locationName'],
      wardName: json['wardName'],
      modifiedDate: json['modifiedDate'] != null ? DateTime.parse(json['modifiedDate']) : null,
      createdDate: json['createdDate'] != null ? DateTime.parse(json['createdDate']) : null,
      type: json['type'],
      organization: json['organization'],
      taxCode: json['taxCode'],
      comments: json['comments'],
      groups: json['groups'],
      debt: (json['debt'] as num?)?.toDouble(),
      totalInvoiced: (json['totalInvoiced'] as num?)?.toDouble(),
      totalRevenue: (json['totalRevenue'] as num?)?.toDouble(),
      totalPoint: json['totalPoint'],
      rewardPoint: json['rewardPoint'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'name': name,
      'contactNumber': contactNumber,
      'subNumber': subNumber,
      'address': address,
      'retailerId': retailerId,
      'branchId': branchId,
      'locationName': locationName,
      'wardName': wardName,
      'modifiedDate': modifiedDate?.toIso8601String(),
      'createdDate': createdDate?.toIso8601String(),
      'type': type,
      'organization': organization,
      'taxCode': taxCode,
      'comments': comments,
      'groups': groups,
      'debt': debt,
      'totalInvoiced': totalInvoiced,
      'totalRevenue': totalRevenue,
      'totalPoint': totalPoint,
      'rewardPoint': rewardPoint,
    };
  }
}