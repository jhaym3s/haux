import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haux/screens/favourite_screen.dart';
import 'package:haux/screens/home_page.dart';
import 'package:haux/screens/profile_screen.dart';
import 'package:haux/screens/roommate_request.dart';
class CustomNavigationBar extends StatefulWidget {
  static const routeName = "customNavigationBar";
  const CustomNavigationBar({ Key? key }) : super(key: key);
  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  late List<Map<Object, Object>> pages;

  int selectedPageIndex = 0;
  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }
  @override
  void initState() {
    pages = [
      {"pages": const HomeScreen(),
        //how to add actions to a tap bar
      },
      {"pages": const FavouriteScreen(),
      } ,
      {"pages": const RoommatesRequest(),
      },
      {"pages": const ProfileScreen(),
      },
      /*
      {"pages": Screen.Notification(),
        "title": "Update",
        "action": IconButton(icon: Icon(Icons.receipt_rounded), onPressed: (){}),
      },
       */
    ];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items:   const [
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.house,
                size: 30,
              ),
              activeIcon: Icon(CupertinoIcons.house_fill,size: 30),
              label: "Haux",
              ),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.heart,
                size: 30,
              ),
              activeIcon: Icon(CupertinoIcons.heart_fill, size: 30,),
              label: "Favourite",
              ),
           BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.group,
                size: 30,
              ),
              activeIcon: Icon(CupertinoIcons.group_solid, size: 30,),
              label: "Roommate request",
              ),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.person,
                size: 30,
              ),
              activeIcon: Icon(CupertinoIcons.person_fill, size: 30,),
              label: "Account",
              ),
         
        ],
        onTap: selectPage,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        currentIndex: selectedPageIndex,
        type: BottomNavigationBarType.fixed,
      ),
      //drawer: pages[selectedPageIndex]["actions"],
      drawer: pages[selectedPageIndex]["drawer"] as Widget?,

     appBar: AppBar(
      backgroundColor: Colors.transparent,
      title: Image.asset("assets/image/name.png"),
      centerTitle: true,
      elevation: 0,
      ),
      body: pages[selectedPageIndex]["pages"] as Widget?,
    );
  }
}