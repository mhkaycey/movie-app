import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  String? valueFile;
  @override
  Widget build(BuildContext context) {
    List<String> menuItem = [
      "ABCD",
      "BCDE",
      "CDEF",
    ];
    final List<DropdownMenuItem> dropDown = menuItem
        .map((String value) => DropdownMenuItem(
              value: value,
              child: Text(
                value,
                style: const TextStyle(fontSize: 15),
              ),
            ))
        .toList();

    return Expanded(
      child: DropdownButton(
        hint: const Text("Filter "),
        value: valueFile,
        icon: const Icon(
          Icons.menu,
        ),
        items: dropDown,
        onChanged: (dynamic value) =>
            value.toString().isNotEmpty ? valueFile = value : null,

        // {
        //   if (value != null) {
        //     setState(() => valueFile = value);
        //   }
        // },
      ),
    );
  }
}
