import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haux/provider_state/info_provider.dart';
import 'package:haux/widgets/vertical_list_item.dart';
import 'package:provider/provider.dart';

class VerticalList extends StatelessWidget {
  const VerticalList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final hauxIndex = Provider.of<HauxInfoProvider>(context).apartmentList;
    return 
           Column(
             children: [
               Padding(
                 padding: const EdgeInsets.all(14.0),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                      Text("New Building",  style: GoogleFonts.poppins(
         textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500,fontSize: 18, color:const Color(0xff363B64)))),
                      Text("See all",  style: GoogleFonts.poppins(
        textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w400,fontSize: 14, color:const Color(0xff363B64))),
                      ),
                   ],
                 ),
               ),
               SizedBox(
                 height:deviceSize.height/2,
                 child: ListView.builder(
                  // scrollDirection: Axis.vertical,
                   itemCount: hauxIndex.length,
                   itemBuilder: (context, index) => ChangeNotifierProvider.value(
                  value: hauxIndex[index],
                  child: const VerticalListItem(),
                  ),
                 ),
               ),
             ],
           );
  }
}


