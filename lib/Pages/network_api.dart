import 'package:flutter/material.dart';
import 'package:my_app/Models/post_model.dart';

class NetworkApi extends StatelessWidget {
  final Future<List<Post>> posts;
  const NetworkApi({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: posts,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 3,
                      child: ListTile(
                        title: Text(
                          snapshot.data![index].title,
                          style:const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(snapshot.data![index].userId.toString()),
                      ),
                    );
                  });
            }
            return ListView.builder(
              itemCount: 40,
              itemBuilder: (context, index) {
                // ignore: avoid_unnecessary_containers
                return Container(
                  child:const  Column(
                    children: [Text("Title"), Text("UseId")],
                  ),
                );
              },
            );
          }),
    );
  }
}
