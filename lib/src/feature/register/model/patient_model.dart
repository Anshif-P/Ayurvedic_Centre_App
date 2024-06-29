import 'package:intl/intl.dart';

class PatientModel {
  final String name;
  final String treatmentName;
  final String date;
  final String username;

  PatientModel({
    required this.name,
    required this.treatmentName,
    required this.date,
    required this.username,
  });

  factory PatientModel.fromJson(Map<String, dynamic> json) {
    print(json); // Debugging to see the structure of incoming JSON

    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    DateTime? dateAndTime = DateTime.tryParse(json['date_nd_time'] ?? '');

    // Handle cases where 'patientdetails_set' might be empty or null
    String treatmentName = '';
    if (json['patientdetails_set'] != null &&
        json['patientdetails_set'].isNotEmpty) {
      treatmentName = json['patientdetails_set'][0]['treatment_name'] ?? '';
    }

    return PatientModel(
      name: json['name'] ?? '',
      treatmentName: treatmentName,
      date: dateAndTime != null ? formatter.format(dateAndTime) : '',
      username: json['user'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'treatment_name': treatmentName,
      'date': date,
      'username': username,
    };
  }
}
