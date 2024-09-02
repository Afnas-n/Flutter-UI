
import 'package:flutter/material.dart';
import 'package:my_app/Models/card_model.dart';
import 'package:my_app/Pages/bottom_bar.dart';
import 'package:my_app/Pages/card_page.dart';
import 'package:my_app/Pages/card_page1.dart';
import 'package:my_app/Pages/card_page3.dart';
import 'package:my_app/custom_Widget/customcard.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

var textColour = Colors.black;

class _HomeState extends State<Home> {
  int _inDex = 0;
  static const List<Widget> _myBottombar = [
    Text(""),
    Text(""),
    Text(""),
    Text(""),
  ];
  final List<CardModel> _carDetails = [
    CardModel(cardName: "Mount Fuji", cardPlace: "Tokyo", cardCountry: "Japan"),
    CardModel(
        cardName: "Andes Mountain",
        cardPlace: "South America",
        cardCountry: "America"),
    CardModel(
        cardName: "Eiffel Tower", cardPlace: "paris", cardCountry: "France")
  ];
  void onTappe(int index) {
    setState(() {
      _inDex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _myBottombar.elementAt(_inDex),
            const SizedBox(height: 50),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: <Widget>[
                      Text(
                        textAlign: TextAlign.start,
                        "Hi, David",
                        style: TextStyle(fontSize: 28),
                      ),
                      Text(
                        "Explore the World",
                        style: TextStyle(),
                      )
                    ],
                  ),
                  CircleAvatar(
                    child: Icon(Icons.person),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                          color: Colors.black,
                        )),
                    hintText: 'Search places',
                    suffixIcon: Icon(Icons.tune)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Popular Places",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(
                    width: 160,
                  ),
                  Text(
                    "View all",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Most viewed",
                        style: TextStyle(color: Colors.grey),
                      )),
                  TextButton(
                      onPressed: () {},
                      child: const Text("Nearby",
                          style: TextStyle(color: Colors.grey))),
                  TextButton(
                      onPressed: () {},
                      child: const Text("Latest",
                          style: TextStyle(color: Colors.grey))),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    child: MyCards(
                      carData: _carDetails[0],
                      imagepath: 'assets/image/fuji.jpg',
                      width1: 50,
                      rating1: "4.8",
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CardPage1()));
                    },
                  ),
                  GestureDetector(
                    child: MyCards(
                      carData: _carDetails[1],
                      imagepath: 'assets/image/andes.jpg',
                      rating1: "4.2",
                      width1: 10,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CardPage()));
                    },
                  ),
                  GestureDetector(
                    child: MyCards(
                      carData: _carDetails[2],
                      imagepath: 'assets/image/eifel.jpg',
                      rating1: "4.9",
                      width1: 50,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CardPage3()));
                    },
                  ),
                  // Stack(children: [
                  //   Container(
                  //     height: 350,
                  //     width: 200,
                  //     decoration:const BoxDecoration(
                  //         image: DecorationImage(
                  //             image: NetworkImage(
                  //                 "https://images.pexels.com/photos/699466/pexels-photo-699466.jpeg?auto=compress&cs=tinysrgb&w=600"))),
                  //   ),
                  //   Positioned(
                  //     right: 20,
                  //     bottom: 40,
                  //     child: Container(
                  //       height: 250,
                  //       width: 100,
                  //       decoration:const BoxDecoration(
                  //           image: DecorationImage(
                  //               image: NetworkImage(
                  //                   "https://images.pexels.com/photos/699466/pexels-photo-699466.jpeg?auto=compress&cs=tinysrgb&w=600"))),
                  //     ),
                  //   ),
                  // ])
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}


//toast
//snakbar
//alert box