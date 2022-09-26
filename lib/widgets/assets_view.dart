import 'package:flutter/material.dart';

class ListOfAssetsView extends StatelessWidget {
  const ListOfAssetsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(
          1,
          (index) => const Padding(
                padding: EdgeInsets.all(15.0),
                child: Card(
                    child: ListTile(
                  leading: Text("htc"),
                  title: Text("Test Coin"),
                  subtitle: Text("400 HTC"),
                )),
              )),
    );
  }
}
