part of 'splash_cubit.dart';

abstract class SplashState {}

class SplashInitial extends SplashState {}

class OnBoardingState extends SplashState {
  final Map<String, dynamic> onBoarding;

  OnBoardingState({required this.onBoarding});
}
