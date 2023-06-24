import 'package:online_shop/utils/export.dart';
class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  List<Widget> pageList = [
    HomeScreen(),
    SearchScreen(),
    Favorites(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
      builder: (context, value, child) {
        return Scaffold(
          backgroundColor: const Color(0xFFE2E2E2),
          body: pageList[value.pageIndex],
          bottomNavigationBar: const BottomNavBar(),
        );
      },
    );
  }
}
