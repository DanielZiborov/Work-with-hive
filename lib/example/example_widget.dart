import 'package:flutter/material.dart';
import 'package:work_with_hive/example/example_widget_model.dart';

class ExampleWidget extends StatefulWidget {
  const ExampleWidget({super.key});

  @override
  State<ExampleWidget> createState() => _ExampleWidgetState();
}

class _ExampleWidgetState extends State<ExampleWidget> {
  final model = ExampleWidgetModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: model.setUp,
                child: const Text("Tune"),
              ),
              ElevatedButton(
                onPressed: model.doSome,
                child: const Text("Add"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
