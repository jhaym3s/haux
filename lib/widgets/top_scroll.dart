import 'package:flutter/material.dart';

class TopScroll extends StatelessWidget {
   TopScroll({ Key? key }) : super(key: key);

  final List apartmentType = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:14.0),
      child: SizedBox(
        height: 50.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return   
               Padding(
                padding: const EdgeInsets.only(left:8.0),
                child: TextButton(onPressed: (){}, 
                child: const  Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: Text("3 Bedroom"),
                ),
                style: TextButton.styleFrom(side: const BorderSide(color: Color(0xffC69DFF), width: 1),
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
                ),
                ),
            );
          },
        ),
      ),
    );
  }
}