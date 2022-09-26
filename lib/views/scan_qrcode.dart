import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeView extends ConsumerWidget {
  const QrCodeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(appBar: AppBar(), body: _CameraWidget());
  }
}

class _CameraWidget extends ConsumerWidget {
  _CameraWidget({Key? key}) : super(key: key);
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 350.0
        : 500.0;
    return QRView(
      key: qrKey,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.blue,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onQRViewCreated: (controller) {
        ref.watch(_qrcontroller.notifier).state = controller;
        controller.scannedDataStream.listen((event) {
          ref.watch(_resultQrScan.notifier).state = event;
        });
      },
      onPermissionSet: (ctrl, p) => (context, ctrl, p) {
        debugPrint('${DateTime.now().toIso8601String()}_onPermissionSet $p');
        if (!p) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('no Permission')),
          );
        }
      },
    );
  }
}

final _resultQrScan = StateProvider<Barcode?>((ref) => null);
final _qrcontroller = StateProvider<QRViewController?>((ref) => null);
