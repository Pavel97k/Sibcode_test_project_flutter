import 'package:flutter/material.dart';
import 'package:test_project_subicode/data/models/accaunt.dart';
import 'package:test_project_subicode/data/models/news.dart';
import 'package:test_project_subicode/domain/repositories/news_rep.dart';
import 'package:test_project_subicode/presentation/screens/info_news.dart';
import 'package:test_project_subicode/presentation/screens/profile.dart';
import 'package:test_project_subicode/presentation/screens/widjets/news_card.dart';

class NewsList extends StatefulWidget {
  final Account accaunt;
  const NewsList({super.key, required this.accaunt});

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  late Future<List<News>> newsFuture;
  bool isLoading = true;
  String? errorMessage;
  NewsRep rep = NewsRep();
  @override
  void initState() {
    super.initState();
    newsFuture = rep.getAllNews();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.account_circle_sharp),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Profile(
                  account: widget.accaunt,
                ),
              ));
            },
          ),
          centerTitle: true,
          title: const Text('Новости'),
        ),
        body: FutureBuilder<List<News>>(
          future: newsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No news available.'));
            }

            final newsList = snapshot.data!;
            return ListView.builder(
              itemCount: newsList.length,
              itemBuilder: (context, index) {
                final newsItem = newsList[index];
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => InfoNews(
                        data: newsItem,
                      ),
                    ));
                  },
                  child: NewsCard(
                    data: newsItem,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
