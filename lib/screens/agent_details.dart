import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haux/provider_state/landlord_info_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class AgentDetails extends StatefulWidget {
  static const routeName = "/agent_details";
  const AgentDetails({ Key? key }) : super(key: key);

  @override
  _AgentDetailsState createState() => _AgentDetailsState();
}

class _AgentDetailsState extends State<AgentDetails> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final agentId = ModalRoute.of(context)!.settings.arguments as String;
    final agentFiltered = Provider.of<LandLordInfoProvider>(context).findById(agentId);
    return Scaffold(
      body: SafeArea(child: 
      Column(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top:15, left:15, right: 15),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Center(
                         child: Text("Agent Profile",style: GoogleFonts.poppins(
                                       textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500,fontSize: 18, color:const Color(0xff363B64)))),
                       ),
                        Padding(
                          padding: const EdgeInsets.only(top:15.0),
                          child: Row(children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: InteractiveViewer(child: Image.asset(agentFiltered.landLordImage!, height:74,width: 84,fit: BoxFit.cover,))),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left:8.0),
                                        child: Text(agentFiltered.landLordName!,style: GoogleFonts.poppins(
                                               textStyle: Theme.of(context).textTheme.bodyText1!
                                               .copyWith(fontWeight: FontWeight.w500,fontSize: 16, 
                                               color:const Color(0xff363B64)))),
                                      ),
                                       Row(
                                         children: [
                                           const Icon(Icons.location_on_outlined),
                                           Text(agentFiltered.address!, style: GoogleFonts.poppins(
                                               textStyle: Theme.of(context).
                                               textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w400,fontSize: 12, color: const Color(0xff363B64)))),
                                         ],
                                       ),
                                    ],
                                  )
                              ],),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(left:8.0, top: 15, bottom: 10),
                        child: Text("Information",style: GoogleFonts.poppins(
                                     textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500,fontSize: 12, color:const Color(0xff363B64)))),
                      ),
                      IconAndText(textChild: agentFiltered.phoneNumber!, iconData: CupertinoIcons.phone,function: ()async{
                           String telephoneUrl = "tel:${agentFiltered.phoneNumber}";
                      if (await canLaunch(telephoneUrl)) {
                        await launch(telephoneUrl);
                      } else {
                       throw "Can't phone that number.";
                         }
                      },),
                      const Gap(10),
                       IconAndText(textChild: "2 Listings", iconData: CupertinoIcons.home, function:(){}),
                       Padding(
                         padding: const EdgeInsets.symmetric(vertical: 8.0),
                         child: Text("About me",style: GoogleFonts.poppins(
                                     textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500,fontSize: 14, color:const Color(0xff363B64)))),
                       ),
                    Text(agentFiltered.landLordDetails!,style: GoogleFonts.poppins(
                                   textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500,fontSize: 16, color:const Color(0xff363B64))),textAlign: TextAlign.start,),
                      
                    ],
                  ),
                  
                ],
              ),
            ),
          ),
          Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: ElevatedButton(onPressed: (){}, child: const Text("Send a message", style: TextStyle(
                  color: Colors.white
                ),),style: ElevatedButton.styleFrom(primary: const Color(0xff363B64),fixedSize: Size(deviceSize.width, 50))),
              )
        ],
      )),
    );
  }
}

class IconAndText extends StatelessWidget {
  const IconAndText({
    Key? key,
    required this.textChild,
    required this.iconData,
    required this.function,
  }) : super(key: key);

  final String textChild;
  final IconData iconData;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Icon(iconData),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => function,
          child: Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: Text(textChild),
          )
          )
      ],
    );
  }
}