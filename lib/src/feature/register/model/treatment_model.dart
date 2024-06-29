class TreatmentModel {
  final String name;

  TreatmentModel({
    required this.name,
  });

  factory TreatmentModel.fromJson(Map<String, dynamic> json) {
    return TreatmentModel(
      name: json['name'],
    );
  }
}
