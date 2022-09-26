import 'package:blaze/views/dashboard_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CreateWalletView extends StatelessWidget {
  const CreateWalletView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Wallet"),
      ),
      body: Column(
        children: [
          ...Chains.values
              .map((e) => Card(
                    child: ListTile(
                      onTap: () async {
                        await Future.delayed(const Duration(seconds: 4), () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      "Wallet created and funded  successful")));
                        });
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const DashboardView()));
                      },
                      leading: const Icon(Icons.ac_unit_rounded),
                      title: Text(describeEnum(e)),
                    ),
                  ))
              .toList()
        ],
      ),
    );
  }
}

enum Chains { etherium, polygon, avalanche }
