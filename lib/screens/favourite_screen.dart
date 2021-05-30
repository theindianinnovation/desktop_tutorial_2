import 'package:desktop_tutorial_2/util/foods.dart';
import 'package:desktop_tutorial_2/widgets/grid_product.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatefulWidget {
  FavouriteScreen({Key key}) : super(key: key);

  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
            child: ListView(children: <Widget>[
              Text(
                "My Favourite Items",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w800,
                ),
                maxLines: 2,
              ),
              Divider(),
              GridView.builder(
                shrinkWrap: true,
                primary: false,
                physics: NeverScrollableScrollPhysics(),
                // make the widget never scrollable
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //creates grid with fixed number of tiles in crossaxis
                  crossAxisCount: 2,
                  mainAxisExtent: 250,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 1.25),
                ),
                itemCount: foods.length==null?0:foods.length,
                itemBuilder: (BuildContext context, int index) {
                  return GridProduct(
                    img: foods[index].img,
                    isFav: false,
                    name: foods[index].name,
                    rating: 5.0,
                    raters: 23,
                  );
                },
              ),
              SizedBox(height: 20.0),
            ])));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
