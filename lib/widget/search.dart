// ignore: must_be_immutable
import 'package:flutter/material.dart';

class SearchFileWidget extends StatefulWidget {
  const SearchFileWidget({
    super.key,
    required this.searchController,
  });

  final TextEditingController searchController;

  @override
  State<SearchFileWidget> createState() => _SearchFileWidgetState();
}

class _SearchFileWidgetState extends State<SearchFileWidget> {
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
    var deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    const border = InputBorder.none;
    return Container(
      margin: const EdgeInsets.only(right: 5),
      width: deviceWidth * 0.8,
      height: deviceHeight * 0.05,
      child: TextField(
        controller: widget.searchController,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          focusedBorder: border,
          border: border,
          filled: false,
          prefixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          suffixIcon: DropdownButton(
            hint: const Text("Filter "),
            items: dropDown,
            value: valueFile,
            icon: const Icon(
              Icons.menu,
            ),
            onChanged: (dynamic value) {
              if (value != null) {
                setState(() => valueFile = value);
              }
            },
          ),
          hintText: "Search your movie",
          // enabledBorder: OutlineInputBorder(
          //   borderSide: const BorderSide(color: Colors.transparent),
          //   borderRadius: BorderRadius.circular(30),
          // ),
        ),
      ),
    );
  }
}
