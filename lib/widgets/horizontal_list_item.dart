import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haux/provider_state/haux_info.dart';
import 'package:haux/screens/detail_page.dart';
import 'package:provider/provider.dart';

class HorizontalListItem extends StatelessWidget {
  const HorizontalListItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final haux = Provider.of<HauxInfo>(context);
    return Padding(
     padding: const EdgeInsets.only(left:8.0),
     child: SizedBox(
       width:300 ,
       child: GestureDetector(
         onTap: (){
           Navigator.of(context).pushNamed(DetailsPage.routeName,arguments:haux.id );},
         child: Card(
           shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
           child: Padding(
             padding: const EdgeInsets.symmetric(vertical:8.0,horizontal: 10),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Center(
                   child: Stack(
                     alignment: Alignment.topRight,
                     children: [
                       ClipRRect(
                         borderRadius: BorderRadius.circular(10),
                         child: Image.asset(haux.imagePath!,width: 290,height: 140,fit: BoxFit.cover,)),
                       Card(
                        child: Consumer<HauxInfo>(
                       builder: (BuildContext context, haux, Widget? child) { 
                         return IconButton(onPressed: (){
                         haux.toggleFavorite();
                         final snackBar = SnackBar(
                  content:  Text(haux.isFavorite?"${haux.lodgeName} added to favourite":
                 "${haux.lodgeName} removed from favourite"),
            duration:const Duration(seconds: 3),
          );
          Scaffold.of(context).removeCurrentSnackBar(reason: SnackBarClosedReason.swipe);
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                       }, 
                       icon: Icon(
                         haux.isFavorite?
                       Icons.favorite: 
                       Icons.favorite_border
                       ));
                        }, 
                     ),
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                      ),
                     ],
                   ),
                 ),
               Padding(
                 padding: const EdgeInsets.only(top:18.0),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Row(
                       children: [
                         Image.asset("assets/image/hometype.png",height: 20,width:20),
                        const Gap(4),
                         Text(haux.category!,  style: GoogleFonts.poppins(
                           textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w400,fontSize: 11, color:const Color(0xff363B64)))),
                       ],
                     ),
                   Text("\$${haux.price!.toStringAsFixed(2)}/Year",  style: GoogleFonts.poppins(
                          textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w600,fontSize: 16, color:const Color(0xff363B64),))),
                   ],
                 ),
               ),
              const Gap(5),
              Text(haux.lodgeName!,  style: GoogleFonts.poppins(
              textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500,fontSize: 18, color:const Color(0xff363B64)))),
              Text(haux.location!,  style: GoogleFonts.poppins(
           textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500,fontSize: 12, color:const Color(0xff363B64)))),
               ],
             ),
           ),
         ),
       )
       ),
              );
  }
}