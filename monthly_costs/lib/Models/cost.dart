class Cost {
  String id;
  String name;
  String avarage;
  String paymentMethod;

  Cost({
    required this.id,
    required this.name,
    required this.avarage,
    required this.paymentMethod,
  });

  Cost.fromJson(Map<String, dynamic> json)
      : id = json['id'].toString(),
        name = json['name'].toString(),
        avarage = json['imagem'].toString(),
        paymentMethod = json['paymentMethod'].toString();
}
