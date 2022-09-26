import 'package:blaze/firebase_options.dart';
import 'package:blaze/models/walletModel.dart';
import 'package:blaze/views/create_wallet_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: const CreateWalletView());
  }
}

class BalanceCardView extends StatelessWidget {
  BalanceCardView({Key? key}) : super(key: key);
  var wallet = List.generate(
      4,
      (index) => ChainModel(
          name: index == 0
              ? 'eth'
              : index == 1
                  ? 'polygon'
                  : index == 2
                      ? 'avalanche'
                      : 'moonbeam',
          wallets: List.generate(
              4,
              (index) => WalletModel(
                  balance: 'balance',
                  name: 'name',
                  address: 'address',
                  chain: 'chain'))));
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: SizedBox(
        height: 200,
        child: DecoratedBox(
          decoration: BoxDecoration(
              color: Colors.orange, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  leading: Test(
                    allWallets: wallet,
                  ),
                  trailing: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.notifications)),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  '62, 566 ETH',
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  '\$ 400.4',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Test extends ConsumerWidget {
  const Test({Key? key, required this.allWallets}) : super(key: key);
  final List<ChainModel> allWallets;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 175,
      height: 50,
      child: DecoratedBox(
          decoration: BoxDecoration(
            // color: Colors.pinkAccent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Align(
            alignment: Alignment.center,
            child: ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => _WalletsWidget(
                          allWallets: allWallets,
                        )));
              },
              leading: const Icon(Icons.wallet),
              title: const Text('main'),
              trailing: const Icon(Icons.arrow_drop_down_circle_outlined),
            ),
          )),
    );
  }
}

class _WalletsWidget extends ConsumerWidget {
  _WalletsWidget({Key? key, required this.allWallets}) : super(key: key);
  final List<ChainModel> allWallets;
  final expansion = StateNotifierProvider<_ExpansionList, List<bool>>(
      (ref) => _ExpansionList());
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (index, isExpanded) {
            ref.watch(expansion.notifier).changeState(index, !isExpanded);
          },
          children: [
            ...allWallets.map((chain) {
              return ExpansionPanel(
                  headerBuilder: (context, isExpanded) {
                    return ListTile(title: Text(chain.name));
                  },
                  isExpanded: ref.watch(expansion)[allWallets.indexOf(chain)],
                  body: Column(
                    children: [
                      ...chain.wallets
                          .map((e) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  child: ListTile(
                                    onTap: () {},
                                    title: Text(e.address),
                                    subtitle: Text(e.balance),
                                    leading: Text(e.name),
                                  ),
                                ),
                              ))
                          .toList()
                    ],
                  ));
            }).toList()
          ],
        ),
      ),
    );
  }
}

class _ExpansionList extends StateNotifier<List<bool>> {
  _ExpansionList() : super(List.filled(4, false));

  changeState(int index, bool newStaet) {
    state[index] = newStaet;
    state = [...state];
  }
}
