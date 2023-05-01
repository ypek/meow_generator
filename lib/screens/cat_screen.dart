import 'package:flutter/material.dart';
import 'package:meow_generator2/networking/api_client.dart';
import 'package:meow_generator2/model/cat.dart';

class CatScreen extends StatefulWidget {
  const CatScreen({Key? key}) : super(key: key);

  @override
  _CatScreenState createState() => _CatScreenState();
}

class _CatScreenState extends State<CatScreen> {
  late Future<Cat> _catModel;

  @override
  void initState() {
    super.initState();
    _getCatImage();
  }

  Future<void> _getCatImage() async {
    setState(() {
      _catModel = ApiClient().getRandomCat();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cat Screen'),
      ),
      body: Center(
        child: FutureBuilder<Cat>(
          future: _catModel,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Image.network(snapshot.data!.url, fit: BoxFit.contain);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getCatImage,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
