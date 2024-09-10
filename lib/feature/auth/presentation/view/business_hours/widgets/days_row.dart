import 'package:flutter/material.dart';
import 'package:software_lab/feature/auth/presentation/view/business_hours/widgets/days_item.dart';

class DaysRow extends StatefulWidget {
  const DaysRow({super.key});

  @override
  State<DaysRow> createState() => _DaysRowState();
}

class _DaysRowState extends State<DaysRow> {
  final Set<String> _selectedDays = {};

  void _toggleDaySelection(String day) {
    setState(() {
      if (_selectedDays.contains(day)) {
        _selectedDays.remove(day);
      } else {
        _selectedDays.add(day);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DaysItem(
          title: 'M',
          isSelected: _selectedDays.contains('M'),
          onTap: () => _toggleDaySelection('M'),
        ),
        DaysItem(
          title: 'T',
          isSelected: _selectedDays.contains('T'),
          onTap: () => _toggleDaySelection('T'),
        ),
        DaysItem(
          title: 'W',
          isSelected: _selectedDays.contains('W'),
          onTap: () => _toggleDaySelection('W'),
        ),
        DaysItem(
          title: 'Th',
          isSelected: _selectedDays.contains('Th'),
          onTap: () => _toggleDaySelection('Th'),
        ),
        DaysItem(
          title: 'F',
          isSelected: _selectedDays.contains('F'),
          onTap: () => _toggleDaySelection('F'),
        ),
        DaysItem(
          title: 'S',
          isSelected: _selectedDays.contains('S'),
          onTap: () => _toggleDaySelection('S'),
        ),
        DaysItem(
          title: 'Su',
          isSelected: _selectedDays.contains('Su'),
          onTap: () => _toggleDaySelection('Su'),
        ),
      ],
    );
  }
}