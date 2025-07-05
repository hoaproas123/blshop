class DetailOrderModel  {
  String? url;

  DetailOrderModel({
    this.url,
  });

  factory DetailOrderModel.initial() {
    return DetailOrderModel(url: '',);
  }

}
