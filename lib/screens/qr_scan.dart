import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:presensi_himaster/theme.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScan extends StatefulWidget {
  const QrScan({Key? key}) : super(key: key);

  @override
  State<QrScan> createState() => _QrScanState();
}

class _QrScanState extends State<QrScan> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              alignment: Alignment.bottomCenter, child: _buildQrView(context)),
          Positioned(
              top: getSafeArea(context),
              left: 36,
              child: InkWell(
                onTap: (() {
                  Navigator.pop(context);
                }),
                child: Row(
                  children: [
                    Icon(
                      Icons.close_rounded,
                      size: 24,
                      color: white,
                    ),
                    SizedBox(
                      width: 0.018 * getWidth(context),
                    ),
                    Text(
                      'Tutup Kamera',
                      style: semiBoldStyle(13, white),
                    )
                  ],
                ),
              )),
          Positioned(
              bottom: 0.20 * getHeight(context),
              right: 0,
              left: 0,
              child: Column(
                children: [
                  Text(
                    'Arahkan kamera kamu ke QR Code',
                    style: semiBoldStyle(13, white),
                  ),
                  Text(
                    'yang sudah disediakan',
                    style: semiBoldStyle(13, white),
                  )
                ],
              ))
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: white,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: 0.70 * getWidth(context)),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.resumeCamera();
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
