import 'package:online_shop/utils/export.dart';

class CategoryButton extends StatelessWidget {
  final void Function()? onPressed;
  final Color buttonClr;
  final String label;

  const CategoryButton(
      {super.key,
      this.onPressed,
      required this.buttonClr,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        height: 45.h,
        width: 90.w,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: buttonClr,
            style: BorderStyle.solid,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(9),
          ),
        ),
        child: Center(
          child: ReusableText(
            text: label,
            style: appStyle(15, buttonClr, FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
