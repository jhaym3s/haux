import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haux/screens/filter_screen.dart';


class SearchBar extends StatelessWidget {
  const SearchBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final deviceSize = MediaQuery.of(context).size;
    return 
      
     Padding(
        padding: const EdgeInsets.only(top:20.0, left: 8.0,right:8.0),
        child: Row(
                 children: [
                   Expanded(
                     child: Container(
                       height: 49,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.transparent),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                                 child: const TextField(
                        decoration: InputDecoration(
                      border:  OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10),
                        ),
                      ),
                      hintText: "Search Location in your school",
                      hintStyle: TextStyle(color: Color(0xffadafbd)),
                      prefixIcon:  Icon(
                        Icons.search,
                        size: 22,
                      ),
                       ))
                     ),
                   ), 
                    GestureDetector(
                      onTap:() {
                        Navigator.of(context).pushNamed(FilterScreen.routeName);
                        },
                      child: SizedBox(
                        width: 49,
                        height: 49,
                        child: Card(
                          elevation: 0,
                          child: Image.asset("assets/image/filter.png",),
                                ),
                      ),
                    )
                 ],
               ),
    
    );
  }
}