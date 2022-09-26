import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TranferAmountView extends ConsumerWidget {
  const TranferAmountView({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      child: Stack(
        // fit: StackFit.passthrough,
        children: [
          // Positioned(
          //     top: 200,
          //     left: 0,
          //     right: 0,
          //     child: contact != null
          //         ? _ReceiverView(contact: contact!)
          //         : Container()),
          Positioned(
            top: 20,
            left: 0,
            // right: 0,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: DropdownButton<currencies>(
                  style: const TextStyle(fontSize: 24),
                  value: ref.watch(_currency),
                  items: [
                    ...currencies.values
                        .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(describeEnum(
                              e,
                            ))))
                        .toList()
                  ],
                  onChanged: (selected) {
                    selected != null
                        ? ref.watch(_currency.notifier).state = selected
                        : null;
                  }),
            ),
          ),
          const Positioned(top: 100, left: 10, right: 10, child: _AmountView()),
          Positioned(
              top: 250,
              height: MediaQuery.of(context).size.height * .5,
              left: 20,
              right: 20,
              child: const NumbersView()),
          Positioned(
            bottom: 20,
            right: 10,
            left: 10,
            child: StyledButton(
                onPressed: () async {
                  // await sl<RapydAPI>().sendMoney(
                  //     sender: sl<HiveHelper>().activeWallet!.id,
                  //     success: () {
                  //       ScaffoldMessenger.of(context)
                  //           .showSnackBar(const SnackBar(
                  //               content: ListTile(
                  //         title: Text("Transfer Successful"),
                  //       )));
                  //       Future.delayed(const Duration(seconds: 2), () {
                  //         GoRouter.of(context).pop();
                  //       });
                  //     },
                  //     error: () {
                  //       ScaffoldMessenger.of(context)
                  //           .showSnackBar(const SnackBar(
                  //               content: ListTile(
                  //         title: Text("Failed to Send, Please try again later"),
                  //       )));
                  //     },
                  //     amount: ref.watch(_amount),
                  //     receiver: contact!.eWalletID,
                  //     currency: describeEnum(ref.watch(_currency)));
                },
                child: Text('Send  ${ref.watch(_amount)}',
                    style: const TextStyle(fontSize: 24))),
          )
        ],
      ),
    );
  }
}

final _currency = StateProvider((ref) => currencies.usdc);
final _amount = StateProvider((ref) => '0.0');

enum currencies { usdc, eth, eur }

class _AmountView extends ConsumerWidget {
  const _AmountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 75,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              ref.watch(_amount),
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 34),
            ),
          ),
        ),
      ),
    );
  }
}

class NumbersView extends ConsumerWidget {
  const NumbersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Wrap(
        spacing: 30,
        runSpacing: 10,
        children: [
          ...List.generate(9, (index) {
            var activeColor = StateProvider<Color?>(
                (ref) => Colors.purpleAccent.withOpacity(.6));
            return GestureDetector(
                onTap: () {
                  var amount = ref.watch(_amount);
                  amount += (index + 1).toString();
                  ref.watch(_amount.notifier).state = amount;
                },
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: ref.watch(activeColor),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(26.0),
                    child: Text(
                      (index + 1).toString(),
                      style: TextStyle(
                          fontSize: 46,
                          color: ref.watch(activeColor) != null
                              ? Colors.white
                              : Colors.black),
                    ),
                  ),
                ));
          }),
          Builder(builder: (context) {
            var activeColor = StateProvider<Color?>(
                (ref) => Colors.purpleAccent.withOpacity(.6));
            return GestureDetector(
                onTap: () {
                  var amount = ref.watch(_amount);
                  amount += '.'.toString();
                  ref.watch(_amount.notifier).state = amount;
                },
                child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: ref.watch(activeColor),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Text(
                        '.',
                        style: TextStyle(
                            fontSize: 46,
                            color: ref.watch(activeColor) != null
                                ? Colors.white
                                : Colors.black),
                      ),
                    )));
          }),
          Builder(builder: (context) {
            var tappedColor = Colors.purpleAccent.withOpacity(.6);
            return GestureDetector(
                onTap: () {
                  var amount = ref.watch(_amount);
                  amount += '0'.toString();
                  ref.watch(_amount.notifier).state = amount;
                },
                child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: tappedColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(26.0),
                      child: Text(
                        '0',
                        style: TextStyle(color: Colors.white, fontSize: 46),
                      ),
                    )));
          }),
          Padding(
            padding: const EdgeInsets.all(26.0),
            child: IconButton(
              icon: Icon(
                Icons.backspace,
                color: Colors.purpleAccent.withOpacity(.7),
                size: 48,
              ),
              onPressed: () {
                var ammount = ref.watch(_amount);
                if (ammount.isEmpty) {
                  return;
                } else {
                  var newAmount = ammount.substring(0, ammount.length - 1);
                  ref.watch(_amount.notifier).state = newAmount;
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class StyledButton extends StatelessWidget {
  const StyledButton(
      {Key? key,
      required this.onPressed,
      required this.child,
      this.opacity = 1})
      : super(key: key);
  final void Function()? onPressed;
  final double opacity;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          primary: Colors.deepPurpleAccent,
          minimumSize: Size(width * .8, 75),
          padding: const EdgeInsets.all(10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      child: child,
    );
  }
}
