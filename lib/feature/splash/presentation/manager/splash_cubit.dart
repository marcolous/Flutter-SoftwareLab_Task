import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:software_lab/core/utils/app_images.dart';
part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());
  final List<String> onBoardingKeys = [
    'firstScreen',
    'secondScreen',
    'thirdScreen',
  ];

  int currentIndex = 0;

  final Map<String, dynamic> onBoarding = {
    'firstScreen': {
      'img': AppImages.onBoarding1,
      'title': 'Quality',
      'subTitle':
          'Sell your farm fresh products directly to consumers, cutting out the middleman and reducing emissions of the global supply chain.',
      'color': const Color(0xff5EA25F)
    },
    'secondScreen': {
      'img': AppImages.onBoarding2,
      'title': 'Convenient',
      'subTitle':
          'Our team of delivery drivers will make sure your orders are picked up on time and promptly delivered to your customers.',
      'color': const Color(0xffD5715B)
    },
    'thirdScreen': {
      'img': AppImages.onBoarding3,
      'title': 'Local',
      'subTitle':
          'We love the earth and know you do too! Join us in reducing our local carbon footprint one order at a time.',
      'color': const Color(0xffF8C569)
    },
  };

  String currentScreenKey = 'firstScreen';
  void changeOnBoarding(String screenKey) {
    emit(OnBoardingState(onBoarding: onBoarding[screenKey]));
  }

  Map<String, dynamic> getCurrentOnBoarding() {
    return onBoarding[onBoardingKeys[currentIndex]]!;
  }

  void nextScreen() {
    if (currentIndex < onBoardingKeys.length - 1) {
      currentIndex++;
      emit(OnBoardingState(
          onBoarding: onBoarding[onBoardingKeys[currentIndex]]));
    } else {
      emit(OnBoardingCompleted());
    }
  }
}
