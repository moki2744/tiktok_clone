import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class PostVideoButton extends StatelessWidget {
  const PostVideoButton({
    Key? key,
    required this.selectedIndex,
  }) : super(key: key);

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          left: 20,
          child: Container(
            height: 30,
            width: 25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: const Color(0xff61d4f0),
            ),
          ),
        ),
        Positioned(
          right: 20,
          child: Container(
            height: 30,
            width: 25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        Container(
          height: 30,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: selectedIndex == 0 ? Colors.white : Colors.black,
          ),
          child: Center(
            child: FaIcon(
              FontAwesomeIcons.plus,
              size: Sizes.size16,
              color: selectedIndex == 0 ? Colors.black : Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
