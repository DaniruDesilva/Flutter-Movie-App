import 'package:flutter/material.dart';

class CustomToolBar extends StatelessWidget {
  const CustomToolBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              )),
          const Spacer(),
          const Text(
            'Movie Hub',
            style: TextStyle(
                color: Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.bold),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}