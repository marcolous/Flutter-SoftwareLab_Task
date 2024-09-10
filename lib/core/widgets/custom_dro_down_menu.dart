import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:software_lab/core/utils/app_images.dart';
import 'package:software_lab/core/utils/styles.dart';
import 'package:software_lab/data/states_data.dart';

class CustomDropDownMenu extends StatefulWidget {
  const CustomDropDownMenu({super.key, required this.onSelected});
  final ValueChanged<String?> onSelected;

  @override
  State<CustomDropDownMenu> createState() => _CustomDropDownMenuState();
}

class _CustomDropDownMenuState extends State<CustomDropDownMenu> {
  // final List<String> items = [
  //   'Male',
  //   'Female',
  // ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    TextStyle style =
        Styles.style16(context).copyWith(color: const Color(0xff8B8B8B));
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: IntrinsicWidth(
        child: DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            hint: Row(
              children: [
                Expanded(
                  child: Text(
                    'State',
                    style: style,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            items: StatesData.usStates
                .map(
                  (String item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(item, style: style),
                  ),
                )
                .toList(),
            value: selectedValue,
            onChanged: (String? value) {
              setState(() {
                selectedValue = value;
              });
              widget.onSelected(value);
            },
            buttonStyleData: ButtonStyleData(
              height: 55,
              // width: double.infinity,
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(horizontal: 22),
              decoration: BoxDecoration(
                color: const Color(0xffEEEDEC),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            iconStyleData: IconStyleData(
              icon: SizedBox(
                height: 10,
                child: AppImages.arrowDown,
              ),
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 300,
              width: 200,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: const Color(0xffEEEDEC),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(
              padding: EdgeInsets.symmetric(horizontal: 14),
            ),
          ),
        ),
      ),
    );
  }
}
