class CostValue {
  String id;
  String costId;
  double value;
  String month;

  CostValue({
    required this.id,
    required this.costId,
    required this.value,
    required this.month,
  });

  toJson() {
    return {'id': id, 'costId': costId, 'value': value, 'month': month};
  }

  CostValue.fromJson(Map<String, dynamic> json)
      : id = json['id'].toString(),
        costId = json['costId'].toString(),
        value = json['value'].toDouble(),
        month = json['month'].toString();
}
