import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchController = TextEditingController();

  late String value;

  @override
  void initState() {
    value = "";
    super.initState();
  }

  Widget categoryItem(String image, String title) {
    // Component for horizontal listview category
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.network(
          image,
          height: 55,
          width: 45,
          fit: BoxFit.cover,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return const SizedBox(
                height: 55,
                width: 45,
                child: SizedBox(
                    height: 30,
                    width: 30,
                    child: Center(child: CircularProgressIndicator())));
          },
        ),
        Text(title),
      ]),
    );
  }

  Widget shoppingItem(String image, String title, String offerPrice,
      String discount, String actualPrice) {
    return GestureDetector(
      onTap: () => context.go('/info'),
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.network(
                image,
                height: 180,
                width: 180,
                scale: 1.5,
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                title,
                style: const TextStyle(
                    fontSize: 15,
                    color: Color(0xff2c2c2c),
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                '\$ $offerPrice',
                style: const TextStyle(
                    color: Color(0xFF2c2c2c),
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 3,
              ),
              Row(
                children: [
                  Text(
                    '\$ $actualPrice',
                    style:
                        const TextStyle(decoration: TextDecoration.lineThrough),
                  ),
                  Text(
                    '  $discount% off',
                    style: const TextStyle(
                        color: Colors.green, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return Scaffold(
      appBar: appBar(),
      body: Container(
        // alignment: Alignment.center,
        color: const Color(0xFFEfEfEf),
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                //Deliver to manav container
                color: const Color.fromARGB(255, 67, 222, 228),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
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
                //Categories horizontal listview container
                height: 100,
                alignment: Alignment.centerLeft,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    GestureDetector(
                      onTap: () => context.go('/info'),
                      child: categoryItem(
                          'https://www.pngitem.com/pimgs/m/136-1369939_transparent-blue-aesthetic-png-blue-aesthetic-clothes-transparent.png',
                          'Clothes'),
                    ),
                    categoryItem(
                        'https://www.pngall.com/wp-content/uploads/2/White-Sneakers-PNG-Clipart.png',
                        'Shoes'),
                    categoryItem(
                        'https://www.pngall.com/wp-content/uploads/12/Makeup-PNG-Photos.png',
                        'Make-up'),
                    categoryItem(
                        'https://www.kindpng.com/picc/m/368-3688261_recliner-png-free-download-leather-massage-armchair-transparent.png',
                        'Sofa'),
                    categoryItem(
                        'https://www.pngitem.com/pimgs/m/231-2313835_red-beats-studio-3-wireless-red-hd-png.png',
                        'Electronics'),
                  ],
                ),
              ),
              Container(
                //Our products title
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(
                    bottom: 5, left: 10, right: 10, top: 20),
                child: const Text(
                  'Our products',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.start,
                ),
              ),
              Expanded(
                child: GridView.count(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  childAspectRatio: 9 / 15.5,
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 15,
                  shrinkWrap: true,
                  children: List.generate(
                      10,
                      (index) => shoppingItem(
                            'https://img.giznext.com/assets/model/2/11245/apple-iphone-13-86392669469042bb60d485f764c68d.jpg',
                            'iPhone 13 Green, 256 GB',
                            '1000',
                            '30',
                            '1300',
                          )),
                ),
              )
            ]),
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  AppBar appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: const Color(0xFF10A8AD),
      title: Row(
        mainAxisSize: MainAxisSize.max,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
                alignment: Alignment.centerLeft,
                height: 45,
                decoration: BoxDecoration(
                  border:
                      Border.all(width: 0.6, color: const Color(0xff4e4e4e)),
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.only(
                    top: 10, left: 12, right: 12, bottom: 2),
                child: TextField(
                  onChanged: (text) {
                    setState(() {
                      value = searchController.text;
                    });
                  },
                  // focusNode: ,
                  controller: searchController,
                  autocorrect: true,
                  decoration: const InputDecoration(
                    hintText: 'Search products...',
                    border: InputBorder.none,
                  ),
                )),
          ),
          const SizedBox(
            width: 10,
          ),
          const Icon(Icons.mic_outlined),
        ],
      ),
    );
  }
}
