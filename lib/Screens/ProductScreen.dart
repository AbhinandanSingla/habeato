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
        child: SingleChildScrollView(
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
              children: [
                Container(
                  height: size.height * 0.2,
                  padding: EdgeInsets.only(top: 40, left: 30, right: 30),
                  child: Text(
                    "Select the side's you prefer with Dinner",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
                  ),
                ),
                Container(
                  width: size.width,
                  height: size.height * 0.75,
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
                              width: size.width * 0.46,
                              height: size.width * 0.46,
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 10,
                                    offset: Offset(8, 10),
                                    spreadRadius: 1.2),
                                BoxShadow(
                                    color: Colors.grey.shade500,
                                    blurRadius: 8,
                                    offset: Offset(6, 8),
                                    spreadRadius: 1),
                                BoxShadow(
                                    color: Colors.black45.withOpacity(0.5),
                                    blurRadius: 2,
                                    offset: Offset(2, 4),
                                    spreadRadius: 0.8)
                              ], borderRadius: BorderRadius.circular(200))),
                          Image.asset(
                            image,
                            width: size.width,
                            height: size.height * 0.32,
                          )
                        ]),
                      ),
                      Container(
                        height: size.height * 0.28,
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
                                    children: [
                                      Column(
                                        children: [
                                          AnimatedContainer(
                                              duration: Duration(seconds: 1),
                                              transform: _salad
                                                  ? (Matrix4.translationValues(
                                                      size.width * .01 - 10,
                                                      -(size.height * 0.26),
                                                      0)
                                                    ..scale(0.9))
                                                  : Matrix4.translationValues(
                                                      0, 0, 0)
                                                ..scale(0.9),
                                              child: Image.asset(
                                                  'assets/Salad.png')),
                                          Text(
                                            'Any Salad',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w800),
                                          )
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          AnimatedContainer(
                                            duration: Duration(seconds: 1),
                                            transform: _soup
                                                ? (Matrix4.translationValues(
                                                    size.width * 0.1,
                                                    -(size.height * 0.53),
                                                    0)
                                                  ..scale(0.9))
                                                : Matrix4.translationValues(
                                                    0, 0, 0)
                                              ..scale(0.9),
                                            child:
                                                Image.asset('assets/Soup.png'),
                                          ),
                                          Text(
                                            'Any Soup',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w800),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    GestureDetector(
                                      onTap: () => {
                                        _salad =
                                            _homeProvider.selectSalad(_salad)
                                      },
                                      child: Column(
                                        children: [
                                          Image.asset('assets/Salad.png'),
                                          Text(
                                            'Any Salad',
                                            style: TextStyle(
                                                fontSize: 20,
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
                                          Image.asset('assets/Soup.png'),
                                          Text(
                                            'Any Soup',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w800),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
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
      ),
    );
  }
}
