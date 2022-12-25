import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/text_style.dart';
import 'package:movie_app/core/theme/theme_colors.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        decoration: BoxDecoration(
          color: greyColor.withOpacity(0.12),
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          textAlignVertical: TextAlignVertical.center,
          style: subtitleStyle.copyWith(color:whiteColor.withOpacity(0.60)),
          decoration: InputDecoration(
            hintText: 'Search',
            border: InputBorder.none,
            isDense: true,
            hintStyle: subtitleStyle.copyWith(color: whiteColor.withOpacity(0.60)),
            prefixIcon: Icon(Icons.search, color:whiteColor.withOpacity(0.60), size: 20.0)
          ),
        ),
      ),
    );
  }
}
