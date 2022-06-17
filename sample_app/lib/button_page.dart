import 'package:flutter/material.dart';

class ButtonPage extends StatelessWidget {
  const ButtonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('button page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {},
                child: const Text('ElevatedButton'),
              ),
              OutlinedButton(
                  onPressed: () {}, child: const Text('OutlinedButton')),
              Row(
                children: <Widget>[
                  FloatingActionButton(
                      onPressed: () {}, child: const Icon(Icons.access_alarm)),
                  const Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Text('FloatingActionButton')),
                ],
              ),
              TextButton(onPressed: () {}, child: const Text('TextButton')),
            ],
          ),
        ),
      ),
    );
  }
}
