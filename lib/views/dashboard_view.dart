import 'package:blaze/main.dart';
import 'package:blaze/models/walletModel.dart';
import 'package:blaze/widgets/buttonrow.dart';
import 'package:blaze/widgets/tabbedrow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardView extends ConsumerWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
          BalanceCardView(),
          const ButtonRowView(),
          const Expanded(child: TabbedView())
        ],
      ),
    );
  }
}

final getWallets = FutureProvider((ref) async {});
final getFakeWallets = FutureProvider((ref) async {
  return [
    WalletModel(
        balance: '3',
        name: 'main',
        address: '0x0c8282D896628518CBdF1E3fA0F8CCFB16c924bF',
        chain: 'eth'),
    WalletModel(
        balance: '2',
        name: 'nft',
        address: '0x418517A707C5690471CC43dfC2455129951739e6',
        chain: 'eth'),
  ];
});
