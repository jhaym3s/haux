import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({ Key? key }) : super(key: key);

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
String? _selectedLocation;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Padding(
                    padding: const EdgeInsets.only(top:40,bottom:20),
                    child: Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      width: deviceSize.width ,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey),
              color: Colors.transparent,
          ),
           child: DropdownButton(
             isExpanded: true,
             underline: const SizedBox(),
            icon:const  Icon(Icons.keyboard_arrow_down_outlined),
            hint:  const  Text("Choose an Institution"), 
            value: _selectedLocation,
            onChanged: (String? newValue) {
              setState(() {
                _selectedLocation = newValue;
              });
            },
            items: <String>[
"  Abubakar Tafawa Balewa University, Bauchi (ATBU)",
"Ahmadu Bello University, Zaria (ABU)",
"Air Force Institute of Technology, Kaduna (AFIT)",
"Bayero University, Kano (BUK)",
	"The Federal University of Petroleum Resources, Effurun (FUPRE)",
"The Federal University of Technology, Akure (FUTA)",
"The Federal University of Technology, Minna (FUTMINNA)",
"Federal University of Technology, Owerri (FUTO)",
"Federal University, Dutse, Jigawa State (FUD )",
"	Federal University, Dustin-Ma, Katsina (FUDMA)",
"National Open University of Nigeria, Lagos (NOUN)",
"Obafemi Awolowo University, Ile-Ife (OAU)"
"	University of Benin (UNIBEN)",
"University of Lagos (UNILAG)",
	"The University of Nigeria, Nsukka (UNN)",
	"University of Port-Harcourt (UNIPORT)",

	"University of Uyo (UNIUYO)"
              ].map((term) {
              return DropdownMenuItem(
                child: Text(term),
                value: term,
              );
            }).toList(),
          ),
                    ),
                  );
  }
}

class TextAndFn extends StatelessWidget {
    const TextAndFn({ Key? key, required this.nameOfSchool}) : super(key: key);
final String nameOfSchool;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child:   Text(nameOfSchool)
    );
  }
}