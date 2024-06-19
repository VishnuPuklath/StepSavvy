import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class AddProductDropDown extends StatelessWidget {
  const AddProductDropDown({
    super.key,
    required this.items,
    required this.hint,
  });

  final List<String> items;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
          onChanged: (value) {},
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
