import 'package:flutter/material.dart';

import 'app_bar_page.dart';
import 'button_page.dart';
import 'card_page.dart';
import 'navigation_bar_page.dart';
import 'navigation_rail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,

        // primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Sample App'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                _Button(
                  onPressed: () {
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ButtonPage(),
                      ),
                    );
                  },
                  text: 'button page',
                ),
                _Button(
                  onPressed: () {
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CardPage(),
                      ),
                    );
                  },
                  text: 'card page',
                ),
                _Button(
                  onPressed: () {
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AppBarPage(),
                      ),
                    );
                  },
                  text: 'app bar page',
                ),
                _Button(
                  onPressed: () {
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NavigationBarPage(),
                      ),
                    );
                  },
                  text: 'navigation bar page',
                ),
                _Button(
                  onPressed: () {
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NavigationRailPage(),
                      ),
                    );
                  },
                  text: 'navigation rail page',
                ),
                _Button(
                  onPressed: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Title'),
                      content: const Text('description'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  ),
                  text: 'AlertDialog',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.onPressed,
    required this.text,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 300,
          height: 50,
          child: ElevatedButton(
            onPressed: onPressed,
            child: Text(text),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
