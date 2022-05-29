import 'package:flutter/material.dart';

Widget customItemDrawer({
  required String image,
  required String text,
  required Function() function,
}) =>
    GestureDetector(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.black12,
              radius: 19.5,
              child: CircleAvatar(
                backgroundColor: const Color(0xffffffff),
                radius: 19,
                child: Image.asset(
                  image,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              text,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      onTap: function,
    );
