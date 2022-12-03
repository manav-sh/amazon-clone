import 'package:flutter/material.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF10A8AD),
        title: const Text('Product Info'),
      ),
      body: Column(children: [
        Container(
          //Deliver to manav container
          color: const Color.fromARGB(255, 67, 222, 228),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          child: Row(
            children: const [
              Icon(Icons.pin_drop),
              SizedBox(
                width: 5,
              ),
              Text('Deliver to Manav - Ahmedabad, Gujarat')
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Image.network(
            'https://img.giznext.com/assets/model/2/11245/apple-iphone-13-86392669469042bb60d485f764c68d.jpg',
            height: 400,
            width: 400,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text('\$1000.00'),
        ),
      ]),
    );
  }
}
