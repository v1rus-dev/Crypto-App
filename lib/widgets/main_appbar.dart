import 'package:crypto_currency/common/settings/bloc/settings_bloc.dart';
import 'package:crypto_currency/common/settings/bloc/settings_state.dart';
import 'package:crypto_currency/utils/app_images.dart';
import 'package:crypto_currency/widgets/icon_button_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppbar({super.key, required this.title, this.actions});

  final String title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Expanded(child: BlocBuilder<SettingsBloc, SettingsState>(
              builder: (context, state) {
            return const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [_LightDarkThemeChanger()],
            );
          }))
        ],
      ),
      shadowColor: const Color.fromARGB(255, 224, 224, 224),
      elevation: 1,
      actions: actions,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 16);
}

class _LightDarkThemeChanger extends StatefulWidget {
  const _LightDarkThemeChanger({super.key});

  @override
  State<_LightDarkThemeChanger> createState() => _LightDarkThemeChangerState();
}

class _LightDarkThemeChangerState extends State<_LightDarkThemeChanger>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return Row(
          children: [
            IconButtonWrapper(
                icon: SvgPicture.asset(AppImages.sun), onPressed: () {}),
            IconButtonWrapper(
                icon: SvgPicture.asset(AppImages.moon), onPressed: () {})
          ],
        );
      },
    );
  }
}
