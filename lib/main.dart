import 'package:debouncer/core/utils/debouncer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var autoComplete = "";
  final debouncer = Debouncer(milliseconds: 500);

  void processAutoComplet(String text) {
    setState(() {
      autoComplete = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                onChanged: (value) {
                  debouncer.call(
                    () {
                      processAutoComplet(value);
                    },
                  );
                },
              ),
              Text(autoComplete),
            ],
          ),
        ));
  }
}
