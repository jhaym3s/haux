
import 'package:flutter/cupertino.dart';
import 'package:haux/provider_state/agent_info.dart';

class AgentInfoProvider extends ChangeNotifier{

  final List<AgentInfo> _listOfAgent = [
    AgentInfo(agentImagePath: "assets/image/agent1.jpg",agentName: "Mrs Jhaymes",agentId: "a1",
    agentDetails: "I am a trust worthy agent. Currently a student of the department of Medicine. I advocate for all the house listed here as I am also a tenant in one of them",
    phoneNumber: "07012540083", address: "Room 306 HMC lodge"
    ),
    AgentInfo(agentImagePath: "assets/image/agent1.jpg",agentName: "Mrs Jhaymes",agentId: "a2",
    agentDetails: "I am a trust worthy agent. Currently a student of the department of Medicine. I advocate for all the house listed here as I am also a tenant in one of them",
    phoneNumber: "07012540083",address: "Room 307 chidex lodge"
    ),
    AgentInfo(agentImagePath: "assets/image/agent1.jpg",agentName: "Mrs Jhaymes",agentId: "a3",
    agentDetails: "I am a trust worthy agent. Currently a student of the department of Medicine. I advocate for all the house listed here as I am also a tenant in one of them",
    phoneNumber: "07012540083", address: "Room 306 burna lodge"
    ),
    AgentInfo(agentImagePath: "assets/image/agent1.jpg",agentName: "Mrs Jhaymes",agentId: "a4",
    agentDetails: "I am a trust worthy agent. Currently a student of the department of Medicine. I advocate for all the house listed here as I am also a tenant in one of them",
    phoneNumber: "07012540083", address: "Room 306 bebe lodge"
    ),
  ];

     List<AgentInfo> get agentList{
       return [..._listOfAgent];
     }
     AgentInfo findById(String agentId){
        return _listOfAgent.firstWhere((element) => agentId == element.agentId);
     }
}