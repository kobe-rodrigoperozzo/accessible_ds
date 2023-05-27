import 'package:example/components/product.dart';

Product returnTenis() {
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
          '36',
          '38',
          '39',
          '40',
          '41',
          '42',
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

Product returnCamiseta() {
  return Product(
    title: 'Camiseta Preta',
    id: 'C3PG',
    price: 27.90,
    discountedPrice: 27.90,
    seller: 'Loja 237',
    imageUrl: 'https://cdn.shopify.com/s/files/1/1505/8214/products/4_1_1500x.jpg?v=1594931500',
    description:
        'A Camiseta Malha Dupla traz um tecido duplo de espessura mais densa e macia. Essencial e com uma camada extra para conforto em dobro! Composta 100% de algodão egípcio, esse tecido nobre apresenta isolamento térmico e alta absorção, tornando-o confortável e naturalmente mais flexível.',
    rating: 5,
    variations: [
      Variation(
        type: 'Tamanho',
        options: [
          'P',
          'M',
          'G',
          'GG',
        ],
        selectedVariation: 'M',
      ),
    ],
  );
}
