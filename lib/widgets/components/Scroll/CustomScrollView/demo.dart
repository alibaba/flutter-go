/*
 * @Author: 一凨 
 * @Date: 2018-12-20 13:40:58 
 * @Last Modified by: 一凨
 * @Last Modified time: 2018-12-20 14:06:31
 */
import 'package:flutter/material.dart';
import 'package:flutter_go/widgets/components/Scroll/CustomScrollView/product_list.dart';


class CustomScrollViewDemo extends StatelessWidget {
  Widget _buildItem(BuildContext context, ProductItem product) {
    return Container(
      height: 100.0,
      margin: const EdgeInsets.only(bottom: 5.0),
      padding: const EdgeInsets.only(left: 10.0),
      color: Colors.blueGrey,
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: <Widget>[
          Positioned(
              right: 40.0,
              child: Card(
                child: Center(
                  child: Text(
                    product.name,
                    style: Theme.of(context).textTheme.title,
                    textAlign: TextAlign.center,
                  ),
                ),
              )),
          ClipRRect(
            child: SizedBox(
              width: 70.0,
              height: 70.0,
              child: Image.asset(
                product.asset,
                fit: BoxFit.cover,
              ),
            ),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.0,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            actions: <Widget>[
              // _buildAction(),
            ],
            title: Text('CustomScrollView'),
            backgroundColor: Theme.of(context).primaryColor,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset('assets/images/food01.jpeg', fit: BoxFit.cover),
            ),
            pinned: true,//固定导航
          ),
          SliverFixedExtentList(
            delegate: SliverChildListDelegate(products.map((product) {
              return _buildItem(context, product);
            }).toList()),
            itemExtent: 120.0,
          )
        ],
      ),
    );
  }
}
