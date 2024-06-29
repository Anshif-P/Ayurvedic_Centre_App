import 'package:flutter/material.dart';
import 'package:noviindus_machine_task/src/feature/register/model/branch_model.dart';
import 'package:noviindus_machine_task/src/feature/register/model/treatment_model.dart';
import 'package:noviindus_machine_task/src/resources/local/shared_pref_model.dart';
import 'package:noviindus_machine_task/src/resources/repository/register_repo.dart';
import 'package:noviindus_machine_task/src/util/snack_bar/snack_bar.dart';

class RegisterProvider extends ChangeNotifier {
  bool isLoading = false;
  List<String> branches = [];
  List<String> treatments = [];
  String token = '';

  void getBranches(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    token = SharedPrefModel.instance.getData('token');
    final data = await RegisterRepository().getBranches(token);

    data.fold(
      (error) {
        isLoading = false;
        notifyListeners();
        CustomSnackBar.showSnackBar(context, error.message);
      },
      (response) {
        List tempResponse = response['branches'];
        List<BranchModel> branchList =
            tempResponse.map((e) => BranchModel.fromJson(e)).toList();

        branches = branchList.map((branch) => branch.name).toList();

        isLoading = false;
        notifyListeners();
      },
    );
  }

  void getTreatment(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    token = SharedPrefModel.instance.getData('token');
    final data = await RegisterRepository().getTreatment(token);

    data.fold(
      (error) {
        print('error response ${error.message}');

        isLoading = false;
        notifyListeners();
        CustomSnackBar.showSnackBar(context, error.message);
      },
      (response) {
        print('got response');
        print(response);
        List tempResponse = response['treatments'];
        List<TreatmentModel> treatmentTempList =
            tempResponse.map((e) => TreatmentModel.fromJson(e)).toList();
        treatments =
            treatmentTempList.map((treatment) => treatment.name).toList();
        print('hellow');
        print(branches);

        isLoading = false;
        notifyListeners();
      },
    );
  }
}
