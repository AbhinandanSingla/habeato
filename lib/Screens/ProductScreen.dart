import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habeato/Provider/homeProvider.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key, this.image}) : super(key: key);
  final image;

  @override
  Widget build(BuildContext context) {
    bool _salad = false;
    bool _soup = false;
    HomeProvider _homeProvider = Provider.of(context, listen: false);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.black54)),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_back_ios_outlined),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Back',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.black54)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Next',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.arrow_forward_ios_rounded),
                ],
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          width: size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                Colors.pinkAccent.shade200,
                Colors.yellowAccent.shade200
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: size.height * 0.1,
                margin: EdgeInsets.only(top: 40, left: 30, right: 30),
                child: Text(
                  "Select the side's you prefer with Dinner",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
                ),
              ),
              Container(
                width: size.width,
                height: size.height * 0.7,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(40),
                      child: Stack(alignment: Alignment.center, children: [
                        Container(
                            width: size.width * 0.42,
                            height: size.width * 0.42,
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade300,
                                  blurRadius: 10,
                                  offset: Offset(0, 0),
                                  spreadRadius: 1.2),
                              BoxShadow(
                                  color: Colors.grey.shade500,
                                  blurRadius: 8,
                                  offset: Offset(0, 10),
                                  spreadRadius: 1),
                              BoxShadow(
                                  color: Colors.black45.withOpacity(0.5),
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                  spreadRadius: 0.3)
                            ], borderRadius: BorderRadius.circular(200))),
                        Hero(
                          tag: image,
                          child: Image.asset(
                            image,
                            width: size.width,
                            height: size.height * 0.32,
                          ),
                        )
                      ]),
                    ),
                    Container(
                      height: size.height * 0.25,
                      width: size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade300,
                                spreadRadius: 10,
                                offset: Offset(0, -2),
                                blurRadius: 10)
                          ],
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40))),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              'Sides',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w800),
                            ),
                          ),
                          Stack(
                            children: [
                              Consumer<HomeProvider>(
                                builder: (context, instance, v) => Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    AnimatedContainer(
                                        duration: Duration(seconds: 1),
                                        transform: _salad
                                            ? (Matrix4.translationValues(
                                                size.width * .01 - 10,
                                                -(size.height * 0.25),
                                                0)
                                              ..scale(0.9))
                                            : Matrix4.translationValues(0, 0, 0)
                                          ..scale(0.9),
                                        child: Image.asset(
                                          'assets/Salad.png',
                                          scale: 1.2,
                                        )),
                                    Column(
                                      children: [
                                        AnimatedContainer(
                                          duration: Duration(seconds: 1),
                                          transform: _soup
                                              ? (Matrix4.translationValues(
                                                  size.width * 0.1,
                                                  -(size.height * 0.45),
                                                  0)
                                                ..scale(0.9))
                                              : Matrix4.translationValues(
                                                  0, 0, 0)
                                            ..scale(0.9),
                                          child: Image.asset(
                                            'assets/Soup.png',
                                            scale: 1.2,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Consumer<HomeProvider>(
                                builder: (context, instance, V) => Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () => {
                                        _salad =
                                            _homeProvider.selectSalad(_salad)
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                            decoration: _salad
                                                ? BoxDecoration(
                                                    boxShadow: [
                                                        BoxShadow(
                                                            color: Colors.yellow
                                                                .withOpacity(
                                                                    0.5),
                                                            blurRadius: 4,
                                                            offset:
                                                                Offset(0, 0),
                                                            spreadRadius: 0.3),
                                                        BoxShadow(
                                                            color: Colors
                                                                .deepOrangeAccent
                                                                .withOpacity(
                                                                    0.8),
                                                            blurRadius: 4,
                                                            offset:
                                                                Offset(0, 0),
                                                            spreadRadius: 0.3),
                                                      ],
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                100)))
                                                : BoxDecoration(),
                                            child: Image.asset(
                                              'assets/Salad.png',
                                              scale: 1.2,
                                            ),
                                          ),
                                          Text(
                                            'Any Salad',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w800),
                                          )
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => {
                                        _soup = _homeProvider.selectSalad(_soup)
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                            decoration: _soup
                                                ? BoxDecoration(
                                                    boxShadow: [
                                                        BoxShadow(
                                                            color: Colors.yellow
                                                                .withOpacity(
                                                                    0.5),
                                                            blurRadius: 4,
                                                            offset:
                                                                Offset(0, 0),
                                                            spreadRadius: 0.3),
                                                        BoxShadow(
                                                            color: Colors
                                                                .deepOrangeAccent
                                                                .withOpacity(
                                                                    0.8),
                                                            blurRadius: 4,
                                                            offset:
                                                                Offset(0, 0),
                                                            spreadRadius: 0.3),
                                                      ],
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                100)))
                                                : BoxDecoration(),
                                            child: Image.asset(
                                              'assets/Soup.png',
                                              scale: 1.2,
                                            ),
                                          ),
                                          Text(
                                            'Any Soup',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w800),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
