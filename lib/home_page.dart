import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey add = GlobalKey();
  final GlobalKey item = GlobalKey();
  final GlobalKey search = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ShowCaseWidget.of(context).startShowCase([add, item, search]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter ShowCaseView POC"),
        centerTitle: false,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Showcase(
              key: search,
              description: 'Tap to search spot ',
              overlayOpacity: 0.5,
              targetShapeBorder: const CircleBorder(),
              targetPadding: const EdgeInsets.all(8),
              child: const Icon(Icons.search),
            ),
          ),
        ],
      ),
      floatingActionButton: Showcase(
        key: add,
        description: 'Tap to add an spot',
        overlayOpacity: 0.5,
        targetShapeBorder: const CircleBorder(),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add),
        ),
      ),
      body: ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) => index == 1
            ? Showcase(
                key: item,
                description: 'Tap to see content in that spot',
                overlayOpacity: 0.5,
                child: listItem(index),
              )
            : listItem(index),
      ),
    );
  }

  listItem(int index) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.access_alarm,
          color: Colors.white,
        ),
      ),
      title: Text("Spot  $index"),
      subtitle: Text("Spot Desc $index"),
      trailing: const Text("Jan 2024"),
    );
  }
}
