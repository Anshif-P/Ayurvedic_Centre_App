import 'package:flutter/material.dart';
import 'package:noviindus_machine_task/src/feature/register/view/screen_home.dart';
import 'package:noviindus_machine_task/src/util/constance/text_style.dart';

class RegisterPageAppBar extends StatelessWidget {
  const RegisterPageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  onTap: () =>
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => ScreenHome(),
                      )),
                  child: const Icon(Icons.arrow_back)),
              const Icon(Icons.notifications_none)
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'Register',
            style: AppText.largeDark,
          )
        ],
      ),
    );
  }
}
