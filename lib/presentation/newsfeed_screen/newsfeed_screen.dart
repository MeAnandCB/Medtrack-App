import 'package:college/utils/color_constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsFeed extends StatefulWidget {
  @override
  _NewsFeedState createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  final String apiKey = "6b4a93a8207a4e7a9663178b54e54ab6";
  final String healthApiUrl =
      "https://newsapi.org/v2/top-headlines?country=us&category=health";
  final String generalApiUrl =
      "https://newsapi.org/v2/top-headlines?country=us";

  List<dynamic> healthArticles = [];
  List<dynamic> generalArticles = [];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final healthResponse =
          await http.get(Uri.parse("$healthApiUrl&apiKey=$apiKey"));
      final generalResponse =
          await http.get(Uri.parse("$generalApiUrl&apiKey=$apiKey"));

      if (healthResponse.statusCode == 200 &&
          generalResponse.statusCode == 200) {
        final healthData = json.decode(healthResponse.body);
        final generalData = json.decode(generalResponse.body);

        setState(() {
          healthArticles = healthData["articles"];
          generalArticles = generalData["articles"];
        });
      } else {
        throw Exception("Failed to load news");
      }
    } catch (e) {
      print(e.toString());
    }

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorCOnstant.myBlueColor,
        title: Text(
          "Health News Feed",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: isLoading == true
          ? Center(
              child: CircularProgressIndicator(
              color: ColorCOnstant.myBlueColor,
            ))
          : ListView.builder(
              itemCount: healthArticles.length + generalArticles.length,
              itemBuilder: (context, index) {
                if (index < healthArticles.length) {
                  final article = healthArticles[index];
                  return InkWell(
                    onTap: () {
                      Share.share("9074834662");
                    },
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 250,
                              width: double.infinity,
                              child: CachedNetworkImage(
                                imageUrl: article["urlToImage"] ?? "",
                                fit: BoxFit.cover,
                                placeholder: (context, url) => Center(
                                  child: CircularProgressIndicator(
                                    color: ColorCOnstant.myLiteBlue,
                                  ),
                                ),
                                errorWidget: (context, url, error) => Container(
                                  height: 250,
                                  width: double.infinity,
                                  child: Image.asset(
                                    "assets/images/doctors_department/2.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              article["title"] ?? "",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  article["publishedAt"] ?? "",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              article["description"] ?? "",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        )),
                  );
                } else {
                  final article =
                      generalArticles[index - healthArticles.length];
                  return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 250,
                            width: double.infinity,
                            child: CachedNetworkImage(
                              imageUrl: article["urlToImage"] ?? "",
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Center(
                                child: CircularProgressIndicator(
                                  color: ColorCOnstant.myLiteBlue,
                                ),
                              ),
                              errorWidget: (context, url, error) => Container(
                                height: 250,
                                width: double.infinity,
                                child: Image.asset(
                                  "assets/images/doctors_department/2.jpg",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            article["title"] ?? "",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            article["publishedAt"] ?? "",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            article["description"] ?? "",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ));
                }
              },
            ),
    );
  }
}

//  ListTile(
//             leading: CachedNetworkImage(
//               imageUrl: article["urlToImage"] ?? "",
//               placeholder: (context, url) => CircularProgressIndicator(
//                 color: ColorCOnstant.myRosedart,
//               ),
//               errorWidget: (context, url, error) => Icon(Icons.error),
//             ),
//             title: Text(article["title"] ?? ""),
//             subtitle: Text(article["publishedAt"] ?? ""),
//             onTap: () {
//               // Add navigation to the full article or details screen here
//             },
//           )