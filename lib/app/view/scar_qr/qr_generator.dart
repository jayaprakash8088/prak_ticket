import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrGenerator extends StatelessWidget {
  const QrGenerator({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return QrImage(data:text,
      embeddedImageStyle: QrEmbeddedImageStyle(
        size: const Size(
          100,
          100,
        ),
      ),
    size: 280.0,);
  }
}
