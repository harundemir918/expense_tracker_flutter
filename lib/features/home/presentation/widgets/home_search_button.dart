import 'package:flutter/material.dart';

class HomeSearchButton extends StatelessWidget {
  const HomeSearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        side: const BorderSide(
          width: 1,
          color: Colors.black12,
        ),
        shape: const CircleBorder(),
      ),
      child: const Icon(
        Icons.search,
      ),
    );
  }
}
