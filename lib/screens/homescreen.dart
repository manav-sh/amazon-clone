import 'package:amazon_clone/models/productinfo.dart';
import 'package:amazon_clone/utilities/loading.dart';
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
  final List<ProductDetails> items = ProductDetails.getProducts();
  late String value;

  @override
  void initState() {
    value = "";
    super.initState();
  }

  Widget categoryItem(String image, String title) {
    // Component for horizontal listview category
    return InkWell(
      onTap: () {
        context.push('/info');
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            foregroundDecoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0, 0.75, 0.94],
              colors: [
                Color.fromARGB(0, 247, 247, 247),
                Color.fromARGB(0, 247, 247, 247),
                // Color.fromARGB(150, 247, 247, 247),
                Color.fromARGB(255, 247, 247, 247)
              ],
            )),
            child: Image.network(
              image,
              height: 55,
              width: 55,
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
          ),
          Text(title),
        ]),
      ),
    );
  }
  // context.go('/sInfo');
  // context.go('/pInfo/${item.id}');
  // context.go('/pInfo/anyvalue');

  Widget shoppingItem(ProductDetails item) {
    return InkWell(
      onTap: () {
        context.goNamed('info', params: {'id': item.id}, extra: item);
      },
      child: Container(
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 5, top: 8),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              item.image == ""
                  ? Loading.image(180, 180)
                  : Image.network(
                      item.image,
                      height: 180,
                      width: 180,
                      scale: 1.5,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return Loading.image(180, 180);
                      },
                    ),
              const SizedBox(
                height: 6,
              ),
              Text(
                item.name,
                style: const TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 71, 71, 71),
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                '\$ ${item.discountPrice}',
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
                    '\$${item.actualPrice}',
                    style:
                        const TextStyle(decoration: TextDecoration.lineThrough),
                  ),
                  Text(
                    '  ${item.discount}% off',
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
        color: const Color.fromARGB(255, 247, 247, 247),
        child: CustomScrollView(
            // mainAxisSize: MainAxisSize.max,
            // mainAxisAlignment: MainAxisAlignment.start,
            slivers: [
              SliverToBoxAdapter(
                child: Container(
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
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 120,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: ListView(scrollDirection: Axis.horizontal, children: [
                    categoryItem(
                        'https://pngimg.com/uploads/hoodie/small/hoodie_PNG30.png',
                        'Clothes'),
                    categoryItem(
                        'https://www.pngall.com/wp-content/uploads/2/White-Sneakers-PNG-Clipart.png',
                        'Shoes'),
                    categoryItem(
                        'https://www.pngall.com/wp-content/uploads/12/Makeup-PNG-Photos.png',
                        'Make-up'),
                    categoryItem(
                        'https://www.pngall.com/wp-content/uploads/2017/03/Recliner-PNG.png',
                        'Sofa'),
                    categoryItem(
                        'https://pngimg.com/uploads/headphones/headphones_PNG7645.png',
                        'Electronics'),
                  ]),
                ),
              ),
              SliverToBoxAdapter(
                child: ElevatedButton(
                    onPressed: () {
                      context.go('/settings');
                    },
                    child: const Text('Go to Settings')),
              ),
              SliverToBoxAdapter(
                child: Container(
                  //Our products title
                  padding:
                      const EdgeInsets.only(bottom: 5, left: 10, right: 10),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Our products',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              SliverPadding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                sliver: SliverGrid(
                    delegate: SliverChildListDelegate(
                      List.generate(
                          items.length, (index) => shoppingItem(items[index])),
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 9 / 15.5,
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10)),
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
