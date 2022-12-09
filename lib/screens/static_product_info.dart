import 'package:amazon_clone/utilities/loading.dart';
import 'package:flutter/material.dart';

class StaticProductInfo extends StatelessWidget {
  const StaticProductInfo({super.key});
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF10A8AD),
        title: const Text('Product Info'),
        elevation: 0,
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
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            'https://media.croma.com/image/upload/v1662703653/Croma%20Assets/Communication/Mobiles/Images/261933_eiuolg.png',
            height: MediaQuery.of(context).size.width,
            width: MediaQuery.of(context).size.width,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Loading.image(width, width);
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              'iPhone 14 (256GB) (Red)',
              style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 71, 71, 71),
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              '\$1040.0',
              style: TextStyle(
                  color: Color(0xFF2c2c2c),
                  fontSize: 22,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              children: const [
                Text(
                  '\$1300',
                  style: TextStyle(
                      decoration: TextDecoration.lineThrough, fontSize: 15),
                ),
                Text(
                  '20% off',
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: const [
                Icon(
                  Icons.star_rounded,
                  color: Color.fromARGB(255, 247, 173, 37),
                ),
                Icon(
                  Icons.star_rounded,
                  color: Color.fromARGB(255, 247, 173, 37),
                ),
                Icon(
                  Icons.star_rounded,
                  color: Color.fromARGB(255, 247, 173, 37),
                ),
                Icon(
                  Icons.star_rounded,
                  color: Color.fromARGB(255, 247, 173, 37),
                ),
                Icon(
                  Icons.star_half_rounded,
                  color: Color.fromARGB(255, 247, 173, 37),
                ),
              ],
            )
          ]),
        )
      ]),
    );
  }
}
