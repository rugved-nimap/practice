
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LocalizationPage extends StatelessWidget {
  const LocalizationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Localization"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.tr('string_one'),
              style: const TextStyle(color: Colors.white, fontSize: 17),
            ),
            Text(
              context.tr('string_two'),
              style: const TextStyle(color: Colors.white, fontSize: 17),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FilledButton(onPressed: () {
                      context.setLocale(const Locale('en'));
                    }, child: const Text('English')),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FilledButton(onPressed: () {
                      context.setLocale(const Locale('hi'));
                    }, child: const Text('Hindi')),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
  
}