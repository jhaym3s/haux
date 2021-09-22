import 'package:flutter/material.dart';
import 'package:haux/provider_state/agent_info_provider.dart';
import 'package:haux/provider_state/haux_info.dart';
import 'package:haux/provider_state/info_provider.dart';
import 'package:haux/screens/agent_details.dart';
import 'package:haux/screens/detail_page.dart';
import 'package:haux/screens/filter_screen.dart';
import 'package:haux/screens/screens.dart';
import 'package:haux/widgets/custom_navigation_bar.dart';
import 'package:provider/provider.dart';


void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
 const MyApp({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
      ChangeNotifierProvider(create: (context) => HauxInfo(),),
      ChangeNotifierProvider(create: (context) => HauxInfoProvider(),),
      ChangeNotifierProvider(create: (context) => AgentInfoProvider(),),
         
      ],
      child: MaterialApp(
        title: 'Haux.',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: const SplashScreen(),
        routes: {
                  CustomNavigationBar.routeName :(context) => const CustomNavigationBar(),
                 HomeScreen.routeName : (context) => const HomeScreen(),
                 FilterScreen.routeName:(context) => const FilterScreen(),
                 DetailsPage.routeName:(context) => const DetailsPage(),
                  AgentDetails.routeName:(context) => const AgentDetails(),
        },
      ),
    );
  }
}

