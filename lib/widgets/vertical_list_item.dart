import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haux/provider_state/haux_info.dart';
import 'package:provider/provider.dart';

class VerticalListItem extends StatelessWidget {
  const VerticalListItem({
    Key? key,
    
  }) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final hauxInfo = Provider.of<HauxInfo>(context);
    return SizedBox(
      width: deviceSize.width,
       child: Card(
         child: Padding(
           padding: const EdgeInsets.all(8.0),
           child: Row(
             children: [
               ClipRRect(
                 borderRadius: BorderRadius.circular(10),
                 child: Image.asset(hauxInfo.imagePath!,height: 95,width: 110,fit: BoxFit.cover),
                 ),
               const Gap(10),
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Row(
                     children: [
                        Image.asset("assets/image/hometype.png",),
                        const Gap(4),
                      Text(hauxInfo.apartmentType!,  style: GoogleFonts.poppins(
       textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500,
       fontSize: 12, color:const Color(0xff363B64)))), 
                     ]
                   ),
                 Text(hauxInfo.lodgeName!,  style: GoogleFonts.poppins(
       textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500,fontSize: 18, color:const Color(0xff363B64)))),
       Text(hauxInfo.location!,  style: GoogleFonts.poppins(
       textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500,fontSize: 15, color:const Color(0xff363B64)))),
                 ],
               ),
             ],
           ),
         ),
       ),
    );
  }
}