
import 'package:flutter/cupertino.dart';
import 'package:haux/provider_state/landlord_info.dart';

class LandLordInfoProvider extends ChangeNotifier{

  final List<LandLordInfo> _listOfAgent = [
    LandLordInfo(landLordImage: "assets/image/agent1.jpg",landLordName: "Mrs Jhaymes",landLordId: "a1",
    landLordDetails: "I am a trust worthy agent. Currently a student of the department of Medicine. I advocate for all the house listed here as I am also a tenant in one of them",
    phoneNumber: "07012540083", address: "Room 306 HMC lodge"
    ),
    LandLordInfo(landLordImage: "assets/image/agent1.jpg",landLordName: "Mrs Jhaymes",landLordId: "a2",
    landLordDetails: "I am a trust worthy agent. Currently a student of the department of Medicine. I advocate for all the house listed here as I am also a tenant in one of them",
    phoneNumber: "07012540083",address: "Room 307 chidex lodge"
    ),
    LandLordInfo(landLordImage: "assets/image/agent1.jpg",landLordName: "Mrs Jhaymes",landLordId: "a3",
    landLordDetails: "I am a trust worthy agent. Currently a student of the department of Medicine. I advocate for all the house listed here as I am also a tenant in one of them",
    phoneNumber: "07012540083", address: "Room 306 burna lodge"
    ),
    LandLordInfo(landLordImage: "assets/image/agent1.jpg",landLordName: "Mrs Jhaymes",landLordId: "a4",
    landLordDetails: "I am a trust worthy agent. Currently a student of the department of Medicine. I advocate for all the house listed here as I am also a tenant in one of them",
    phoneNumber: "07012540083", address: "Room 306 bebe lodge"
    ),
  ];

     List<LandLordInfo> get agentList{
       return [..._listOfAgent];
     }
     LandLordInfo findById(String agentId){
        return _listOfAgent.firstWhere((element) => agentId == element.landLordId);
     }
}