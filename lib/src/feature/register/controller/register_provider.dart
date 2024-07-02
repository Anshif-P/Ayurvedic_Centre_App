import 'package:flutter/material.dart';
import 'package:noviindus_machine_task/src/feature/register/model/branch_model.dart';
import 'package:noviindus_machine_task/src/feature/register/model/treatment_model.dart';
import 'package:noviindus_machine_task/src/feature/register/view/screen_pdf_preview.dart';
import 'package:noviindus_machine_task/src/resources/local/shared_pref_model.dart';
import 'package:noviindus_machine_task/src/resources/repository/register_repo.dart';
import 'package:noviindus_machine_task/src/util/snack_bar/snack_bar.dart';

class RegisterProvider extends ChangeNotifier {
  bool isLoading = false;
  List<String> branches = [];
  List<String> treatments = [];
  List<TreatmentModel> treatmentList = [];
  List<BranchModel> branchList = [];
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
        branchList = tempResponse.map((e) => BranchModel.fromJson(e)).toList();
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
        isLoading = false;
        notifyListeners();
        CustomSnackBar.showSnackBar(context, error.message);
      },
      (response) {
        List tempResponse = response['treatments'];
        treatmentList =
            tempResponse.map((e) => TreatmentModel.fromJson(e)).toList();
        treatments = treatmentList.map((treatment) => treatment.name).toList();
        isLoading = false;
        notifyListeners();
      },
    );
  }

  void registerPatient(
      {required BuildContext context,
      required String name,
      required String whatsappNumber,
      required String address,
      required String location,
      required String branch,
      required String treatment,
      required int numberOfMale,
      required int numberOfFemale,
      required String totalAmount,
      required String discountAmount,
      required String advanceAmount,
      required String balanceAmount,
      required String treatmentDate,
      required String paymentOption,
      required String date,
      required String time}) async {
    isLoading = true;
    notifyListeners();
    token = SharedPrefModel.instance.getData('token');
    num totalAmountDouble = num.parse(totalAmount);
    num discountAmountDouble = num.parse(discountAmount);
    num advanceAmountDouble = num.parse(advanceAmount);
    num balanceAmountDouble = num.parse(balanceAmount);
    final data = await RegisterRepository().registerPatient(token, {
      "name": name,
      "excecutive": '',
      "payment": paymentOption,
      "phone": whatsappNumber,
      "address": address,
      "total_amount": totalAmountDouble,
      "discount_amount": discountAmountDouble,
      "advance_amount": advanceAmountDouble,
      "balance_amount": balanceAmountDouble,
      "date_nd_time": '01/02/2024-10:24 AM',
      "id": '',
      "male": [numberOfMale],
      "female": [numberOfFemale],
      "branch": 162,
      "treatments": [100]
    });
    data.fold((error) {
      isLoading = false;
      notifyListeners();
      CustomSnackBar.showSnackBar(context, error.message);
    }, (response) {
      CustomSnackBar.showSnackBar(context, 'Patient Registered Successfully');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PdfPreviewPage(
            name: name,
            whatsappNumber: whatsappNumber,
            address: address,
            location: location,
            branch: branch,
            treatment: treatment,
            numberOfMale: numberOfMale,
            numberOfFemale: numberOfFemale,
            totalAmount: totalAmount,
            discountAmount: discountAmount,
            advanceAmount: advanceAmount,
            balanceAmount: balanceAmount,
            treatmentDate: treatmentDate,
            time: time,
            paymentOption: paymentOption,
            date: date,
          ),
        ),
      );
      isLoading = false;
      notifyListeners();
    });
  }
}
