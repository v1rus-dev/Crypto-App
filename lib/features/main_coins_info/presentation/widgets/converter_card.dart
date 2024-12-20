import 'package:crypto_currency/common/presentation/utils/context_ext.dart';
import 'package:crypto_currency/widgets/crypto_icon.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class CardConverter extends StatelessWidget {
  CardConverter({super.key, this.onTap});

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.grey[200],
      child: InkWell(
        customBorder:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onTap: () {
          onTap?.call();
        },
        child: SizedBox(
          width: double.infinity,
          height: 160,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    context.lang.converter,
                    style: const TextStyle(
                        fontSize: 38, fontWeight: FontWeight.bold),
                  ),
                ),
                const Gap(16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        _icon('VGX', const EdgeInsets.all(0)),
                        _icon('LTC', const EdgeInsets.only(left: 20, top: 5)),
                        _icon('BTC', const EdgeInsets.only(left: 40, top: 10)),
                      ],
                    ),
                    const Gap(16),
                    const Icon(
                      Icons.double_arrow_outlined,
                      size: 32,
                    ),
                    const Icon(
                      Icons.double_arrow_outlined,
                      size: 32,
                    ),
                    const Icon(
                      Icons.double_arrow_outlined,
                      size: 32,
                    ),
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        _icon('DOCK', const EdgeInsets.all(0)),
                        _icon('DOGE', const EdgeInsets.only(left: 20, top: 5)),
                        _icon('SHIB', const EdgeInsets.only(left: 40, top: 10)),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _icon(String name, EdgeInsetsGeometry padding) => Padding(
        padding: padding,
        child: SizedBox(
          height: 52,
          width: 52,
          child: CryptoIcon(name: name),
        ),
      );
}
