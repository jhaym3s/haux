
import 'package:flutter/material.dart';
import 'package:haux/provider_state/haux_info.dart';

class HauxInfoProvider with ChangeNotifier{


final List<HauxInfo> _apartmentList = [

HauxInfo(
  agentName: "Mrs Jhaymes", 
  apartmentType: "Selfcon", 
  location: "Behind Flat", 
  lodgeName: "Unique Lodge",
  id: "l1",
  imagePath: "assets/image/haux4.jpg",
  price: 400000,
  agentImagePath: "assets/image/agent1.jpg",
  agentId: "a1",
  description: "A lodge with 45 selfcon rooms",
  otherImages: ["assets/image/toilet.jpg","assets/image/interior2.jpg","assets/image/balcony.jpg"]..shuffle(),
),
HauxInfo(
  agentName: "Mrs Jhaymes", 
  apartmentType: "Selfcon", 
  location: "Hiltop", 
  lodgeName: "Holy Mother Of Christ",
  id: "l2",
  imagePath: "assets/image/haux1.jpg",
  agentId: "a2",
  price: 400000,
  agentImagePath: "assets/image/agent1.jpg",
  description: "A lodge with 45 selfcon rooms. Immediately after hilltop gate by your right. Blah blah blah yada yada yada yada "
  "just to make it longer. So this is the description and all",
  otherImages: ["assets/image/toilet.jpg","assets/image/interior2.jpg","assets/image/balcony.jpg"]..shuffle(),
),
HauxInfo(
  agentName: "Mrs Jhaymes", 
  apartmentType: "Single room", 
  location: "Hiltop", 
  lodgeName: "Manniikin lodge",
  agentId: "a3",
  id: "l3",
  imagePath: "assets/image/haux5.jpg",
  price: 400000,
  agentImagePath: "assets/image/agent1.jpg",
  description:  "A lodge with 45 selfcon rooms. Immediately after hilltop gate by your right. Blah blah blah yada yada yada yada just to make it longer. So this is the description and all",
  otherImages: ["assets/image/toilet.jpg","assets/image/interior2.jpg","assets/image/balcony.jpg"]..shuffle(),

),
HauxInfo(
  agentName: "Mrs Jhaymes", 
  apartmentType: "Single room", 
  location: "Odim", 
  lodgeName: "Trinity",
  agentId: "a4",
  id: "l4",
  imagePath: "assets/image/haux3.jpg",
  price: 400000,
  agentImagePath: "assets/image/agent1.jpg",
  description: "5 single rooms behind Prof.Dike apartment, has a bathroom and toilet to be shared by only the occupants of the apartment. Constant electricity and water flows just outside the apartment",
  otherImages: ["assets/image/toilet.jpg","assets/image/interior2.jpg","assets/image/balcony.jpg"]..shuffle(),

),
];

List<HauxInfo> get apartmentList{
  return [..._apartmentList]..shuffle();
}
HauxInfo findById(String id){
      return _apartmentList.firstWhere((element) => id == element.id);
}

List<HauxInfo> get getFavourite{
  return apartmentList.where((element) => element.isFavorite == true).toList();
}
}