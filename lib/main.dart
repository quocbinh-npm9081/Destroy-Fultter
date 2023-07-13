import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: SafeArea(
        child: Scaffold(body: Center(child: MyFullWidget(false))
            // appBar: AppBar(
            //   backgroundColor: Colors.red,
            //   title: const Text('Tự học Fullter'),
            // ),
            // body: const Center(
            //   child: Text('Hello World'),
            // ),
            ),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MyWidget extends StatelessWidget {
  final bool loading;

  const MyWidget(this.loading, {super.key});

  @override
  Widget build(BuildContext context) {
    return loading ? const CircularProgressIndicator() : const Text('State');
  }
}

class MyFullWidget extends StatefulWidget {
  final bool loading;

  const MyFullWidget(this.loading);

  @override
  State<StatefulWidget> createState() {
    return MyFullWidgetBuildState();
  }
}

class MyFullWidgetBuildState extends State<MyFullWidget> {
  late bool _localLoading;

  @override
  void initState() {
    super.initState();
    // Ham khoi tao gia tri ban dau
    _localLoading = widget.loading;
  }

  @override
  Widget build(BuildContext context) {
    return _localLoading
        ? const CircularProgressIndicator()
        : TextButton(
            style: TextButton.styleFrom(
              primary: Colors.blue,
            ),
            onPressed: onCLickButton,
            child: const Text('TextButton'),
          );
  }

  void onCLickButton() {
    setState(() {
      _localLoading = true;
    });
  }
}
