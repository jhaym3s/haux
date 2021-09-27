import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordPage extends StatefulWidget {
  static const routeName = "forgotPassword";
  const ForgotPasswordPage({ Key? key }) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

   late bool isEmail ;
   TextEditingController controller = TextEditingController();

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
             padding: const EdgeInsets.only(top:50.0,bottom: 50.0),
             child: Text("Enter your ${isEmail? 'Email Address': "Phone Number"}"),
           ),

           Padding(
             padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
             child: Container(
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius:  BorderRadius.circular(22),
      ),
      child: TextFormField(
        controller: controller,
        onSaved: (newValue) {
        //  authData![authDataString] = newValue;
        },
        validator: (value) {
          if(value!.isEmpty){
              return "Please add a ${isEmail?"email": "Phone number "}";
          }
          if(value.length <= 5 ){
              return "${isEmail?"Email":"Phone number"} is too short";
          }
          if(!value.contains("@")|| value.endsWith(".com")){
              return isEmail? "Please use a valid email": null;
          }
             if(value.contains(RegExp(r'[A-Z]'))|| value.endsWith(".com")){
              return isEmail == false ? "Please use a valid Phone number":null;
          }
          return null;
        },
        style: const TextStyle(color: Colors.white,fontSize: 18,),
        cursorHeight: 18,
        cursorColor: Colors.white,
        decoration: InputDecoration(
                  labelText:isEmail? "Insect Email": "Insect phone number ",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide:const  BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(
                      color: Color(0xFFC69DFF),
                      width: 1.0,
                    ),
                  ),
),
        
      ),
    ),
           ),
            const Gap(50),
              ElevatedButton(onPressed: (){
            //code goes in here
        }, child: const Text("Send Code"), style:ElevatedButton.styleFrom(fixedSize: const Size(363,67),primary: 
        const Color(0xFFC69DFF)),),
            ],
          ),
        )
      ))
    );
  }
}

