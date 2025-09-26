import 'package:commerce/app/core/resources/themes.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({
    super.key,
    required this.controller,
    required this.focusNode,
    this.onChanged,
    this.onCleared,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final Function(String)? onChanged;
  final Function()? onCleared;

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {});
      widget.onChanged?.call(widget.controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      style: textTheme(context).bodyMedium,
      decoration: InputDecoration(
        hintText: "Search Product",
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        prefixIcon: widget.controller.text.isEmpty
            ? Icon(Icons.search, size: 20)
            : IconButton(
                onPressed: () {
                  widget.controller.clear();
                  widget.onCleared?.call();
                },
                icon: Icon(Icons.clear, size: 20),
              ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(color: Colors.grey, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(color: Colors.black, width: 1.5),
        ),
      ),
    );
  }
}
