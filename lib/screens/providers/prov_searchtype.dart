import 'package:flutter/material.dart';
import 'package:agriser/screens/providers/prov_search.dart';
import 'package:agriser/screens/providers/prov.dart';

class SearchTypePage extends StatefulWidget {
  final SearchType searchType;

  SearchTypePage({Key key, this.searchType}) : super(key: key);

  @override
  _SearchTypePageState createState() => _SearchTypePageState();
}

class _SearchTypePageState extends State<SearchTypePage> {
  @override
  void initState() {
    super.initState();
    print(widget.searchType.provType);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
