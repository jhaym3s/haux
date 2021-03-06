
import 'package:flutter/material.dart';


enum category{
  selfcon,
  oneRoom,
  twoRooms,
  threeRooms,
  singleRoom,
}

class HauxInfo with ChangeNotifier{
final String? lodgeName,agentImagePath,category,location,description,agentName,id,imagePath, agentId;
final double? price;
bool isFavorite;
final List<String>? otherImages;


HauxInfo({
this.lodgeName, 
this.category, 
this.location, 
this.description, 
this.isFavorite = false,
this.agentName, 
this.agentImagePath,
this.imagePath,
this.id,
this.price,
this.otherImages,
this.agentId
});

void toggleFavorite(){
  isFavorite = !isFavorite;
  notifyListeners();
 }
}