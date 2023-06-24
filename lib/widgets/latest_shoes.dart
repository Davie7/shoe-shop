import 'package:online_shop/utils/export.dart';

class LatestShoes extends StatelessWidget {
  const LatestShoes({
    Key? key,
    required Future<List<Sneakers>> male,
  })  : _male = male,
        super(key: key);

  final Future<List<Sneakers>> _male;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Sneakers>>(
      future: _male,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error${snapshot.error}');
        } else {
          final male = snapshot.data;
          return StaggeredGridView.countBuilder(
            padding: EdgeInsets.zero,
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 16,
            scrollDirection: Axis.vertical,
            staggeredTileBuilder: (index) => StaggeredTile.extent(
                (index % 2 == 0) ? 1 : 1,
                (index % 4 == 1 || index % 4 == 3)
                    ? MediaQuery.of(context).size.height * 0.35
                    : MediaQuery.of(context).size.height * 0.3),
            itemCount: male!.length,
            itemBuilder: (BuildContext context, int index) {
              final shoe = snapshot.data![index];
              return StaggerTile(
                imageUrl: shoe.imageUrl[1],
                name: shoe.name,
                price: '\$${shoe.price}',
              );
            },
          );
        }
      },
    );
  }
}
