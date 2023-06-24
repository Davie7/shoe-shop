import 'package:online_shop/utils/export.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('cart_box');
  await Hive.openBox('fav_box');
  // method that initializes the app and runs top level widgets
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => MainScreenNotifier(),
    ),
    ChangeNotifierProvider(
      create: (context) => ProductNotifier(),
    ),
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => FavoritesNotifier(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: MainScreen(),
          );
        });
  }
}
