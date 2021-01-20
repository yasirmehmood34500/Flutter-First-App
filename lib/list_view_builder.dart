import 'dart:convert';

import 'package:first_flutter_app/drink_detail.dart';
import "package:flutter/material.dart";
import 'package:http/http.dart' as http;

class ListViewBuilder extends StatefulWidget {
  @override
  _ListViewBuilderState createState() => _ListViewBuilderState();
}

class _ListViewBuilderState extends State<ListViewBuilder> {
  var api = "https://thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail";
  var res, drinks;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    res = await http.get(api);
    drinks = jsonDecode(res.body)["drinks"];
    // print(drinks.toString());
    setState(() {});
    // print(drinks.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Center(child: Text("Testing App ")),
        elevation: 0.0,
      ),
      body: Center(
        child: res != null
            ? ListView.builder(
                itemCount: drinks.length,
                itemBuilder: (context, index) {
                  var drink = drinks[index];
                  return ListTile(
                    leading: Hero(
                      tag: drink["idDrink"],
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(drink["strDrinkThumb"] ??
                            "https://rimatour.com/wp-content/uploads/2017/09/No-image-found.jpg"),
                      ),
                    ),
                    title: Text(
                      "${drink["strDrink"]}",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    subtitle: Text(
                      "${drink["idDrink"]}",
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DrinkDetail(drink: drink),
                            fullscreenDialog: true,
                          ));
                    },
                  );
                })
            : CircularProgressIndicator(),
      ),
    );
  }
}
