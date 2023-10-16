import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {

  final dynamic image;
  final dynamic title;
  final dynamic price;
  final dynamic description;
  final dynamic category;

  const HomeScreen({super.key, this.image, this.title, this.price, this.description, this.category});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List taskList = [];

  final formKey = GlobalKey<FormState>();

  @override

  void initState() {
    super.initState();
    debugPrint("name  --   ${widget.name}");
    name.text = widget.name ?? "";
    pname.text = widget.pname ?? "";
    prs.text = widget.pname ?? "";
    mrp.text = widget.pname ?? "";
    quantity.text = widget.pname ?? "";

    getApi();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GridView.builder(
          padding: const EdgeInsets.all(30),
          scrollDirection: Axis.vertical,
          itemCount: taskList.length,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 2,
              mainAxisExtent: 300),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              // color: Colors.grey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    height: 200,
                    width: 300,
                    child: ClipRect(
                      child: Image.network(
                        fit: BoxFit.fill,
                        "${taskList[index]["image"]}",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "${taskList[index]["title"]}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text("${taskList[index]["price"]}"),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void getApi() async {
    http.Response response = await http.get(
      Uri.parse(
        'https://fakestoreapi.com/products',
      ),
    );
    debugPrint('status-code ${response.statusCode}');
    debugPrint('body ${response.body}');
    debugPrint('body ${response.body.runtimeType}');

    if (response.statusCode == 200) {
      String jsonsDataString = response.body
          .toString(); // toString of Response's body is assigned to jsonDataString
      taskList = jsonDecode(jsonsDataString);
      debugPrint(taskList.toString());
      debugPrint("######22#$taskList");

      setState(() {});
      Fluttertoast.showToast(msg: "successful");
    } else {
      Fluttertoast.showToast(msg: "not successful");
      debugPrint('message ${json.decode(response.body)['message']} ');
    }
  }
}
