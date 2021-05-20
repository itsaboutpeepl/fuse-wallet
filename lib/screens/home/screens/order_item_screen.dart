import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class OrderItemScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).splashColor,
        toolbarHeight: MediaQuery.of(context).size.height / 17,
        leading: Builder(
          builder: (_) => IconButton(
            icon: Icon(
              PlatformIcons(context).back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Column(
        children: [Text('data')],
      ),
    );
  }
}
