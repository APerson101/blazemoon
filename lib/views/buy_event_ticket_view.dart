import 'package:blaze/views/send_funds_view.dart';
import 'package:blaze/widgets/tabbedrow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BuyEventTicketView extends ConsumerWidget {
  const BuyEventTicketView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: SizedBox(
                      width: 250,
                      height: 300,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: FittedBox(
                          child: Image.asset('assets/images/metaverse.jpg'),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ListTile(
                  title: const Text("Metaverse Event"),
                  subtitle: const Text("0.5 eth"),
                  trailing: const Text('1/2000'),
                  leading: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.info)),
                )
              ],
            ),
          ),
          const Text("more info"),
          const Spacer(),
          StyledButton(
              onPressed: () async {
                ref.watch(hasTicket.notifier).state = true;
                await Future.delayed(const Duration(seconds: 4), () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Purchase successful")));
                });
                Navigator.of(context).pop();
              },
              child: const Text('Buy now')),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
