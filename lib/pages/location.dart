import 'package:flutter/material.dart';
import 'package:worldtome/Services/servicess.dart';


class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<WorldTime> locations = [
    WorldTime(url: "Europe/London",location: "London",flag: "uk.png"),
    WorldTime(url: "Europe/Berlin",location: "Athens",flag: "gree.png"),
    WorldTime(url: "Africa/Cairo",location: "Cairo",flag: "egy.png"),
    WorldTime(url: "Africa/Nairobi",location: "Nairobi",flag: "kenya.png"),
    WorldTime(url: "America/Chicago",location: "Chicago",flag: "usa.png"),
    WorldTime(url: "America/New_York",location: "New York",flag: "usa.png"),
    WorldTime(url: "Asia/Seoul",location: "Seoul",flag: "sk.png"),
    WorldTime(url: "Asia/Jakarta",location: "Jakarta",flag: "indo.png"),
    WorldTime(url: "Asia/Kolkata",location: "India",flag: "ind.png"),
  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context,{
      "location": instance.location,
      "flag":instance.flag,
      "time":instance.time,
      "Daytime":instance.Daytime,
      "status": instance.statu,
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(
          "Chouse Location",
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(
                  locations[index].location
                ),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                    "images/${locations[index].flag}",
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
