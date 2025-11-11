import 'package:blshop/services/utils.dart';

class StoreAddressModel {
  int? cityId;
  String? city;
  String? countryCode;
  String? description;
  String? district;
  int? districtId;
  String? email;
  String? fax;
  String? maps;
  String? name;
  String? postcode;
  int? sliderId;
  String? sortDescription;
  int? sortOrder;
  String? street;
  String? telephone1;
  String? telephone2;
  String? ward;
  int? wardId;


  StoreAddressModel.fromJson(Map<String, dynamic> json){
    city = json['city'];
    cityId = json['city_id'];
    countryCode = json['country_code'];
    description = json['description'];
    district = json['district'];
    districtId = json['district_id'];
    email = json['email'];
    fax = json['fax'];
    maps = json['maps'];
    name = json['name'];
    postcode = json['postcode'];
    sliderId = json['slider_id'];
    sortDescription = json['sort_description'];
    sortOrder = json['sort_order'];
    street = json['street'];
    telephone1 = json['telephone_1'];
    telephone2 = json['telephone_2'];
    ward = json['ward'];
    wardId = json['ward_id'];
  }
}