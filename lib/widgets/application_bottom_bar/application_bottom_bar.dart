import 'package:crypto_currency/widgets/application_bottom_bar/application_bottom_bar_item.dart';
import 'package:flutter/material.dart';

class ApplicationBottomBar extends StatelessWidget {
  ApplicationBottomBar(
      {Key? key,
      required this.items,
      this.backgroundColor,
      this.currentIndex = 0,
      this.onTap,
      this.selectedItemColor,
      this.unselectedItemColor,
      this.itemShape = const StadiumBorder(),
      this.containerRadius,
      this.containerBackgroundColor,
      this.selectedContentColor,
      this.unselectedContentColor})
      : super(key: key);

  final List<ApplicationBottomBarItem> items;

  final int currentIndex;

  final Function(int)? onTap;

  final Color? backgroundColor;

  final Color? containerBackgroundColor;

  final Color? selectedItemColor;

  final Color? unselectedItemColor;

  final Color? selectedContentColor;

  final Color? unselectedContentColor;

  final BorderRadiusGeometry? containerRadius;

  final ShapeBorder itemShape;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final _containerBorderRadius = containerRadius ??
        const BorderRadius.only(
            topLeft: Radius.circular(16), topRight: Radius.circular(16));

    final _containerBackgroundColor = containerBackgroundColor ?? Colors.white;

    return SafeArea(
      child: Container(
        height: 100,
        width: screenWidth,
        decoration: BoxDecoration(
            color: _containerBackgroundColor,
            borderRadius: _containerBorderRadius),
        child: Row(
          mainAxisAlignment: items.length <= 2
              ? MainAxisAlignment.spaceEvenly
              : MainAxisAlignment.spaceBetween,
          children: [
            for (final item in items)
              SizedBox(
                width: screenWidth / items.length,
                child: ApplicationBottomBarItemView(
                  title: item.title,
                  icon: item.icon,
                  isSelected: items.indexOf(item) == currentIndex,
                  onTap: () => onTap?.call(items.indexOf(item)),
                  width: screenWidth / items.length,
                  selectedColor: selectedItemColor,
                  unselectedColor: unselectedItemColor,
                  selectedContentColor: selectedContentColor,
                  unselectedContentColor: unselectedContentColor,
                ),
              )
          ],
        ),
      ),
    );
  }
}

class ApplicationBottomBarItemView extends StatelessWidget {
  const ApplicationBottomBarItemView(
      {super.key,
      required this.title,
      required this.icon,
      required this.isSelected,
      this.selectedColor,
      this.unselectedColor,
      this.onTap,
      required this.width,
      this.selectedContentColor,
      this.unselectedContentColor});

  final Widget title;

  final Widget icon;

  final double width;

  final bool isSelected;

  final Function()? onTap;

  final Color? selectedColor;
  final Color? unselectedColor;

  final Color? selectedContentColor;
  final Color? unselectedContentColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TweenAnimationBuilder(
        tween: Tween(
          end: isSelected ? 1.0 : 0,
        ),
        duration: const Duration(milliseconds: 250),
        builder: (context, t, _) {
          final _selectedColor = selectedColor ?? theme.primaryColor;
          final _unselectedColor = unselectedColor ?? theme.iconTheme.color;

          final _selectedContentColor = selectedContentColor ?? Colors.black;
          final _unselectedContentColor = unselectedContentColor ?? Colors.grey;

          final _color =
              Color.lerp(_unselectedColor, _selectedColor, t.toDouble());
          final _contentColor = Color.lerp(
              _unselectedContentColor, _selectedContentColor, t.toDouble());
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: _color,
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  onTap?.call();
                },
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(2)),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconTheme(
                            data: IconThemeData(color: _contentColor),
                            child: icon),
                        Visibility(
                            visible: isSelected,
                            child: DefaultTextStyle(
                                style: TextStyle(color: _contentColor),
                                child: title))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
