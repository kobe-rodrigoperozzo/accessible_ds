import 'package:flutter/material.dart';

class DsImage extends StatelessWidget {
  final String imageUrl;
  final String altText;
  final double? height;
  final double? width;

  const DsImage({
    Key? key,
    required this.imageUrl,
    required this.altText,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      child: Image.network(
        imageUrl,
        height: height,
        width: width,
      ),
      label: altText,
    );
  }
}
