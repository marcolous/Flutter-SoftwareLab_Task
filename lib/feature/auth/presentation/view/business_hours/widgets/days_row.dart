import 'package:flutter/material.dart';
import 'package:software_lab/feature/auth/presentation/view/business_hours/widgets/days_item.dart';

class DaysRow extends StatefulWidget {
  const DaysRow({
    super.key,
    required this.onDaySelected,
    required this.selectedDays,
  });
  final Function(String) onDaySelected;
  final Set<String> selectedDays;

  @override
  State<DaysRow> createState() => _DaysRowState();
}

class _DaysRowState extends State<DaysRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DaysItem(
          title: 'M',
          isSelected: widget.selectedDays.contains('mon'),
          onTap: () => widget.onDaySelected('mon'),
        ),
        DaysItem(
          title: 'T',
          isSelected: widget.selectedDays.contains('tue'),
          onTap: () => widget.onDaySelected('tue'),
        ),
        DaysItem(
          title: 'W',
          isSelected: widget.selectedDays.contains('wed'),
          onTap: () => widget.onDaySelected('wed'),
        ),
        DaysItem(
          title: 'Th',
          isSelected: widget.selectedDays.contains('thu'),
          onTap: () => widget.onDaySelected('thu'),
        ),
        DaysItem(
          title: 'F',
          isSelected: widget.selectedDays.contains('fri'),
          onTap: () => widget.onDaySelected('fri'),
        ),
        DaysItem(
          title: 'S',
          isSelected: widget.selectedDays.contains('sat'),
          onTap: () => widget.onDaySelected('sat'),
        ),
        DaysItem(
          title: 'Su',
          isSelected: widget.selectedDays.contains('sun'),
          onTap: () => widget.onDaySelected('sun'),
        ),
      ],
    );
  }
}
