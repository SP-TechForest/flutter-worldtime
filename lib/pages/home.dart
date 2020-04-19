import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    String status = data["status"];
    print(data);
    String bgImage;
    bgImage = data["Daytime"];
    return Scaffold(

      body: SafeArea(
        bottom: false,
        top: false,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/$bgImage"),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,200,0,0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                    onPressed: () async{
                      dynamic result = await Navigator.pushNamed(context, "/location");
                      setState(() {
                        data = {
                          "time": result["time"],
                          "location": result["location"],
                          "flag":result["flag"],
                          "Daytime":result["Daytime"],
                          "status": result["status"],
                        };
                      });
                    },
                    icon: Icon(
                      Icons.edit_location,
                      color: Colors.grey[300],
                    ),
                    label: Text(
                      "Edit Location",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[300]
                      ),
                    ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data["location"],
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2,
                        color: Colors.grey[300]
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Text(
                  data["time"],
                  style: TextStyle(
                    fontSize: 66,
                    color: Colors.grey[300]
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  "$status",
                  style: TextStyle(
                    fontSize: 25,
                    letterSpacing: 2,
                    color: Colors.grey[300]
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
