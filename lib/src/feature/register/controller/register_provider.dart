import 'package:flutter/material.dart';
import 'package:noviindus_machine_task/src/feature/register/model/branch_model.dart';
import 'package:noviindus_machine_task/src/resources/local/shared_pref_model.dart';
import 'package:noviindus_machine_task/src/resources/repository/register_repo.dart';
import 'package:noviindus_machine_task/src/util/snack_bar/snack_bar.dart';

class RegisterProvider extends ChangeNotifier {
  bool isLoading = false;
  List<String> branches = [];

  void getBranches(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    final token = SharedPrefModel.instance.getData('token');
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
        print('hellow');
        print(branches);

        isLoading = false;
        notifyListeners();
      },
    );
  }
}
