import 'package:online_shop/utils/export.dart';

class StaggerTile extends StatefulWidget {
  final String imageUrl;
  final String name;
  final String price;

  const StaggerTile(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.price});

  @override
  State<StaggerTile> createState() => _StaggerTileState();
}

class _StaggerTileState extends State<StaggerTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CachedNetworkImage(
                imageUrl: widget.imageUrl,
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: Container(
                padding:  EdgeInsets.only(top: 12.h),
                height: 70.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: appstyleWithHt(20, Colors.black, FontWeight.w700, 1),
                    ),
                    Text(
                      widget.price,
                      style: appstyleWithHt(20, Colors.black, FontWeight.w500, 1),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
