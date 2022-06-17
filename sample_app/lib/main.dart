import 'package:flutter/material.dart';

import 'app_bar_page.dart';
import 'button_page.dart';
import 'card_page.dart';
import 'navigation_bar_page.dart';
import 'navigation_rail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final _color = Colors.green;
  var _useMaterial3 = true;

  void _toggleMaterial() {
    setState(() {
      _useMaterial3 = !_useMaterial3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: _useMaterial3,
        colorSchemeSeed: _useMaterial3 ? _color : null,
        primarySwatch: _useMaterial3 ? null : _color,
      ),
      home: MyHomePage(
        useMaterial3: _useMaterial3,
        onTap: _toggleMaterial,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
    required bool useMaterial3,
    required this.onTap,
  }) : materialVersion = useMaterial3 ? '3' : '2';

  final String materialVersion;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material Design $materialVersion Demo'),
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
      floatingActionButton: FloatingActionButton(
        heroTag: 'main',
        onPressed: onTap,
        child: const Icon(Icons.refresh_outlined),
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
