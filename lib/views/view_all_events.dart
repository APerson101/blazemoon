import 'package:blaze/views/buy_event_ticket_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewAllEventsView extends ConsumerWidget {
  const ViewAllEventsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: [
          ...List.generate(
              2000,
              (index) => GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const BuyEventTicketView()));
                    },
                    child: SizedBox(
                      width: 150,
                      height: 150,
                      child: Column(
                        children: [
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: FittedBox(
                              child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Image.asset(
                                      'assets/images/metaverse.jpg')),
                            ),
                          ),
                          ListTile(
                            title: const Text('Metaverse Event'),
                            subtitle: const Text('0.4 ETH'),
                            trailing: IconButton(
                                onPressed: () {}, icon: const Icon(Icons.info)),
                          )
                        ],
                      ),
                    ),
                  ))
        ],
      ),
    );
  }
}
