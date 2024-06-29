class BranchModel {
  final String name;
  final String location;

  BranchModel({
    required this.name,
    required this.location,
  });

  factory BranchModel.fromJson(Map<String, dynamic> json) {
    return BranchModel(
      name: json['name'],
      location: json['location'],
    );
  }
}
