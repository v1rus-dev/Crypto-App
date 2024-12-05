import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CryptoIcon extends StatefulWidget {
  const CryptoIcon({super.key, required this.name, required this.imageUri});

  final String name;
  final String imageUri;

  @override
  State<CryptoIcon> createState() => _CryptoIconState();
}

class _CryptoIconState extends State<CryptoIcon> {
  late Future<String?> _assetPath;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _assetPath = _findAssetForCrypto(widget.name);
  }

  Future<String?> _findAssetForCrypto(String name) async {
    final String jsonString = await rootBundle.loadString('assets/mapping/crypto_mapping.json');
    final Map<String, dynamic> mapping = json.decode(jsonString);

    debugPrint("Name: $name");

    return mapping[name];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: _assetPath,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        if (snapshot.hasError || snapshot.data == null) {
          return const Icon(Icons.error, color: Colors.red);
        }

        return SvgPicture.asset('assets/icons/crypto/${snapshot.data!}');
      },
    );
  }
}