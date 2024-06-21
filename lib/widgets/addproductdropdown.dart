import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class AddProductDropDown extends StatelessWidget {
  const AddProductDropDown({
    super.key,
    required this.items,
    required this.hint,
    required this.onSelected,
  });

  final List<String> items;
  final String hint;
  final Function(String?) onSelected;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
          onChanged: (value) {
            onSelected(value);
          },
          isExpanded: true,
          hint: Text(hint),
          items: items
              .map((String item) => DropdownMenuItem(
                    child: Text(item),
                    value: item,
                  ))
              .toList(),
        )),
      ),
    );
  }
}
