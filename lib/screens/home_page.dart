
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haux/screens/index_apartment.dart';
import 'package:haux/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "homePage";
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 final apartmentTypes = [
   "All Apartments",
    "Single Room",
    "Selfcon",
    "1 Bedroom",
    "2 Bedroom", 
    "3 Bedroom",
 ];
   String apartmentChosen = "All Apartments";

  @override
  Widget build(BuildContext context) {
    //final deviceSize = MediaQuery.of(context).size;
    return
        SingleChildScrollView(
        child: Column(
        children: [
        const SearchBar(),
       Padding(
      padding: const EdgeInsets.only(top:14.0),
      child: SizedBox(
        height: 50.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: apartmentTypes.length,
          itemBuilder: (context, index) {
            return   
               Padding(
                padding: const EdgeInsets.only(left:8.0),
                child: TextButton(onPressed: (){
                  apartmentChosen = apartmentTypes[index];
                 Navigator.push(context,
              MaterialPageRoute(builder: (context) =>  IndexApartment(apartmentTypeChoosen: apartmentChosen,)),
  );
                }, 
                child:   Padding(
                  padding:  const EdgeInsets.all(8.0),
                  child: Text(apartmentTypes[index]),
                ),
                style: TextButton.styleFrom(side: const BorderSide(color: Color(0xffC69DFF), width: 1),
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
                ),
                ),
            );
          },
        ),
      ),
    ),
        const HorizontalList(),
        const VerticalList()
        ],
        
      ),
      );
  }
}