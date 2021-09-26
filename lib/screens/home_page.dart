
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haux/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "homePage";
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    //final deviceSize = MediaQuery.of(context).size;
    return
        SingleChildScrollView(
        child: Column(
        children: const [
        SearchBar(),
        TopScroll(),
        HorizontalList(),
        VerticalList()
        ],
        
      ),
      );
  }
}