import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter/services.dart';

class MaskedImage extends StatelessWidget {
  final String asset;
  final String mask;
  final bool local;
  const MaskedImage({super.key, required this.asset, required this.mask, this.local = false});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return FutureBuilder<List>(
        future: _createShaderAndImage(
            asset, mask, constraints.maxWidth, constraints.maxHeight, local),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const SizedBox.shrink();
          return ShaderMask(
            blendMode: BlendMode.dstATop,
            shaderCallback: (rect) => snapshot.data?[0],
            child: snapshot.data?[1],
          );
        },
      );
    });
  }

  Future<List> _createShaderAndImage(
      String asset, String mask, double w, double h, bool local) async {
      dynamic data;
      if (local == true) {
        data = await rootBundle.load(asset);
      } else {
        data = (await NetworkAssetBundle(Uri.parse(asset)).load(asset))
        .buffer
        .asUint8List();
      }
    // ByteData dataLocal = await rootBundle.load(asset);
    // Uint8List data =
    ByteData maskData = await rootBundle.load(mask);

    Codec codec = await instantiateImageCodec(maskData.buffer.asUint8List(),
        targetWidth: w.toInt(), targetHeight: h.toInt());
    FrameInfo fi = await codec.getNextFrame();

    ImageShader shader = ImageShader(
        fi.image, TileMode.clamp, TileMode.clamp, Matrix4.identity().storage);
    Image image = Image.memory(data.buffer.asUint8List(),
        fit: BoxFit.cover, width: w, height: h);
    // Image image = Image.network(data.buffer.asUint8List(), fit: BoxFit.cover, width: w, height: h);
    return [shader, image];
  }
}
