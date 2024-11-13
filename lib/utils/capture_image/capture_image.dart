import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:buycar/domain/invoice.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class CaptureImage {
  Future<void> captureAndSharePng({
    required GlobalKey globalKey,
    required Invoice invoice,
  }) async {
    try {
      RenderRepaintBoundary boundary = globalKey.currentContext
          ?.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      if (byteData != null) {
        final buffer = byteData.buffer.asUint8List();

        // Save the image to a temporary directory
        final directory = await getTemporaryDirectory();
        final imagePath = '${directory.path}/${invoice.client}.png';
        File(imagePath).writeAsBytesSync(buffer);

        // Share the image
        await Share.shareXFiles([XFile(imagePath)],
        //Text to show in message to share
            text: '');
      }
    } catch (e) {
      log('Error capturing image: $e');
    }
  }
}
