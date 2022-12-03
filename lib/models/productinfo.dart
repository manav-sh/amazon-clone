class ProductDetails {
  ProductDetails(
      {required this.image,
      required this.name,
      required this.actualPrice,
      required this.discountPrice,
      required this.discount});

  String image;
  String name;
  double actualPrice, discountPrice;
  int discount;

  static List<ProductDetails> getProducts() {
    return <ProductDetails>[
      ProductDetails(
          image:
              "https://media.croma.com/image/upload/v1662703653/Croma%20Assets/Communication/Mobiles/Images/261933_eiuolg.png",
          name: "iPhone 14 Roduct Red, 256GB",
          actualPrice: 1300,
          discountPrice: 1000,
          discount: 10),
      ProductDetails(
          image: "https://m.media-amazon.com/images/I/61SUj2aKoEL._SX522_.jpg",
          name: "Apple Airpods Pro (White)",
          actualPrice: 800,
          discountPrice: 620,
          discount: 24),
      ProductDetails(
          image: "",
          name: "Apple Watch Series 7 (42mm)",
          actualPrice: 800,
          discountPrice: 600,
          discount: 20),
      ProductDetails(
          image:
              "https://d2d22nphq0yz8t.cloudfront.net/88e6cc4b-eaa1-4053-af65-563d88ba8b26/https://media.croma.com/image/upload/v1666277779/Croma%20Assets/Computers%20Peripherals/Tablets%20and%20iPads/Images/256712_0_y4ghxi.png/mxw_640,f_auto",
          name: "Macbook Air M1, 512GB (Silver)",
          actualPrice: 1400,
          discountPrice: 1180,
          discount: 20),
      ProductDetails(
          image: "",
          name: "Boat Rockerz 550 Headphones",
          actualPrice: 100,
          discountPrice: 60,
          discount: 40),
    ];
  }
}
