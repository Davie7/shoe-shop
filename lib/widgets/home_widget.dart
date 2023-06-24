import 'package:online_shop/utils/export.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    Key? key,
    required Future<List<Sneakers>> male,
    required this.tabIndex,
  })  : _male = male,
        super(key: key);

  final Future<List<Sneakers>> _male;
  final int tabIndex;

  @override
  Widget build(BuildContext context) {
    var productNotifier = Provider.of<ProductNotifier>(context);
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.405,
          child: FutureBuilder<List<Sneakers>>(
            future: _male,
            // initialData: InitialData,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error${snapshot.error}');
              } else {
                final male = snapshot.data;
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: male!.length,
                  itemBuilder: (BuildContext context, int index) {
                    final shoe = snapshot.data![index];
                    return GestureDetector(
                      onTap: () {
                        productNotifier.shoeSizes = shoe.sizes;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductScreen(
                                id: shoe.id, category: shoe.category),
                          ),
                        );
                      },
                      child: ProductCard(
                        price: '\$${shoe.price}',
                        id: shoe.id,
                        category: shoe.category,
                        name: shoe.name,
                        image: shoe.imageUrl[0],
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 20, 12, 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Latest Shoes',
                    style: appStyle(24, Colors.black, FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductByCategory(
                            tabIndex: tabIndex,
                          ),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Text(
                          'Show All',
                          style: appStyle(22, Colors.black, FontWeight.w500),
                        ),
                        const Icon(
                          AntDesign.caretright,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
          child: FutureBuilder<List<Sneakers>>(
            future: _male,
            // initialData: InitialData,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              } else {
                final male = snapshot.data;
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: male!.length,
                  itemBuilder: (BuildContext context, int index) {
                    final shoe = snapshot.data![index];
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: NewShoes(imageUrl: shoe.imageUrl[1]),
                    );
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
