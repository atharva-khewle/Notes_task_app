import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../pages/calender/meeting.dart';

class calenDB{
  List<Meeting>? meetings = <Meeting>[];
  List<Meeting> meetings2 = <Meeting>[];
  List<dynamic> meetings3 = <dynamic>[];

//reference box
  final box2 = Hive.box("box2");



  void loaddb(){

    meetings3?.add(box2.get("CALENDERLIST"));
    print("meetings check length");



if(meetings3[0] !=null ) {
  print(meetings3[0].length);

  for (int i = 0; i < meetings3[0].length; i++) {
    print(i);
    meetings?.add(Meeting(
      meetings3[0][i].from, meetings3[0][i].to, meetings3[0][i].eventName,
      meetings3[0][i].isAllDay,));
  }
  // print(meetings3[0][2].eventName);
  // meetings = meetings3;
}


  }

  void updatedb(){
    box2.put("CALENDERLIST", meetings);
  }


  void loaddb2(){
    meetings2 = box2.get("CALENDERLIST2");
  }

  void updatedb2(){
    box2.put("CALENDERLIST2", meetings2);
  }

}
