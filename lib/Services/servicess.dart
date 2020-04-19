import 'dart:async';

import 'package:http/http.dart';
import "dart:convert";
import "package:intl/intl.dart";
class WorldTime{
  String location;
  String time;
  String flag;
  String url;
  String Daytime;
  String statu;
  WorldTime({this.location,this.flag,this.url});
  Future<void> getTime() async {
    Response response = await get("http://worldtimeapi.org/api/timezone/$url");
    Map data = jsonDecode(response.body);
    String datetime = data["datetime"];
    String offset = data["utc_offset"].substring(1,3);
    String oom = data["utc_offset"].substring(4,6);
    print("hii");
    print(data["utc_offset"]);
    //print(datetime);
    //print(offset);
    DateTime now = DateTime.parse(datetime);
    await Timer.periodic(Duration (seconds: 7), (timer) { });

    now = now.add(Duration(hours: int.parse(offset),minutes: int.parse(oom)));
    if(now.hour>=6 && now.hour<10){
      statu = "Good Morning";
      Daytime = "morning.jpg";
    }
    else if(now.hour>=10 && now.hour<16){
      statu = "Good Afternoon";
      Daytime = "day.jpg";
    }
    else if(now.hour>=16 && now.hour<=22){
      statu = "Good Evening";
      Daytime = "eve.jpg";
    }
    else{
      statu = "Good Night";
      Daytime = "night.jpg";
    }
    time = DateFormat.jm().format(now);
  }

}