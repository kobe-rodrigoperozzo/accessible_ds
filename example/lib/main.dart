import 'package:accessible_ds/accessible_ds.dart';
import 'package:example/components/product.dart';
import 'package:example/pages/cart.dart';
import 'package:example/pages/pdp.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showSemanticsDebugger: false,
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
                        returnProduct(),
                        returnProduct(),
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
              text: 'Go to PDP2 Page',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailPage(
                      product: returnProduct(),
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

// The DismissKeybaord widget (it's reusable)
class DismissKeyboard extends StatelessWidget {
  final Widget child;
  const DismissKeyboard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: child,
    );
  }
}

Product returnProduct() {
  return Product(
    title: 'Tênis Modelo 5',
    id: 'T5A3B3',
    price: 50.00,
    discountedPrice: 50.00,
    seller: 'Loja ABC',
    imageUrl: 'https://imgnike-a.akamaihd.net/768x768/02569651.jpg',
    description:
        'Quando seus treinos chegam ao âmago da questão, o Tênis Modelo 5 pode encontrá-lo nas profundezas, ajudá-lo a cavar fundo para encontrar aquela gota final de força e sair do outro lado em alta. Ele combina estilo com substância, flexibilidade do antepé com estabilidade de backend, perfeito para voar durante um dia de cardio ou melhorar sua agilidade. Um cabedal renovado facilita na hora de calçar com um colarinho feito para o seu tornozelo.',
    rating: 4,
    variations: [
      Variation(
        type: 'Tamanho',
        options: [
          '34',
          '35',
          '36',
          '37',
          '38',
          '39',
          '40',
          '41',
          '42',
          '43',
          '44',
        ],
      ),
      Variation(
        type: 'Cor',
        options: [
          'Vermelho',
          'Azul',
          'Verde',
        ],
      ),
    ],
  );
}
