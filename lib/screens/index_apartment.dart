// this is supposed to show a list of only the apartments
import 'package:flutter/material.dart';
import 'package:haux/provider_state/haux_info.dart';
import 'package:haux/provider_state/haux_info_provider.dart';
import 'package:provider/provider.dart';

class IndexApartment extends StatefulWidget {
  static const routeName = "indexApartment";
  const IndexApartment({Key? key, this.apartmentTypeChoosen}) : super(key: key);
  final String? apartmentTypeChoosen;

  @override
  _IndexApartmentState createState() => _IndexApartmentState();
}

class _IndexApartmentState extends State<IndexApartment> {
List<HauxInfo>? switchStatement(BuildContext context){
    switch(widget.apartmentTypeChoosen){
      case "All Apartment": {
        return Provider.of<HauxInfoProvider>(context).apartmentList;
      }

    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
