import 'package:flutter/material.dart';

class Tem_container extends StatelessWidget {
  const Tem_container({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          print("maitheen");
        },
        child: Container(
          width: 70,
          height: 120,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.blue,
                blurRadius: 20,
                spreadRadius: 1,
              )
            ],
            borderRadius: BorderRadius.circular(30),
            color: Colors.blue,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "23",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                Icon(Icons.wifi_tethering),
                Text("10:00")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
