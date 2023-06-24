import 'package:online_shop/utils/export.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
      builder: (context, value, child) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.black),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BottomNavWidget(
                    onTap: () {
                      value.pageIndex = 0;
                    },
                    icon: value.pageIndex == 0
                        ? MaterialCommunityIcons.home
                        : MaterialCommunityIcons.home_outline,
                  ),
                  BottomNavWidget(
                      onTap: () {
                        value.pageIndex = 1;
                      },
                      icon: value.pageIndex == 1
                          ? Ionicons.search
                          : Ionicons.search_outline),
                  BottomNavWidget(
                    onTap: () {
                      value.pageIndex = 2;
                    },
                    icon: value.pageIndex == 2
                        ? Ionicons.heart
                        : Ionicons.heart_circle_outline,
                  ),
                  BottomNavWidget(
                    onTap: () {
                      value.pageIndex = 3;
                    },
                    icon: value.pageIndex == 3
                        ? Ionicons.cart
                        : Ionicons.cart_outline,
                  ),
                  BottomNavWidget(
                    onTap: () {
                      value.pageIndex = 4;
                    },
                    icon: value.pageIndex == 4
                        ? Ionicons.person
                        : Ionicons.person_outline,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
