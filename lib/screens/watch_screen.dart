import 'package:flutter/material.dart';
import 'package:final_project/config/palette.dart';


class WatchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            title: Text(
              'Watch',
              style: const TextStyle(
                color: Palette.facebookBlue,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              )
            ),
            centerTitle: false,
            floating: true,
          ),
        ],
      ),
    );
  }
}
