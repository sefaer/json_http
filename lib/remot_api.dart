import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'models/Gonderi.dart';

class RemoteApiKullanimi extends StatefulWidget {
  @override
  _RemoteApiKullanimiState createState() => _RemoteApiKullanimiState();
}

class _RemoteApiKullanimiState extends State<RemoteApiKullanimi> {
  Future<List<Gonderi>> _gonderiGetir() async {
    var response =
        await http.get("https://jsonplaceholder.typicode.com/posts/");
    if (response.statusCode == 200) {
      //return Gonderi.fromJson(json.decode(response.body));
      return (jsonDecode(response.body) as List)
          .map((tekGonderiMapi) => Gonderi.fromJson(tekGonderiMapi))
          .toList();
    } else {
      throw Exception("Baglanamadık ${response.statusCode}");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /*  _gonderiGetir().then((okunanGonderi){
      gonderi=okunanGonderi;
      debugPrint("gelen değer : "+gonderi.title);
    },
    ); */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RemoteApi Kullanimi"),
      ),
      body: FutureBuilder(
          future: _gonderiGetir(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Gonderi>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data[index].title),
                      subtitle: Text(snapshot.data[index].body),
                      leading: CircleAvatar(
                        child: Text(snapshot.data[index].id.toString()),
                      ),
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
