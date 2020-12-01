import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final bool enabled;
  const CustomSearchBar({
    Key key,
    @required this.enabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
        child: TextField(
          autofocus: enabled,
          enabled: enabled,
          decoration: InputDecoration(
              fillColor: Colors.white,
              focusColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10)),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              hintText: "Search for Products",
              contentPadding: EdgeInsets.symmetric(vertical: 16)),
        ),
      ),
    );
  }
}

class SearchTextFeild extends StatefulWidget {
  @override
  _SearchTextFeildState createState() => _SearchTextFeildState();
}

class _SearchTextFeildState extends State<SearchTextFeild> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                "Search for Products",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
