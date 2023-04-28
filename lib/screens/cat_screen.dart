import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:meow_generator2/networking/api_client.dart';
import 'package:meow_generator2/model/cat.dart';

class CatScreen extends StatefulWidget {
  @override
  _CatScreenState createState() => _CatScreenState();
}

class _CatScreenState extends State<CatScreen> {
  late Future<Cat> _futureCat;

  @override
  void initState() {
    super.initState();
    _futureCat = _fetchRandomCat();
  }

  Future<Cat> _fetchRandomCat() async {
    final client = ApiClient(Dio());
    final cats = await client.getRandomCat();
    return cats[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Meow Generator',
          style: TextStyle(fontFamily: 'Quicksand'),
        ),
      ),
      body: FutureBuilder<Cat>(
        future: _futureCat,
        builder: (BuildContext context, AsyncSnapshot<Cat> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
           
