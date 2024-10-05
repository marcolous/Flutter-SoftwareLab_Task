import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:software_lab/core/utils/routes.dart';
import 'package:software_lab/core/utils/styles.dart';
import 'package:software_lab/core/widgets/custom_continue_back_row.dart';
import 'package:software_lab/data/models/register_request_model.dart';
import 'package:software_lab/feature/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:software_lab/feature/auth/presentation/view/business_hours/widgets/days_row.dart';

class BusinessHoursView extends StatefulWidget {
  const BusinessHoursView({super.key, required this.registerRequest});
  final RegisterRequestModel registerRequest;

  @override
  State<BusinessHoursView> createState() => _BusinessHoursViewState();
}

class _BusinessHoursViewState extends State<BusinessHoursView> {
  final Map<String, Set<String>> dayTimeMap = {};
  String? selectedDay;
  bool isLoading = false;

  // Future<void> getDeviceToken() async {
  //   FirebaseMessaging messaging = FirebaseMessaging.instance;
  //   String? token = await messaging.getToken();
  //   log('Device Token: $token');
  //   // Save this token to your model
  //   widget.registerRequest.deviceToken = token;
  //   widget.registerRequest.socialId = token;
  // }

  void _toggleDaySelection(String day) {
    setState(() {
      if (dayTimeMap.containsKey(day)) {
        if (dayTimeMap[day]!.isEmpty) {
          dayTimeMap.remove(day);
          if (selectedDay == day) {
            selectedDay = null;
          }
        }
      } else {
        dayTimeMap[day] = {};
        selectedDay = day;
      }
    });
  }

  void _toggleTimeSelection(String day, String time) {
    setState(() {
      if (dayTimeMap[day]!.contains(time)) {
        dayTimeMap[day]!.remove(time);
      } else {
        dayTimeMap[day]!.add(time);
      }
    });
  }

  Future<void> _collectFormData() async {
    // if (dayTimeMap.isNotEmpty) {
    final Map<String, List<String>> formattedBusinessHours = Map.fromEntries(
      dayTimeMap.entries.where((entry) => entry.value.isNotEmpty).map(
            (entry) => MapEntry(entry.key, entry.value.toList()),
          ),
    );
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    String? token = await messaging.getToken();

    widget.registerRequest.businessHours = formattedBusinessHours;

    //log('Device Token: $token');
    widget.registerRequest.deviceToken = token;
    widget.registerRequest.socialId = token;

    log(widget.registerRequest.toString());

    if (formattedBusinessHours.isNotEmpty) {
      //Navigator.pushNamed(context, Routes.kAllDoneView);
    }
    // }
  }

  void listener(BuildContext context, AuthState state) {
    if (state is RegisterLoading) {
      setState(() {
        isLoading = true;
      });
    } else if (state is RegisterSucess) {
      Navigator.pushNamed(context, Routes.kAllDoneView);
      setState(() {
        isLoading = false;
      });
    } else if (state is RegisterFailure) {
      log(state.errMessage);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.errMessage),
          backgroundColor: Colors.red,
        ),
      );

      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) => listener(context, state),
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: CustomContinueBackRow(
            isLoading: isLoading,
            title: 'Signup',
            onPressed: () async {
              await _collectFormData();

              await context
                  .read<AuthCubit>()
                  .registerUser(registerRequest: widget.registerRequest);
              // await context
              //     .read<AuthCubit>()
              //     .forgotPassword(mobile: widget.registerRequest.phone!);
              log('Button pressed with state: $state');
              log('from business view : ${widget.registerRequest.toString()}');
            },
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ListView(
                children: [
                  Text(
                    'FarmerEats',
                    style: Styles.style20(context),
                  ),
                  const Gap(30),
                  Text(
                    'Signup 4 of 4',
                    style: Styles.style16(context).copyWith(
                      color: const Color(0xff261C12).withOpacity(.3),
                    ),
                  ),
                  Text(
                    'Business Hours',
                    style: Styles.style35(context),
                  ),
                  const Gap(40),
                  Text(
                    'Choose the hours your farm is open for pickups. This will allow customers to order deliveries.',
                    style: Styles.style16(context).copyWith(
                      color: const Color(0xff261C12).withOpacity(.3),
                    ),
                  ),
                  const Gap(40),
                  DaysRow(
                    onDaySelected: _toggleDaySelection,
                    selectedDays: dayTimeMap.keys.toSet(),
                  ),
                  const Gap(40),
                  if (selectedDay != null)
                    TimeGridView(
                      selectedDay: selectedDay!,
                      selectedTimes: dayTimeMap[selectedDay!] ?? {},
                      onTimeSelected: _toggleTimeSelection,
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class TimeGridView extends StatefulWidget {
  const TimeGridView({
    super.key,
    required this.selectedDay,
    required this.selectedTimes,
    required this.onTimeSelected,
  });

  final String selectedDay;
  final Set<String> selectedTimes;
  final Function(String, String) onTimeSelected;

  @override
  State<TimeGridView> createState() => _TimeGridViewState();
}

class _TimeGridViewState extends State<TimeGridView> {
  static List<String> timeSlots = [
    '8:00am - 10:00am',
    '10:00am - 1:00pm',
    '1:00pm - 4:00pm',
    '4:00pm - 7:00pm',
    '7:00pm - 10:00pm',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: timeSlots.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) => TimeItem(
        isSelected: widget.selectedTimes.contains(timeSlots[index]),
        title: timeSlots[index],
        onTap: () => widget.onTimeSelected(
          widget.selectedDay,
          timeSlots[index],
        ),
      ),
    );
  }
}

class TimeItem extends StatelessWidget {
  const TimeItem({
    super.key,
    required this.isSelected,
    this.onTap,
    required this.title,
  });
  final bool isSelected;
  final Function()? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected
              ? const Color(0xffF8C569)
              : const Color(0xff261C12).withOpacity(.08),
        ),
        child: Center(
          child: Text(
            title,
            style: Styles.style16(context).copyWith(
              color: const Color(0xff261C12),
            ),
          ),
        ),
      ),
    );
  }
}
