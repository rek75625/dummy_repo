import 'package:flutter/material.dart';

class HerosButtons extends StatelessWidget {
  final String readmore;
  final bool only;
  final VoidCallback? onPressed;

  const HerosButtons({
    super.key,
    this.readmore = "Read More",
    this.only = true,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return only == true
        ? OutlinedButton(onPressed: onPressed, child: Text(readmore))
        : Wrap(
            spacing: 20,
            children: [
              ElevatedButton(onPressed: () {}, child: const Text("Hire Me")),

              OutlinedButton(
                onPressed: () {},
                child: const Text("Download CV"),
              ),
            ],
          );
  }
}
