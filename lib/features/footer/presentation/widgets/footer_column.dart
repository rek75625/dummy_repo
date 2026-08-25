import 'package:flutter/material.dart';

class FooterColumn extends StatelessWidget {
  final String title;
  final List<String> items;

  const FooterColumn({super.key, required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    bool isHover = false;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 20),

        ...items.map(
          (item) => Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: TextButton(
              onHover: (value) {
                isHover = value;
              },
              style: TextButton.styleFrom(
                backgroundColor: isHover
                    ? Colors.amber.shade600
                    : Colors.transparent,
              ),
              onPressed: () {},
              child: Text(
                item,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  height: 1.5,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
