import 'package:auto_size_text/auto_size_text.dart';
import 'package:crypto_currency/features/converter/domain/entities/entities.dart';
import 'package:crypto_currency/features/converter/presentation/widgets/select_coin_buttons.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ConverterCard extends StatefulWidget {
  ConverterCard({
    super.key,
    required this.count,
    required this.type,
    required this.isSelected,
    required this.hint,
    required this.selectedCoin,
    required this.isLoadingPrice,
    this.onTap,
    this.onTapOnSelectedCoin,
  });

  final String count;
  final ConverterSideType type;
  final bool isSelected;
  final String hint;
  final String selectedCoin;
  final bool isLoadingPrice;
  VoidCallback? onTap;
  VoidCallback? onTapOnSelectedCoin;

  @override
  State<ConverterCard> createState() => _ConverterCardState();
}

class _ConverterCardState extends State<ConverterCard> {
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 350),
          width: double.infinity,
          height: 70,
          curve: Curves.fastOutSlowIn,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey[100],
            border: Border.all(
                color: widget.isSelected ? Colors.blue : Colors.transparent),
          ),
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 10),
                  child: widget.isLoadingPrice
                      ? const CircularProgressIndicator.adaptive()
                      : AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: widget.count.isEmpty
                              ? Text(
                                  widget.hint,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                      fontSize: 24),
                                )
                              : AutoSizeText(
                                  widget.count,
                                  maxFontSize: 24,
                                  maxLines: 1,
                                  minFontSize: 18,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                ),
                        ),
                ),
                const Spacer(),
                SelectCoinButton(
                  coinName: widget.selectedCoin,
                  onTap: widget.onTapOnSelectedCoin,
                ),
              ],
            ),
          ),
        ),
      );
}
