import 'package:accessible_ds/accessible_ds.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Accessible Design System: Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Accessible Design System: Demo'),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DsTextButton(
              text: 'TextButton',
              onPressed: () {},
              alternativeText: 'alternative text to the text button',
              textColor: Colors.green,
              backgroundColor: Colors.grey,
            ),
            const SizedBox(
              height: 8,
            ),
            DsIconButton(
              icon: Icons.add,
              alternativeText: 'alternative text to the icon button',
              onPressed: () {},
            ),
            const SizedBox(
              height: 8,
            ),
            const DsImage(
              imageUrl:
                  'https://images.unsplash.com/photo-1561948955-570b270e7c36?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
              altText: 'alternative text to the image: cat',
              // height: 200,
              width: 100,
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: DsSpacing.big),
              child: DsInputTextField(
                controller: TextEditingController(),
                label: 'label',
                alternativeText: 'alternative text to the input text field',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
