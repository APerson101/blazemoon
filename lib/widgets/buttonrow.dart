import 'package:blaze/views/create_event_view.dart';
import 'package:blaze/views/qrcode_view.dart';
import 'package:blaze/views/send_funds_view.dart';
import 'package:blaze/views/view_all_events.dart';
import 'package:flutter/material.dart';

class ButtonRowView extends StatelessWidget {
  const ButtonRowView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.spaceEvenly,
      children: [
        _ButtonWidget(
          icon: const Icon(
            Icons.arrow_upward,
            color: Colors.white,
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const TranferAmountView()));
          },
        ),
        _ButtonWidget(
          icon: const Icon(
            Icons.qr_code,
            color: Colors.white,
          ),
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const QrCodeWallet()));
          },
        ),
        _ButtonWidget(
          icon: const Icon(
            Icons.swap_calls,
            color: Colors.white,
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ViewAllEventsView()));
          },
        ),
        _ButtonWidget(
          icon: const Icon(
            Icons.event,
            color: Colors.white,
          ),
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => CreateEventView()));
          },
        )
      ],
    );
  }
}

class _ButtonWidget extends StatelessWidget {
  const _ButtonWidget({Key? key, required this.onTap, required this.icon})
      : super(key: key);
  final void Function() onTap;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
          width: 75,
          height: 75,
          child: DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(30)),
              child: icon)),
    );
  }
}
