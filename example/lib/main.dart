import 'package:accessible_ds/accessible_ds.dart';
import 'package:example/components/product.dart';
import 'package:example/pages/cart.dart';
import 'package:example/pages/pdp.dart';
import 'package:example/utils/return_products.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      showSemanticsDebugger: false,
      title: 'Accessible Design System: Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Accessible Design System: Demo'),
    ),
  );
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
              textColor: DsColors.primary,
              backgroundColor: DsColors.onPrimary,
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
            const SizedBox(
              height: 16,
            ),
            DsTextButton(
              text: 'Go to Cart Page',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartPage(
                      products: [
                        returnTenis(),
                        returnCamiseta()..variations.first.selectedVariation = 'M',
                      ],
                    ),
                  ),
                );
              },
              alternativeText: 'alternative text to the text button',
              textColor: DsColors.primary,
              backgroundColor: DsColors.onPrimary,
            ),
            const SizedBox(
              height: 16,
            ),
            DsTextButton(
              text: 'Go to PDP Page',
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailPage(
                      product: returnTenis(),
                    ),
                  ),
                );
              },
              alternativeText: 'alternative text to the text button',
              textColor: DsColors.primary,
              backgroundColor: DsColors.onPrimary,
            ),
          ],
        ),
      ),
    );
  }
}
