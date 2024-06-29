import 'package:flutter/material.dart';
import 'package:noviindus_machine_task/src/feature/register/view/screen_register.dart';
import 'package:noviindus_machine_task/src/feature/register/widgets/home_appbar.dart';
import 'package:noviindus_machine_task/src/feature/register/widgets/home_card_widget.dart';
import 'package:noviindus_machine_task/src/widgets/buttom_widget.dart';

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
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return const HomeCardWidget();
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                  itemCount: 8),
            ))
          ],
        ),
      ),
    );
  }
}
