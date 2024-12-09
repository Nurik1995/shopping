import 'package:flutter/material.dart';

class CartBottomNavBar extends StatelessWidget {
  const CartBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      // color: Colors.red,
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: const CircularNotchedRectangle(),
      child: Container(
        // height: 20,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total:",
                  style: TextStyle(
                    color: Color.fromARGB(255, 124, 126, 146),
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "\$250",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4C53A5),
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.center,
              height: 40,
              // width: 500,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFF4C53A5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                "Check out",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
