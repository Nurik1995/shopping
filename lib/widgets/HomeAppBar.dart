import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          const Icon(
            Icons.sort,
            size: 30,
            color: Color(0xFF4C53A5),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "DP Shop",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
          ),
          const Spacer(),
          Badge(
            label: const Text(
              "3",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.red,
            padding: const EdgeInsets.all(7),
            // textColor: Colors.white,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, "cartPage");
              },
              child: const Icon(
                Icons.shopping_bag_outlined,
                size: 32,
                color: Color(0xFF4C53A5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
