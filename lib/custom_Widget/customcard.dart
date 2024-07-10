import 'package:flutter/material.dart';
import 'package:my_app/Models/card_model.dart';

class MyCards extends StatelessWidget {
  const MyCards(
      {super.key,
      required this.rating1,
      required this.carData,
      required this.imagepath,
      this.width1});
  final CardModel carData;
  final String imagepath;
  final String rating1;
  final double? width1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 20,
          borderOnForeground: true,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imagepath), fit: BoxFit.cover),
                borderRadius:
                    const BorderRadius.all(Radius.elliptical(12, 12))),
            height: 350,
            width: 200,
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    const SizedBox(
                      width: 150,
                      height: 60,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.black26,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite_outline_rounded),
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 200),
                // ignore: avoid_unnecessary_containers
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.black38,
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(8, 8))),
                    height: 40,
                    width: 350,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                              "${carData.cardName}, ",
                              style: const TextStyle(
                                  color: Colors.white60,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              carData.cardPlace,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 10),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 9,
                            ),
                            const Icon(
                              Icons.location_on_outlined,
                              color: Colors.white60,
                              size: 16,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "${carData.cardPlace}, ",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 10),
                            ),
                            Text(
                              carData.cardCountry,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 10),
                            ),
                            SizedBox(
                              width: width1,
                            ),
                            const Icon(
                              Icons.star_border,
                              color: Colors.white60,
                              size: 15,
                            ),
                            Text(
                              rating1,
                              style: const TextStyle(
                                  color: Colors.white60, fontSize: 10),
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
    );
  }
}
