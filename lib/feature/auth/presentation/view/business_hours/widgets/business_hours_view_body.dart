import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:software_lab/core/utils/styles.dart';
import 'package:software_lab/core/widgets/custom_continue_back_row.dart';
import 'package:software_lab/feature/auth/presentation/view/business_hours/widgets/days_row.dart';

class BusinessHoursViewBody extends StatelessWidget {
  const BusinessHoursViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Form(
          //key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              const DaysRow(),
              const Gap(40),
              const TimeGridView(),
              const Gap(25),
              const Expanded(child: Gap(30)),
              CustomContinueBackRow(
                title: 'Signup',
                onPressed: () {},
              ),
              const Gap(20)
            ],
          ),
        ),
      ),
    );
  }
}

class TimeGridView extends StatefulWidget {
  const TimeGridView({super.key});
  static List<String> time = [
    '8:00am - 10:00am',
    '10:00am - 1:00pm',
    '1:00pm - 4:00pm',
    '4:00pm - 7:00pm',
    '7:00pm - 10:00pm',
  ];

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

  final Set<String> _selectedTimes = {};

  void _toggleTimeSelection(String time) {
    setState(() {
      if (_selectedTimes.contains(time)) {
        _selectedTimes.remove(time);
      } else {
        _selectedTimes.add(time);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: TimeGridView.time.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) => TimeItem(
        isSelected: _selectedTimes.contains(timeSlots[index]),
        title: TimeGridView.time[index],
        onTap: () => _toggleTimeSelection(timeSlots[index]),
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
