import 'package:flutter/material.dart';

/// Small circular "add" button, e.g. used on product cards.
///
/// AddButton(
///   onTap: () => print('added'),
/// )
class AddButton extends StatelessWidget {
  final VoidCallback? onTap;
  final double size;

  const AddButton({
    super.key,
    this.onTap,
    this.size = 36,
  });

  @override
  Widget build(BuildContext context) {
  return Material(
    color: const Color(0xff00B36F),
    borderRadius: BorderRadius.circular(17),
    child: InkWell(
      borderRadius: BorderRadius.circular(17),
      onTap: onTap,
      
      child: SizedBox(
        height: 45.66,
        width: 45.66,
        child: Icon(
          Icons.add,
          color: Color(0xffFFFFFF),
          size: 25,
        ),
      ),
    ),
  );
}
}