import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/api/model/news_response/news.dart';
import 'package:news_app/core/utils/image_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticalDetails extends StatelessWidget {
  static const String routeName = 'ArticalDetails';

  const ArticalDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var news = ModalRoute.of(context)!.settings.arguments as News;
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                  ImageUtils.getImagePathByName(imageName: 'pattern.png')))),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Artical Details"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(18)),
                child: CachedNetworkImage(
                  imageUrl: news.urlToImage ?? '',
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: Text(news.title ?? '',
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        color: Color(0xFF79828B))),
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: Text(news.publishedAt ?? '',
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF79828B))),
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: Text(news.content ?? '',
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF42505C))),
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        _launchUrl(news.url ?? '');
                      },
                      child: const Text(
                        'View Full Artical',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0XFF42505C)),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_outlined,
                      size: 25,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(newsUrl) async {
    final Uri _url = Uri.parse(newsUrl);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
