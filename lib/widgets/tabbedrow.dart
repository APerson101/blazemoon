import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'assets_view.dart';

class TabbedView extends StatelessWidget {
  const TabbedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Column(
          children: [
            SizedBox(
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: Row(children: [
                const SizedBox(
                  height: 100,
                  width: 250,
                  child: TabBar(
                      labelColor: Colors.deepPurple,
                      indicatorWeight: 0.1,
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(text: "ASSETS"),
                        Tab(text: "TICKETS"),
                      ]),
                ),
                const Spacer(),
                IconButton(onPressed: () {}, icon: const Icon(Icons.add))
              ]),
            ),
            const Expanded(
                child: TabBarView(children: [
              ListOfAssetsView(),
              TicketsView(),
            ]))
          ],
        ));
  }
}

final hasTicket = StateProvider((ref) => false);

class TicketsView extends ConsumerWidget {
  const TicketsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(hasTicket) == false
        ? const Center(child: Text("No tickets"))
        : const ListTile(
            leading: Icon(Icons.ac_unit_rounded),
            title: Text("Metaverse event"),
            trailing: Text('.4 ETH'),
          );
  }
}
