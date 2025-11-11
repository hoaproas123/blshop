class AttributeModel {
  AttributeModel({
    required this.attributeCode,
    this.text,
    this.symbol=" ",
    this.type="text",
  });
  String? text;
  List<String> attributeCode;
  String symbol;
  String? type;
}

