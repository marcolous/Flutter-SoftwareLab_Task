import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:software_lab/core/utils/routes.dart';
import 'package:software_lab/core/utils/styles.dart';
import 'package:software_lab/feature/splash/presentation/manager/splash_cubit.dart';

class SplashView extends StatelessWidget {
  SplashView({super.key});
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit(),
      child: BlocConsumer<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is OnBoardingCompleted) {
            Navigator.pushNamed(context, Routes.kLoginView);
          }
        },
        builder: (context, state) {
          final cubit = context.read<SplashCubit>();
          final onBoardingData = cubit.getCurrentOnBoarding();
          final pageCount = onBoardingData.length;

          return Scaffold(
            backgroundColor: onBoardingData['color'],
            body: Column(
              children: [
                SizedBox(
                  height: 0,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: onBoardingData.length,
                    itemBuilder: (context, index) {
                      return const SizedBox();
                    },
                  ),
                ),
                Expanded(flex: 5, child: onBoardingData['img']),
                Expanded(
                  flex: 4,
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          onBoardingData['title'],
                          style: Styles.style22SemiBold(context),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: Text(
                            onBoardingData['subTitle'],
                            textAlign: TextAlign.center,
                            style: Styles.style14(context),
                          ),
                        ),
                        SmoothPageIndicator(
                          controller: _pageController,
                          count: pageCount - 1,
                          effect: const ExpandingDotsEffect(
                            dotHeight: 8,
                            dotWidth: 8,
                            spacing: 5,
                            dotColor: Colors.black,
                            activeDotColor: Colors.black,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            cubit.nextScreen();
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: onBoardingData['color'],
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 20,
                              )),
                          child: Text(
                            'Join the movement!',
                            style: Styles.style16(context),
                          ),
                        ),
                        GestureDetector(
                          onTap: () =>
                              Navigator.pushNamed(context, Routes.kLoginView),
                          child: Text(
                            'Login',
                            style: Styles.style14(context).copyWith(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
