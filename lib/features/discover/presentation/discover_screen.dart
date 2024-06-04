import 'package:flutter/material.dart';

import 'package:shoesly/crore/utils/size_utils.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 33.v,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.h),
                  child: Column(children: [
                    _buildProductGrid(),
                    SizedBox(
                      height: 34.v,
                    ),
                    // _buildProductList(),
                  ]),
                )
              ],
            ),
          )),
    ));
  }

  Widget _buildProductGrid() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 221.v,
            crossAxisCount: 2,
            mainAxisSpacing: 15.h,
            crossAxisSpacing: 15.h),
        physics: BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Text('Hello');
        });
  }
}
