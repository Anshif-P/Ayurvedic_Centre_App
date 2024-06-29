import 'package:flutter/material.dart';
import 'package:noviindus_machine_task/src/feature/register/model/patient_model.dart';
import 'package:noviindus_machine_task/src/resources/local/shared_pref_model.dart';
import 'package:noviindus_machine_task/src/resources/repository/patient_repo.dart';
import 'package:noviindus_machine_task/src/util/snack_bar/snack_bar.dart';

class PatinetsProvider extends ChangeNotifier {
  bool isLoading = false;
  List<PatientModel> patientList = [];
  void getPatientsList(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    final token = SharedPrefModel.instance.getData('token');
    final data = await PatientRepository().getPatients(token);
    data.fold((error) {
      isLoading = false;
      notifyListeners();
      CustomSnackBar.showSnackBar(context, error.message);
    }, (response) {
      List patient = response['patient'];
      patientList = patient.map((e) => PatientModel.fromJson(e)).toList();
      isLoading = false;
      notifyListeners();
    });
  }
}
