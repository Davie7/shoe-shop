import 'package:online_shop/utils/export.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final TabController _tabController = TabController(
      length: 3,
      vsync:
          this // 'this' shows that the home state will provide the object to the controller
          // (i.e uses the current state as the TickerProvider for animation control )
      );
 
  @override
  Widget build(BuildContext context) {
    var productNotifier = Provider.of<ProductNotifier>(context);
    productNotifier.getMale();
    productNotifier.getFemale();
    productNotifier.getKids();

    var favoritesNotifier = Provider.of<FavoritesNotifier>(context);
    favoritesNotifier.getFavorites();

    return Scaffold(
      backgroundColor: const Color(0xFFE2E2E2),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 45, 0, 0),
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/top_image.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Container(
                padding: const EdgeInsets.only(
                  left: 8,
                  bottom: 15,
                ),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Athletic Shoes',
                      style: appstyleWithHt(
                        42,
                        Colors.white,
                        FontWeight.bold,
                        1.5,
                      ),
                    ),
                    Text(
                      'Collection',
                      style: appstyleWithHt(
                        42,
                        Colors.white,
                        FontWeight.bold,
                        1.2,
                      ),
                    ),
                    TabBar(
                      padding: EdgeInsets.zero,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: Colors.transparent,
                      controller: _tabController,
                      isScrollable: true,
                      labelColor: Colors.white,
                      labelStyle: appStyle(24, Colors.white, FontWeight.bold),
                      unselectedLabelColor: Colors.grey.withOpacity(0.3),
                      tabs: const [
                        Tab(
                          text: 'Men\'s shoes',
                        ),
                        Tab(
                          text: 'Women\'s shoes',
                        ),
                        Tab(
                          text: 'Kid\'s shoes',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.265),
              child: Container(
                padding: const EdgeInsets.only(left: 12),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    HomeWidget(
                      male: productNotifier.male,
                      tabIndex: 0,
                    ),
                    HomeWidget(
                      male: productNotifier.female,
                      tabIndex: 1,
                    ),
                    HomeWidget(
                      male: productNotifier.kids,
                      tabIndex: 2,
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
