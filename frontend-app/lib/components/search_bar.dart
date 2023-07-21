import 'package:flutter/material.dart';

class SearchBarr extends StatefulWidget {
  String? searchText;
  SearchBarr({
    Key? key,
    this.searchText,
  }) : super(key: key);

  @override
  State<SearchBarr> createState() => _SearchBarrState();
}

class _SearchBarrState extends State<SearchBarr> {
  final TextEditingController _searchController = TextEditingController();
  String? searchText;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: widget.searchText,
          suffixIcon: IconButton(
            icon: Icon(Icons.clear),
            onPressed: () => _searchController.clear(),
          ),
          prefixIcon: IconButton(
            icon: Icon(
              Icons.search,
              color: Color(0xFF888888),
            ),
            onPressed: () {
              // Perform the search here
            },
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFAAE7E7), width: 1.5),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFAAE7E7), width: 1.5),
            borderRadius: BorderRadius.circular(8.0),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFAAE7E7), width: 1.5),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
