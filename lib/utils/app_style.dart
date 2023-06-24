import 'package:online_shop/utils/export.dart';

TextStyle appStyle(double size, Color color, FontWeight fw) {
  return GoogleFonts.poppins(fontSize: size, color: color, fontWeight: fw);
}

TextStyle appstyleWithHt(double size, Color color, FontWeight fw, double ht) {
  return GoogleFonts.poppins(
      fontSize: size.sp, color: color, fontWeight: fw, height: ht);
}
