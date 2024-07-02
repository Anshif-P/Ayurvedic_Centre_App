import 'package:flutter/material.dart';
import 'package:noviindus_machine_task/src/feature/register/controller/get_patients_provider.dart';
import 'package:noviindus_machine_task/src/feature/register/controller/register_provider.dart';
import 'package:noviindus_machine_task/src/feature/register/view/screen_home.dart';
import 'package:noviindus_machine_task/src/resources/local/shared_pref_model.dart';
import 'package:noviindus_machine_task/src/resources/repository/auth_repo.dart';
import 'package:noviindus_machine_task/src/util/snack_bar/snack_bar.dart';
import 'package:provider/provider.dart';

class AuthenticationProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isLoginSuccess = false;
  loginFnc(String email, String password, BuildContext context) async {
    isLoading = true;
    notifyListeners();
    final data = await AuthenticationRepo()
        .loginFnc({"username": email, "password": password});
    data.fold((error) {
      CustomSnackBar.showSnackBar(context, error.message);
      isLoading = false;
      notifyListeners();
    }, (response) {
      SharedPrefModel.instance.insertData('token', response['token']);
      isLoading = false;
      Provider.of<PatinetsProvider>(context, listen: false)
          .getPatientsList(context);
      Provider.of<RegisterProvider>(context, listen: false)
          .getBranches(context);
      Provider.of<RegisterProvider>(context, listen: false)
          .getTreatment(context);
      notifyListeners();
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const ScreenHome(),
      ));
    });
  }
}
