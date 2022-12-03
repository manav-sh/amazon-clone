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
          image: "",
          name: "iPhone 14 Roduct Red, 256GB",
          actualPrice: 1300,
          discountPrice: 1000,
          discount: 10),
      ProductDetails(
          image: "",
          name: "Apple Airpods Pro (White)",
          actualPrice: 2000,
          discountPrice: 1000,
          discount: 50),
      ProductDetails(
          image: "",
          name: "Apple Watch Series 7 (42mm)",
          actualPrice: 800,
          discountPrice: 600,
          discount: 20),
      ProductDetails(
          image: "",
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
