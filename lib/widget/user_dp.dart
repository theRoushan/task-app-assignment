import 'package:flutter/material.dart';

class UserDp extends StatelessWidget {
  const UserDp({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(
            'https://randomuser.me/api/portraits/women/29.jpg',
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            width: 13,
            height: 13,
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
              border: Border.all(
                color: Theme.of(context).colorScheme.background,
                width: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
