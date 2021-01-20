import "package:flutter/material.dart";

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var myText = "Testing App";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        title: Center(child: Text("Testing App")),
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              "https://www.timetechsol.com/img/logo2.png",
              fit: BoxFit.contain,
              height: 100.0,
              width: 100.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(myText),
                SizedBox(
                  width: 20.0,
                ),
                FlatButton(
                  color: Colors.cyan,
                  onPressed: () {
                    myText = "Click on Button";
                    setState(() {});
                  },
                  child: Text(
                    "Click Button",
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
