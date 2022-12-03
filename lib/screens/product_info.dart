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
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              'https://img.giznext.com/assets/model/2/11245/apple-iphone-13-86392669469042bb60d485f764c68d.jpg',
              height: 400,
              width: 400,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    height: 400,
                    width: 400,
                    child: Center(
                        child: Icon(
                      Icons.image,
                      color: Colors.grey[800],
                    )));
              },
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Text('\$1000.00'),
        ),
      ]),
    );
  }
}
