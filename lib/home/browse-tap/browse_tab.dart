import 'package:flutter/material.dart';
import 'package:movies_app/api/api_manager.dart';
import 'package:movies_app/app_colors.dart';
import 'package:movies_app/model/category.dart';


class BrowseTap extends StatefulWidget {

  @override
  State<BrowseTap> createState() => CategoryState();

}

class CategoryState extends State<BrowseTap> {
  bool isList = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,);
  }
}

class DefaultAppBar {
}
