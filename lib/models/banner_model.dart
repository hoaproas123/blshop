import 'package:blshop/models/detail_banner_model.dart';

class BannerModel {
  String? title;
  String? identifier;
  List<DetailBannerModel>? banner;

  BannerModel({this.title, this.identifier, this.banner});

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      title: json['title'],
      identifier: json['identifier'],
      banner: (json['Banner']['items'] as List?)
          ?.map((item) => DetailBannerModel.fromJson(item))
          .toList(),
    );
  }
}