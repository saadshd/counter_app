import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Counter App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<int> counters = [0];

  void incrementCounter(int index) {
    setState(() {
      counters[index]++;
      const snackBar = SnackBar(
        content: Text('Counter Incremented!'),
        behavior: SnackBarBehavior.floating,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  void decrementCounter(int index) {
    setState(() {
      counters[index]--;
      const snackBar = SnackBar(
        content: Text('Counter decremented!'),
        behavior: SnackBarBehavior.floating,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  void refreshCounter(int index) {
    setState(() {
      counters[index] = 0;
    });
  }

  void addCounter() {
    setState(() {
      counters.add(0);
    });
  }

  void removeCounter(int index) {
    setState(() {
      counters.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
      ),
      body: ListView.builder(
        itemCount: counters.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('Counter ${index + 1}: ${counters[index]}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.add,
                    color: Colors.green,
                  ),
                  onPressed: () {
                    incrementCounter(index);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.remove,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    decrementCounter(index);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: () {
                    refreshCounter(index);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    removeCounter(index);
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addCounter,
        child: const Icon(Icons.add),
      ),
    );
  }
}



