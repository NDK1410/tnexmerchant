import 'package:flutter/material.dart';
import 'package:tnexmerchant/src/helpers/MyColors.dart';
import 'package:tnexmerchant/src/helpers/ListSubCategoryWidget.dart';

class FoodScreenChooseSubCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Sub-category"),
        centerTitle: true,
        backgroundColor: MyColors.brand_dark,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.grey[200],
          ),
          Container(
            width: double.infinity,
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  ListSubCategory("Noodles"),
                  Divider(),
                  ListSubCategory("Breads"),
                  Divider(),
                  ListSubCategory("Rice set"),
                  Divider(),
                  ListSubCategory("Buffet"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
