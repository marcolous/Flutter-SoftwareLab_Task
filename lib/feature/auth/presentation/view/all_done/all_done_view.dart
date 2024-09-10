import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:software_lab/core/utils/app_images.dart';
import 'package:software_lab/core/utils/routes.dart';
import 'package:software_lab/core/utils/styles.dart';
import 'package:software_lab/core/widgets/custom_button.dart';

class AllDoneView extends StatelessWidget {
  const AllDoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(child: Gap(1)),
            SizedBox(height: 100, child: AppImages.check),
            const Gap(30),
            Text(
              'You’re all done!',
              style: Styles.style35(context),
            ),
            const Gap(30),
            Text(
              'Hang tight!  We are currently reviewing your account and will follow up with you in 2-3 business days. In the meantime, you can setup your inventory.',
              style: Styles.style16(context).copyWith(
                color: const Color(0xff261C12).withOpacity(.3),
              ),
              textAlign: TextAlign.center,
            ),
            const Expanded(child: Gap(1)),
            CustomButton(
              // aspectRatio: 3.5,
              title: 'Got it!',
              onPressed: () => Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.kLoginView,
                (route) => false,
              ),
            ),
            const Gap(20)
          ],
        ),
      ),
    );
  }
}
