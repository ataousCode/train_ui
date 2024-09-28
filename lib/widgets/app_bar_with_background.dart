import 'package:flutter/material.dart';

class AppBarWithBackground extends StatelessWidget {
  const AppBarWithBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      flexibleSpace: Stack(
        children: [
          // background image
          Container(
            //height: 180,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/train1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // time display
          // const Positioned(
          //   top: 30,
          //   right: 20,
          //   child: Text(
          //     '17:36', // Time display
          //     style: TextStyle(color: Colors.white, fontSize: 24),
          //   ),
          // )
        ],
      ),
    );
  }
}
