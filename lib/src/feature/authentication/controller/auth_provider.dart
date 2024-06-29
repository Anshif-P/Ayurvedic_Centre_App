import 'package:flutter/material.dart';
import 'package:noviindus_machine_task/src/feature/register/view/screen_home.dart';
import 'package:noviindus_machine_task/src/resources/local/shared_pref_model.dart';
import 'package:noviindus_machine_task/src/resources/repository/auth_repo.dart';
import 'package:noviindus_machine_task/src/util/snack_bar/snack_bar.dart';

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
      notifyListeners();
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const ScreenHome(),
      ));
    });
  }
}
