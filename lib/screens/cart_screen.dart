import 'package:online_shop/utils/export.dart';

class CartScreen extends StatefulWidget {
  CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    cartProvider.getCart();

    return Scaffold(
      backgroundColor: Color(0xFFE2E2E2),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(40),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(AntDesign.close, color: Colors.black),
                ),
                Text(
                  "My Cart",
                  style: appStyle(36, Colors.black, FontWeight.bold),
                ),
                const Gap(20),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.65,
                  child: ListView.builder(
                    itemCount: cartProvider.cart.length,
                    itemBuilder: (BuildContext context, int index) {
                      final data = cartProvider.cart[index];
                      // print(data);
                      return Padding(
                        padding: EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.11,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade500,
                                    spreadRadius: 5,
                                    blurRadius: 0.3,
                                    offset: Offset(0, 1)),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(12),
                                          child: CachedNetworkImage(
                                            imageUrl: data['imageUrl'],
                                            width: 70,
                                            height: 70,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Positioned(
                                      bottom: -2,
                                      child: GestureDetector(
                                        onTap: () {
                                          cartProvider.deleteCart(data['key']);
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MainScreen()),
                                          );
                                        },
                                        child: Container(
                                          width: 40,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(12),
                                            ),
                                          ),
                                          child: const Icon(AntDesign.delete,
                                              size: 20, color: Colors.white),
                                        ),
                                      ),
                                    ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(top: 12, left: 20),
                                      child: Column(
                                        // mainAxisAlignment:
                                        //     MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data['name'],
                                            style: appStyle(
                                              16,
                                              Colors.black,
                                              FontWeight.bold,
                                            ),
                                          ),
                                          const Gap(5),
                                          Text(
                                            data['category'],
                                            style: appStyle(
                                              14,
                                              Colors.grey,
                                              FontWeight.bold,
                                            ),
                                          ),
                                          // const Gap(5),
                                          Flexible(
                                            child: Row(
                                              children: [
                                                Text(
                                                  data['price'],
                                                  style: appStyle(
                                                    18,
                                                    Colors.black,
                                                    FontWeight.bold,
                                                  ),
                                                ),
                                                const Gap(20),
                                                Text(
                                                  "Size",
                                                  style: appStyle(
                                                    18,
                                                    Colors.grey,
                                                    FontWeight.w600,
                                                  ),
                                                ),
                                                const Gap(15),
                                                Text(
                                                  "${data['sizes']}",
                                                  style: appStyle(
                                                    18,
                                                    Colors.grey,
                                                    FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(16),
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                //cartProvider.increment
                                              },
                                              child: Icon(AntDesign.minussquare,
                                                  size: 20, color: Colors.grey),
                                            ),
                                            Text(
                                              data['qty'].toString(),
                                              style: appStyle(12, Colors.black,
                                                  FontWeight.w600),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                //cartProvider.increment
                                              },
                                              child: Icon(AntDesign.plussquare,
                                                  size: 20,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: CheckoutButton(label: "Proceed to Checkout"),
            ),
          ],
        ),
      ),
    );
  }

  void doNothing(BuildContext context) {}
}
