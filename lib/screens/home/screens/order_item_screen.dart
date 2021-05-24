import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class OrderItemScreen extends StatelessWidget {
  final List<String> entries = <String>['A', 'B', 'C'];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 15,
                    left: 15,
                  ),
                  child: Text(
                    'Delifonsecaa - Local Legends:\nDelivering Saturdays & Sundays!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                      'Delivers to L1, L2, L3, L5, L7, L8, L15, L16, L17, L18, L19'),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                child: Card(
                  child: Column(
                    children: [
                      Container(
                        height: 250,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('./assets/images/6.jpeg'),
                              fit: BoxFit.fill),
                        ),
                      ),
                      Container(
                        height: 200,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 15),
                          child: Column(
                            children: [
                              Text(
                                'Chicken Sunday Roast (For 1) - \$12.95',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Delifonseca are here to help you enjoy the finer\ntastes of life, as firm believers that good food\nbegins with beautiful, local ingredients and\ncurating meals that lift the soul!',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.5,
                                    fontWeight: FontWeight.w300),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 30,
                                  top: 8.0,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: Text('Order'),
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.orange,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                          side: BorderSide(
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                onTap: () => showModalBottomSheet<dynamic>(
                    context: context,
                    builder: (BuildContext bc) {
                      return Wrap(children: <Widget>[
                        Container(
                          height: height * 0.3,
                          child: Container(
                            decoration: new BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Chicken Sunday Roast (For 1) - \$12.95',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    'Delifonseca are here to help you enjoy the finer\ntastes of life, as firm believers that good food\nbegins with beautiful, local ingredients and\ncurating meals that lift the soul!',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.5,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ),
                                Divider(),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        '\$12.95',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Spacer(),
                                      InkWell(
                                        child: Text('Cancel'),
                                        onTap: () => Navigator.pop(context),
                                      ),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      ElevatedButton(
                                          onPressed: () {},
                                          child: Text('Add to cart'),
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18.0),
                                                  side: BorderSide(
                                                      color: Colors.red)))),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ]);
                    }),
                focusColor: Colors.blueGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
