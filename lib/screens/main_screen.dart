import 'package:carousel_slider/carousel_slider.dart';
import 'package:desktop_tutorial_2/screens/dishes.dart';
import 'package:desktop_tutorial_2/util/categories.dart';
import 'package:desktop_tutorial_2/util/foods.dart';
import 'package:desktop_tutorial_2/widgets/grid_product.dart';
import 'package:desktop_tutorial_2/widgets/home_category.dart';
import 'package:desktop_tutorial_2/widgets/slider_item.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with AutomaticKeepAliveClientMixin {
  int _current = 0;

  dynamic onChange(index, onPageChangeReason) {
    setState(() {
      _current = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
            child: ListView(children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Dishes",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  FlatButton(
                    child: Text(
                      "View More",
                      style: TextStyle(
//                      fontSize: 22,
//                      fontWeight: FontWeight.w800,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return DishesScreen();
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),

              SizedBox(height: 10.0),

              //Slider Here
              CarouselSlider.builder(
                itemCount: foods.length == null ? 0 : foods.length,
                itemBuilder: (BuildContext c, int index, _) {
                  return SliderItem(
                    img: foods[index].img,
                    isFav: false,
                    name: foods[index].name,
                    rating: 5.0,
                    raters: 23,
                  );
                },
                options: CarouselOptions(
                    height: MediaQuery.of(context).size.height / 2.4,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 1.0,
                    enableInfiniteScroll: true,
                    onPageChanged: onChange),
              ),
              SizedBox(height: 20.0),

              Container(
                height: 65.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: categories == null ? 0 : categories.length,
                  itemBuilder: (BuildContext context, int index) {
                    Map cat = categories[index];
                    return HomeCategory(
                      icon: cat['icon'],
                      title: cat['name'],
                      items: cat['items'].toString(),
                      isHome: true,
                    );
                  },
                ),
              ),

              SizedBox(height: 20.0),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Popular Items",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  FlatButton(
                    child: Text(
                      "View More",
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: 10.0),

              GridView.builder(
                shrinkWrap: true,
                primary: false,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 250,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 1.25),
                ),
                itemCount: foods == null ? 0 : foods.length,
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

              SizedBox(height: 30),
            ]))
        //trailing comma makes auto-formatting nicer for build methods.
        );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
