import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habeato/Provider/homeProvider.dart';
import 'package:provider/provider.dart';

import 'ProductScreen.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List items = [
    'assets/Curry_Rice.png',
    'assets/Curry_Roti_Rice.png',
    'assets/Dal_Rice.png',
    'assets/Dal_Roti.png',
    'assets/Sabji_Dal_Rice.png',
    'assets/Sabji_Dal_Roti.png',
    'assets/Sabji_Dal_Roti_Rice.png',
    'assets/Sabji_Roti.png'
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.black54)),
              onPressed: () {},
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
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => ProductScreen(
                          image: items[selectedIndex],
                        )));
              },
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
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                Container(
                  height: size.height * 0.24,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: Text(
                          'How does your Dinner look like?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Text(
                        '(excluding salad, curd and sides)',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Select any 1 or more plates',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                Consumer<HomeProvider>(
                  builder: (context, instance, v) => Container(
                    padding: EdgeInsets.all(10),
                    height: size.height * 0.639,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40))),
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 15,
                            childAspectRatio: 0.8),
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () => selectedIndex = instance
                                  .selectedProduct(index, selectedIndex),
                              child: Container(
                                  child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                    selectedIndex == index
                                        ? Container(
                                            width: size.width * 0.5,
                                            height: size.height * .25,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors
                                                          .deepOrange.shade300,
                                                      blurRadius: 10,
                                                      offset: Offset(0, 0),
                                                      spreadRadius: 0.8),
                                                  BoxShadow(
                                                      color: Colors.deepOrange
                                                          .withOpacity(0.8),
                                                      blurRadius: 6,
                                                      offset: Offset(0, 0),
                                                      spreadRadius: 0.5),
                                                  BoxShadow(
                                                      color: Colors.deepOrange
                                                          .withOpacity(0.5),
                                                      blurRadius: 2,
                                                      offset: Offset(2, 4),
                                                      spreadRadius: 0.2)
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(200)))
                                        : Container(
                                            width: size.width * 0.43,
                                            height: size.height * .232,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color:
                                                          Colors.grey.shade300,
                                                      blurRadius: 8,
                                                      offset: Offset(6, 10),
                                                      spreadRadius: 1.3),
                                                  BoxShadow(
                                                      color:
                                                          Colors.grey.shade500,
                                                      blurRadius: 6,
                                                      offset: Offset(6, 6),
                                                      spreadRadius: 0.8),
                                                  BoxShadow(
                                                      color: Colors.black45
                                                          .withOpacity(0.5),
                                                      blurRadius: 2,
                                                      offset: Offset(1, 4),
                                                      spreadRadius: 0.6)
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        200))),
                                    Hero(
                                        tag: items[index],
                                        child: Image.asset(items[index]))
                                  ])));
                        }),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
