import 'package:online_shop/utils/export.dart';

class ProductByCategory extends StatefulWidget {
  const ProductByCategory({super.key, required this.tabIndex});

  final int tabIndex;

  @override
  State<ProductByCategory> createState() => _ProductByCategoryState();
}

class _ProductByCategoryState extends State<ProductByCategory>
    with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);

  @override
  void initState() {
    super.initState();
    _tabController.animateTo(widget.tabIndex, curve: Curves.easeIn);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<String> brand = [
    "assets/images/adidas.png",
    "assets/images/gucci.png",
    "assets/images/jordan.png",
    "assets/images/nike.png",
  ];

  @override
  Widget build(BuildContext context) {
    var productNotifier = Provider.of<ProductNotifier>(context);
    productNotifier.getMale();
    productNotifier.getFemale();
    productNotifier.getKids();
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(6, 12, 16, 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            AntDesign.close,
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            filter();
                          },
                          child: const Icon(
                            FontAwesome.sliders,
                            color: Colors.white,
                          ),
                        ),
                      ],
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
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.175,
                left: 16,
                right: 12,
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    LatestShoes(male: productNotifier.male),
                    LatestShoes(male: productNotifier.female),
                    LatestShoes(male: productNotifier.kids),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> filter() {
    double _value = 100;
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.white54,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.84,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            )),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 5,
              width: 40,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.black38,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: Column(
                children: [
                  Gap(20.h),
                  Text(
                    "Filter",
                    style: appStyle(40, Colors.black, FontWeight.bold),
                  ),
                  Gap(20.h),
                  Text(
                    "Gender",
                    style: appStyle(20, Colors.black, FontWeight.bold),
                  ),
                  Gap(20.h),
                  const Row(
                    children: [
                      CategoryButton(
                        label: "Men",
                        buttonClr: Colors.black,
                      ),
                      CategoryButton(
                        label: "Women",
                        buttonClr: Colors.grey,
                      ),
                      CategoryButton(
                        label: "Kids",
                        buttonClr: Colors.grey,
                      ),
                    ],
                  ),
                  Gap(20.h),
                  Text(
                    "Category",
                    style: appStyle(20, Colors.black, FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [
                      CategoryButton(
                        label: "Shoes",
                        buttonClr: Colors.black,
                      ),
                      CategoryButton(
                        label: "Apparrels",
                        buttonClr: Colors.grey,
                      ),
                      CategoryButton(
                        label: "Accessories",
                        buttonClr: Colors.grey,
                      ),
                    ],
                  ),
                  Gap(20.h),
                  Text(
                    "Price",
                    style: appStyle(20, Colors.black, FontWeight.bold),
                  ),
                  // Slider(
                  //     value: _value,
                  //     activeColor: Colors.black,
                  //     inactiveColor: Colors.grey,
                  //     thumbColor: Colors.black,
                  //     max: 500,
                  //     divisions: 50,
                  //     label: _value.toString(),
                  //     secondaryTrackValue: 200,
                  //     onChanged: (double value) {
                  //       setState(() {
                  //         _value = value;
                  //       });
                  //     }),
                  SliderWidget(
                    value: _value,
                    onChanged: (double value) {
                      setState(() {
                        _value = value;
                      });
                    },
                  ),
                  Text(
                    "Brand",
                    style: appStyle(20, Colors.black, FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: ListView.builder(
                          itemCount: brand.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius:
                                        const BorderRadius.all(Radius.circular(12))),
                                child: Image.asset(
                                  brand[index],
                                  height: 60,
                                  width: 80,
                                  color: Colors.black,
                                ),
                              ),
                            );
                          }),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SliderWidget extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;

  const SliderWidget({super.key, 
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: value,
      activeColor: Colors.black,
      inactiveColor: Colors.grey,
      thumbColor: Colors.black,
      max: 500,
      divisions: 50,
      label: value.toString(),
      onChanged: onChanged,
    );
  }
}
