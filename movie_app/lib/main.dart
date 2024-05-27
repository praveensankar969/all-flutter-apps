import 'package:flutter/material.dart';
import 'package:movie_app/provider/move_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => MovieProvider(context),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DashBoard(title: 'Movies'),
    );
  }
}

class DashBoard extends StatefulWidget {
  const DashBoard({super.key, required this.title});

  final String title;

  @override
  State<DashBoard> createState() => _HomePageState();
}

class _HomePageState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MovieProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "All Movies",
        ),
      ),
      body: ListView.builder(
        itemCount: provider.movies.length,
        itemBuilder: (context, index) {
          var movie = provider.movies[index];
          return Card(
            child: ExpansionTile(
              tilePadding: const EdgeInsets.all(2),
              title: Text(movie.title),
              subtitle: Text(movie.director),
              leading: CircleAvatar(
                child: Text(
                  movie.title[0],
                ),
              ),
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.fromLTRB(75, 0, 0, 10),
                  child: Column(
                    children: [
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'Released: ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: movie.released),
                          TextSpan(
                            text: '\nPlot: ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: movie.plot),
                        ], style: DefaultTextStyle.of(context).style),
                      ),
                      TextButton(
                          onPressed: () => {}, child: const Text('Read More'))
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
