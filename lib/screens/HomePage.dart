import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController search = TextEditingController();
  List<Image> images = <Image>[
    Image.asset('assets/images/1.jpeg', fit: BoxFit.fill),
    Image.asset('assets/images/2.jpeg', fit: BoxFit.fill),
    Image.asset('assets/images/3.jpeg', fit: BoxFit.fill),
    Image.asset('assets/images/4.jpeg', fit: BoxFit.fill),
    Image.asset('assets/images/5.jpeg', fit: BoxFit.fill),
    Image.asset('assets/images/6.jpeg', fit: BoxFit.fill),
  ];
  List<String> name = <String>[
    "Your Story",
    "Demo 1",
    "Demo 2",
    "Demo 3",
    "Demo 4",
    "Demo 5",
    "Demo 6"
  ];
  double j = 20;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text("My Project"),
              centerTitle: true,
            ),
            body: CustomScrollView(slivers: <Widget>[
              SliverList(
                  delegate: SliverChildListDelegate([
                Container(
                  color: Colors.grey[300],
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.12,
                  child: ListView.builder(
                      itemBuilder: _storyList,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 6),
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    viewportFraction: 1,
                    enlargeCenterPage: false,
                    scrollDirection: Axis.horizontal,
                    autoPlay: true,
                  ),
                  items: images.map((imageUrl) {
                    return Builder(builder: (BuildContext context) {
                      return Column(
                        children: <Widget>[
                          Flexible(
                            child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: imageUrl),
                          ),
                        ],
                      );
                    });
                  }).toList(),
                ),
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: _posts,
                    shrinkWrap: true,
                    itemCount: 2),
              ])),
            ])));
  }

  Widget _storyList(BuildContext context, int index) {
    return Column(children: <Widget>[
      SizedBox(height: 8),
      Row(children: <Widget>[
        SizedBox(width: 15),
        Container(
            child: index == 0
                ? Stack(children: <Widget>[
                    Card(
                      color: Colors.grey[300],
                      elevation: 0,
                      child: Container(
                          padding: EdgeInsets.all(2.5),
                          decoration: BoxDecoration(
                              color: Colors.blue, shape: BoxShape.circle),
                          child: CircleAvatar(
                            radius: 25,
                            child: ClipOval(
                              child: Image.asset('assets/images/default.png',
                                  fit: BoxFit.fill),
                            ),
                          )),
                    ),
                    Positioned(
                        bottom: 5,
                        right: 3,
                        child: CircleAvatar(
                            radius: 10,
                            child: ClipOval(
                              child: Icon(Icons.add,
                                  color: Colors.white, size: 20),
                            ))),
                  ])
                : Container(
                    padding: EdgeInsets.all(2.5),
                    decoration: BoxDecoration(
                        color: Colors.blue, shape: BoxShape.circle),
                    child: CircleAvatar(
                      radius: 25,
                      child: ClipOval(
                        child: Image.asset('assets/images/default.png',
                            fit: BoxFit.fill),
                      ),
                    ))),
        SizedBox(width: 15),
      ]),
      Text(name[index])
    ]);
  }

  Widget _posts(BuildContext context, int index) {
    return Container(
        color: Colors.grey[100],
        child: Column(children: <Widget>[
          SizedBox(height: 10),
          Row(children: <Widget>[
            SizedBox(width: 10),
            CircleAvatar(
              radius: 23,
              child: ClipOval(
                child:
                    Image.asset('assets/images/default.png', fit: BoxFit.fill),
              ),
            ),
            SizedBox(width: 10),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Demo 1",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "GTB-Nagar, Jalandhar, Punjab",
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                  Text(
                    "8 minutes ago",
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ])
          ]),
          SizedBox(height: 10),
          Image.asset('assets/images/background.jpeg', fit: BoxFit.fill),
          SizedBox(height: 10),
          Row(children: <Widget>[
            SizedBox(width: 10),
            Icon(Icons.favorite_border, color: Colors.black, size: 30),
            SizedBox(width: 10),
            ImageIcon(AssetImage('assets/images/comment.png'),
                color: Colors.black, size: 30),
            SizedBox(width: 13),
            Icon(Icons.send, color: Colors.black, size: 30),
          ]),
          SizedBox(height: 10),
          Row(children: <Widget>[
            SizedBox(width: 10),
            Text("Demo 1", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(width: 10),
            Container(
                width: MediaQuery.of(context).size.width * 0.79,
                child: Text(
                    "Here in my area some people do not have a home and no money to last for fast food so I humblly request to all people please help my area",
                    textAlign: TextAlign.justify,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3))
          ]),
          index == 1
              ? Container(
                  margin: EdgeInsets.only(left: 125),
                  child: Row(children: <Widget>[
                    Icon(Icons.keyboard_arrow_down,
                        color: Colors.black, size: 30),
                    Text("Show More")
                  ]))
              : Container(),
          Container(height: 10, color: Colors.white),
        ]));
  }
}
