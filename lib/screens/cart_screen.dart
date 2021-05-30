import 'package:flutter/material.dart';
import 'package:desktop_tutorial_2/util/foods.dart';
import 'package:desktop_tutorial_2/widgets/cart_item.dart';


class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> with AutomaticKeepAliveClientMixin<CartScreen >{
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0,0,10.0,0),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: foods == null ? 0 :foods.length,
          itemExtent: 250,
          itemBuilder: (BuildContext context, int index) {
            return CartItem(
              img: foods[index].img,
              isFav: false,
              name: foods[index].name,
              rating: 5.0,
              raters: 23,
            );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        tooltip: "Checkout",
        onPressed: (){
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (BuildContext context){
          //        return Checkout();
          //     },
          //   ),
          // );
        },
        child: Icon(
          Icons.arrow_forward,
        ),
        heroTag: Object(),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
