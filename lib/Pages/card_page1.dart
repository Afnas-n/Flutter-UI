import 'package:flutter/material.dart';

class CardPage1 extends StatefulWidget {
  const CardPage1({super.key});

  @override
  State<CardPage1> createState() => _CardPage1State();
}

class _CardPage1State extends State<CardPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 50),
            Center(
              child: Card(
                elevation: 20,
                borderOnForeground: true,
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/image/fuji.jpg'),
                          fit: BoxFit.cover),
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(12, 12))),
                  height: 400,
                  width: 300,
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.black38,
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  size: 15,
                                ),
                                color: Colors.white60,
                              ),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: CircleAvatar(
                                radius: 16,
                                backgroundColor: Colors.black38,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.bookmark_outline_rounded,
                                    size: 16,
                                  ),
                                  color: Colors.white,
                                ),
                              ))
                        ],
                      ),
                      const SizedBox(height: 250),
                      // ignore: avoid_unnecessary_containers
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 300,
                          height: 60,
                          decoration: const BoxDecoration(
                              color: Colors.black54,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: const Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(width: 10),
                                  Text("Mount Fuji",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(width: 70),
                                  Text(
                                    "Price",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 8),
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: Colors.white60,
                                    size: 20,
                                  ),
                                  Text(
                                    "Tokyo",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 13),
                                  ),
                                  SizedBox(width: 118),
                                  Text(
                                    "\$",
                                    style: TextStyle(color: Colors.white60),
                                  ),
                                  Text(
                                    "300",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Row(
              children: [
                SizedBox(width: 28),
                Text(
                  "Overview",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 40),
                Text(
                  "Details",
                  style: TextStyle(color: Colors.black54),
                )
              ],
            ),
            const SizedBox(height: 25),
            const Row(
              children: <Widget>[
                SizedBox(width: 28),
                Icon(Icons.access_time_filled_sharp, size: 16),
                SizedBox(width: 12),
                Text("8 hours", style: TextStyle(color: Colors.black54)),
                SizedBox(width: 40),
                Icon(Icons.cloud, size: 16),
                SizedBox(width: 12),
                Text("16 °C "),
                SizedBox(width: 70),
                Icon(Icons.star_outlined, size: 16),
                SizedBox(
                  width: 12,
                ),
                Text("4.2", style: TextStyle(color: Colors.black54))
              ],
            ),
            const SizedBox(height: 30),
            // ignore: sized_box_for_whitespace
            Container(
              width: 350,
              child: const Text(
                'This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description.  This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. ',
                style: TextStyle(color: Colors.black54),
                softWrap: true,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: const Size.fromWidth(23),
              backgroundColor: Colors.black,
            ),
            onPressed: () {},
            child: const Row(
              children: [
                SizedBox(width: 100),
                Text(
                  'Book Now',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(width: 10),
                Icon(
                  Icons.send,
                  color: Colors.white,
                )
              ],
            )),
      ),
    );
  }
}
