class DetailBannerModel {
  int? bannerId;
  String? caption;
  String? link;
  String? media;
  String? mediaAlt;
  String? name;

  DetailBannerModel({
    this.bannerId,
    this.caption,
    this.link,
    this.media,
    this.mediaAlt,
    this.name,
  });

  DetailBannerModel.fromJson(Map<String, dynamic> json) {
    bannerId = json['banner_id'];
    caption = json['caption'];
    link = json['link'];
    media = json['media'];
    mediaAlt = json['media_alt'];
    name = json['name'];
  }
}