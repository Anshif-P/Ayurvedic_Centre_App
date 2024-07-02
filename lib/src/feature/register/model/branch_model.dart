class BranchModel {
  final int id;
  final String name;
  final String location;

  BranchModel({
    required this.id,
    required this.name,
    required this.location,
  });

  factory BranchModel.fromJson(Map<String, dynamic> json) {
    return BranchModel(
      id: json['id'],
      name: json['name'],
      location: json['location'],
    );
  }
}
