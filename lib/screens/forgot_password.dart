import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordPage extends StatefulWidget {
  static const routeName = "fprgotPassword";
  const ForgotPasswordPage({ Key? key }) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

   late bool isEmail ;

   @override
  void initState() {
    isEmail = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top:18.0,),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  [
              Text("Forgot password",  style: GoogleFonts.poppins(
                 textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500,fontSize: 24,
                  color: const Color(0xff363B64)))),
    Padding(
      padding: const EdgeInsets.only(top:18.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:  [
        ElevatedButton(onPressed: (){
            setState(() {
              isEmail = true;
            });
        }, child: const Text("Email"), style:ElevatedButton.styleFrom(fixedSize: const Size(163,51),primary:isEmail? 
        const Color(0xFFC69DFF): Colors.grey[200]),),
        ElevatedButton(onPressed: (){
            setState(() {
              isEmail = false;
            });
        }, child: const Text("SMS"), style: ElevatedButton.styleFrom(fixedSize: const Size(163,51),primary: isEmail == false ? const Color(0xFFC69DFF):Colors.grey[200]),),
      ],),
    ),
           Padding(
             padding: const EdgeInsets.only(top:18.0),
             child: Text("Enter your ${isEmail? 'Email Address': "Phone Number"}"),
           )
            ],
          ),
        )
      ))
    );
  }
}

