import 'package:online_shop/utils/export.dart';

class NewShoes extends StatelessWidget {
  final String imageUrl;
  const NewShoes({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            spreadRadius: 1,
            blurRadius: 0.8,
            offset: Offset(0, 1),
          ),
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      width: MediaQuery.of(context).size.width * 0.28,
      child: CachedNetworkImage(imageUrl: imageUrl),
    );
  }
}
