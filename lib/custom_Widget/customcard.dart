import 'package:flutter/material.dart';
import 'package:my_app/Models/card_model.dart';

class MyCards extends StatelessWidget {
  const MyCards({super.key, required this.carData, required this.imagepath});
  final CardModel carData;
  final String imagepath;

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
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite_outline_rounded))
                  ],
                ),
                const SizedBox(height: 200),
                // ignore: avoid_unnecessary_containers
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration:const BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    height: 30,
                    width: 350,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${carData.cardName}, ",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 10),
                            ),
                            Text(
                              carData.cardPlace,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 10),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              carData.cardPlace,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 10),
                            ),
                            Text(
                              carData.cardCountry,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 10),
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
