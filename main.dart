import 'package:flutter/material.dart';
import 'menu.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      title: 'School Menu',
      theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(
            primary: Colors.black,
            secondary: Colors.grey,
          ),
          scaffoldBackgroundColor: Colors.blueGrey.shade50),
      home: const HomePage(title: 'School Menu'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

Widget buildDailyMenu(List items) {
  return Scaffold(
    body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.0)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Text(
                    items[index].toString(),
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Times',
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(85.0),
                    child: Image(image: AssetImage(items[index].image)),
                  ),
                  const SizedBox(
                    height: 14.0,
                  ),
                ],
              ),
            ),
          );
        }),
  );
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return buildDailyMenu(data[index].items);
                    },
                  ),
                );
              },
              child: buildRecipeCard(data[index]),
            );
          },
        ),
      ),
    );
  }

  Widget buildRecipeCard(Menu menu) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              menu.day.str(),
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                fontFamily: 'Palatino',
              ),
            ),
            Text(
              'Featured: ' + menu.getFeat().toString(),
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic,
                fontFamily: 'Times',
                height: 2,
              ),
            ),
            const SizedBox(
              height: 6.0,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(80.0),
              child: Image(image: AssetImage(menu.getFeat().image)),
            ),
            const SizedBox(
              height: 14.0,
            ),
          ],
        ),
      ),
    );
  }
}
