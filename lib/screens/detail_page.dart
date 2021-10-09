import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haux/provider_state/haux_info_provider.dart';
import 'package:haux/screens/agent_details.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatefulWidget {
  static const routeName = "/detailsPage";
  const DetailsPage({ Key? key }) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final filteredHauxId = ModalRoute.of(context)!.settings.arguments as String;
    final hauxFiltered = Provider.of<HauxInfoProvider>(context).findById(filteredHauxId);
    final otherHauxImage = hauxFiltered.otherImages;
    return Scaffold(
      body: SafeArea(child: 
      SingleChildScrollView(child: 
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: 
              Stack(children :[
                Image.asset(hauxFiltered.imagePath!,height: 360,width: deviceSize.width,fit:BoxFit.cover),
                  Card(
                        child:
                        IconButton(onPressed: (){
                          Navigator.of(context).pop();
                       }, 
                       icon: const Icon(
                       Icons.arrow_back_ios_new
                       )),
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                      ),
                ]
              )),
          SizedBox(
            height: 68,
            width: deviceSize.width,
            child: 
           Padding(
             padding: const EdgeInsets.only(top:8.0),
             child: Card(child: 
          Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(hauxFiltered.agentImagePath!, height:52,width: 54,fit: BoxFit.cover,)),
                      Padding(
                        padding: const EdgeInsets.only(left:8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(hauxFiltered.agentName!,style: GoogleFonts.poppins(
                                   textStyle: Theme.of(context).textTheme.bodyText1!
                                   .copyWith(fontWeight: FontWeight.w500,fontSize: 16, 
                                   color:const Color(0xff363B64)))),
                             Text("View LandLord's Profile", style: GoogleFonts.poppins(
                                 textStyle: Theme.of(context).
                                 textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w400,fontSize: 12, color: const Color(0xff363B64)))),
                          ],
                        ),
                      )
                  ],),
                  IconButton(onPressed: (){
                    Navigator.of(context).pushNamed(AgentDetails.routeName, arguments: hauxFiltered.agentId);
                  }, icon:const  Icon(Icons.arrow_forward_ios))
                ],
              ),
          )
          ),
           )),
           SizedBox(
             width: deviceSize.width,
             child: Card(child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(hauxFiltered.lodgeName!,style: GoogleFonts.poppins(
                           textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500,fontSize: 16, color:const Color(0xff363B64)))),
                   Text(hauxFiltered.description!)
                 ],
               ),
             ),),
           ),
           Padding(
             padding: const EdgeInsets.only(left:8.0, top: 8.0),
             child: Text("More Images",style: GoogleFonts.poppins(
                             textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500,fontSize: 16, color:const Color(0xff363B64)))),
           ),
           //more images for the house  
           SizedBox(
          height: 160.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: otherHauxImage!.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child:  InteractiveViewer(child: Image.asset(otherHauxImage[index],
                width:203, height:150, fit: BoxFit.cover))),
            )
                  ),
          ),
          
           ElevatedButton(
        onPressed: () {
          final snackBar = SnackBar(
            content: const Text("Notification Sent"),
            duration:const Duration(seconds: 3),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                
              },
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text("Request a tour", style: TextStyle(color: Colors.white),),
        style: ElevatedButton.styleFrom(
           onPrimary: Colors.white,
            primary:const Color(0xff363B64),
            fixedSize: Size(deviceSize.width, 50),
          ),
      ),
          
          ],
        ),
      ),
      ))
      
    );
  }
}