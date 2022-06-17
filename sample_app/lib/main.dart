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
          child: Column(
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ButtonPage(),
                    ),
                  );
                },
                child: const Text('button page'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CardPage(),
                    ),
                  );
                },
                child: const Text('card page'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AppBarPage(),
                    ),
                  );
                },
                child: const Text('app bar page'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NavigationBarPage(),
                    ),
                  );
                },
                child: const Text('navigation bar page'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NavigationRailPage(),
                    ),
                  );
                },
                child: const Text('navigation rail page'),
              ),
              ElevatedButton(
                onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('AlertDialog Title'),
                    content: const Text('AlertDialog description'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'OK'),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                ),
                child: const Text('AlertDialog'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
