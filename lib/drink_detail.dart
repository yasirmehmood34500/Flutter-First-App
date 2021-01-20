import "package:flutter/material.dart";

class DrinkDetail extends StatelessWidget {
  final drink;

  const DrinkDetail({Key key, @required this.drink}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(drink["strDrink"]),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: drink["idDrink"],
              child: CircleAvatar(
                radius: 100.0,
                backgroundImage: NetworkImage(drink["strDrinkThumb"] ??
                    "https://rimatour.com/wp-content/uploads/2017/09/No-image-found.jpg"),
              ),
            ),
            SizedBox(
              height: 20.0
            ),
            Text(
              drink["idDrink"],
            ),
            SizedBox(
              height: 20.0
            ),
            Text(
              drink["strDrink"],
              style: TextStyle(
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
