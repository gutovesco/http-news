import 'package:flutter/material.dart';
import 'package:http_news/models/newsInfo.dart';
import 'package:http_news/services/api_manager.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Future<NewsInfo> _newsInfo;

  @override
  void initState() {
    _newsInfo = API_MANAGER().getNews();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: Container(
        child: FutureBuilder(
          future: _newsInfo,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(_newsInfo);
              return Expanded(
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Container(height: 100, color: Colors.red);
                  },
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.blue[200],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
