import 'package:flutter/material.dart';
import 'package:noviindus_machine_task/src/feature/register/controller/get_patients_provider.dart';
import 'package:noviindus_machine_task/src/feature/register/view/screen_register.dart';
import 'package:noviindus_machine_task/src/feature/register/widgets/home_appbar.dart';
import 'package:noviindus_machine_task/src/feature/register/widgets/home_card_widget.dart';
import 'package:noviindus_machine_task/src/util/constance/colors.dart';
import 'package:noviindus_machine_task/src/widgets/buttom_widget.dart';
import 'package:provider/provider.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15),
        child: SizedBox(
          height: 55,
          child: ButtonWidget(
              onpressFunction: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => ScreenRegister(),
                ));
              },
              text: 'Register Now'),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            HomeAppBar(screenHeight: screenHeight),
            const Divider(),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Consumer<PatinetsProvider>(
                  builder: (context, value, child) => value.isLoading
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Transform.scale(
                                scale: 0.8,
                                child: const CircularProgressIndicator(
                                  color: AppColor.primaryColor,
                                  strokeWidth: 5,
                                )),
                          ],
                        )
                      : value.patientList.isNotEmpty
                          ? ListView.separated(
                              itemCount: value.patientList.length,
                              itemBuilder: (context, index) {
                                final data = value.patientList[index];
                                return HomeCardWidget(
                                  index: index + 1,
                                  date: data.date,
                                  name: data.username,
                                  text: data.name,
                                  treatmentName: data.treatmentName,
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                height: 20,
                              ),
                            )
                          : const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Text('No Patients found')],
                            )),
            ))
          ],
        ),
      ),
    );
  }
}
