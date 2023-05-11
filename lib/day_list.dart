import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class list_days extends StatelessWidget {
  const list_days({
    super.key,
    required this.day,
    required this.weather,
    required this.temp,
    required this.callback,
    required this.icondata,
  });
  final String weather;
  final String temp;
  final VoidCallback callback;
  final String icondata;
  final String day;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Container(
        // decoration: BoxDecoration(
        //     border: Border.all(
        //   color: Colors.white60,
        //   width: 5,
        // )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              child: Text(
                day,
                style: const TextStyle(fontSize: 18, color: Colors.white60),
              ),
              onPressed: callback,
            ),
            const SizedBox(
              width: 20,
            ),
            icondata.isNotEmpty
                ? Image.network(
                    cacheHeight: 50,
                    cacheWidth: 50,
                    "https://cdn.weatherbit.io/static/img/icons/${icondata}.png")
                : const Icon(Icons.wechat_outlined),
            Expanded(
              child: Text(
                weather,
                style: const TextStyle(fontSize: 13, color: Colors.white60),
              ),
            ),
            Text(
              "$temp*",
              style: const TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
