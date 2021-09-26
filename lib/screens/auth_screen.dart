import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haux/screens/forgot_password.dart';
import 'package:haux/screens/screens.dart';
import 'package:haux/widgets/custom_navigation_bar.dart';

enum AuthMode {login,signUp}

class AuthenticationScreen extends StatefulWidget {
  static const routeName = "/authScreen";
  const AuthenticationScreen({ Key? key }) : super(key: key);
  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
 
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode _authMode = AuthMode.login;
  final  Map<String, String> _authData ={
     "email": "",
     "password": "",
   };
   //final TextEditingController _passwordController = TextEditingController();


  void _switchMode(){
    if(_authMode == AuthMode.login){
      setState(() {
      _authMode = AuthMode.signUp;
      });
    }else {
      setState(() {
        _authMode = AuthMode.login;
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
       // backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child:
            AnimatedContainer(
              height:deviceSize.height,
              duration: const Duration(milliseconds: 200),
              curve: Curves.bounceIn,
              child: Padding(
                padding: const EdgeInsets.only(left: 8,right: 8,top: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text( _authMode == AuthMode.login?"Hi! Welcome Back \u{1f44B}":"Welcome to Haux!",
                     style: GoogleFonts.poppins(
                                 textStyle: Theme.of(context).
                                 textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500,fontSize: 36, color: const Color(0xff363B64)))
                    ),
                    Column(
                      children: [
                       _authMode == AuthMode.signUp? 
                       InputForms(hintText: "coolname@gmail.com",showSuffixIcon: false, labelText:"Email", obscureText: false): const SizedBox(),
                        _authMode == AuthMode.signUp? const SizedBox(height: 20,): const SizedBox(),
                        InputForms(hintText: _authMode == AuthMode.signUp?"07012540083":"coolname@gmail.com",showSuffixIcon: false,
                            labelText: _authMode == AuthMode.signUp?"Mobile number":"Email", obscureText: false,authDataString: _authData["email"]!),
                        const SizedBox(height: 20,),
                        //this is the password field
                        InputForms(hintText: "",showSuffixIcon: true, labelText: "Password",
                            obscureText: true, authDataString: _authData["password"]!),
                        _authMode == AuthMode.signUp? const SizedBox(height: 20,): const SizedBox(),
                        _authMode == AuthMode.signUp? InputForms(hintText:"",showSuffixIcon: true, labelText: "Confirm Password", obscureText: true):const SizedBox(),
                        _authMode == AuthMode.login? Align(
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                              onTap: (){
                                Navigator.of(context).pushNamed(ForgotPasswordPage.routeName);
                              },
                              child:   Padding(
                                padding: const EdgeInsets.only(top:18.0),
                                child: Text("Forgot password?",
                                   style: GoogleFonts.poppins(
                                   textStyle: Theme.of(context).
                                   textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500,fontSize: 14, color: const Color(0xff363B64)))
                                  ),
                              )),
                        ): const SizedBox(),

                        Padding(
                          padding: const EdgeInsets.only(top:18.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: DecoratedBox(
                              decoration: const BoxDecoration(gradient: LinearGradient(
                                colors: [Color(0xFFC69DFF), 
                                 Color(0xff317DF6)])),
                              child: ElevatedButton(
                                  onPressed: (){
                                    Navigator.of(context).popAndPushNamed(CustomNavigationBar.routeName);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                        child: Center(child: Text( _authMode == AuthMode.login?"Sign in ": "Sign Up",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),))
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary:   Colors.transparent,
                                    fixedSize: Size(deviceSize.width,65),
                                   shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: const BorderSide(color: Color(0xFFC69DFF))
                                  )
                                  ),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(_authMode == AuthMode.login?"Do not have account?":"Already have an account?",style: const TextStyle(color: Color(0xFF363B64)),),
                            TextButton(onPressed: _switchMode, child: Text(_authMode == AuthMode.login?"Sign up":"Sign in", style: const TextStyle(color: Colors.blue),))
                          ],
                        ),
                      ],
                    ),
                      ],
                    ),
              ),
            )
        ),
      ),
    );
  }
}

class InputForms extends StatelessWidget {
   InputForms({
    Key? key,
    this.hintText,
    this.isEmail,
    this.showSuffixIcon,
    this.labelText,
    this.obscureText,
    this.controller,
    this.authData,
    this.authDataString,
    
  }) : super(key: key);
  final String? hintText;
  final bool? showSuffixIcon;
  final String? labelText; 
  final bool? obscureText;
  final Map? authData; 
  final String? authDataString; 
   bool? isEmail;
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius:  BorderRadius.circular(22),
      ),
      child: TextFormField(
        controller: controller,
        onSaved: (newValue) {
          authData![authDataString] = newValue;
        },
        obscureText: obscureText!,
        validator: (value) {
          if(value!.isEmpty){
            return "Please add a $labelText";
          }
          if(value.length <= 5 ){
            return obscureText == true?"Password is too short":null;
          }
          if(!value.contains("@")|| value.endsWith(".com")){
            return isEmail!? "Please use a valid email":null;
          }
          return null;
        },
        style: const TextStyle(color: Colors.white,fontSize: 18,),
        cursorHeight: 18,
        cursorColor: Colors.white,
        decoration: InputDecoration(
                labelText:labelText,
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
    );
  }
}