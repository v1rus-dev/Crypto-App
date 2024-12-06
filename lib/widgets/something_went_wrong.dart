import 'package:flutter/material.dart';

class SomethingWentWrong extends StatelessWidget {
  const SomethingWentWrong({super.key, this.onTap});

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Something went wrong', style: theme.textTheme.titleMedium),
          Text('Please try again later', style: theme.textTheme.bodyMedium),
          OutlinedButton(onPressed: onTap, child: Text("Try again"))
        ],
      ),
    );
  }
}