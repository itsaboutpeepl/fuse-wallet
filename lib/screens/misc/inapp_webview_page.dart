import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peepl/models/community/community.dart';
import 'package:peepl/models/tokens/token.dart';
import 'package:peepl/screens/topup/dialogs/card_failed.dart';
import 'package:peepl/screens/topup/dialogs/minting_dialog.dart';
import 'package:peepl/utils/format.dart';
import 'package:peepl/utils/stripe.dart';
import 'package:peepl/utils/stripe_custom_response.dart';
import 'package:redux/redux.dart';
import 'package:flutter_segment/flutter_segment.dart';
import 'package:peepl/models/app_state.dart';
import 'package:peepl/redux/actions/cash_wallet_actions.dart';

class WebViewWidget extends StatefulWidget {
  final String url;
  final String walletAddress;

  WebViewWidget({
    this.url,
    this.walletAddress,
  });

  @override
  _WebViewWidgetState createState() => _WebViewWidgetState();
}

class _WebViewWidgetState extends State<WebViewWidget> {
  InAppWebViewController webView;

  Future<bool> _handleStripe(amount) async {
    final StripeCustomResponse response = await StripeService().payWithNewCard(
      amount: amount,
      walletAddress: widget.walletAddress,
      currency: 'GBP',
    );
    if (response.ok) {
      showDialog(
        context: context,
        builder: (context) => MintingDialog(amount, false),
        barrierDismissible: false,
      );
      return true;
    } else {
      if (!response.msg.contains('Cancelled by user')) {
        showDialog(
          context: context,
          builder: (context) => TopUpFailed(), // TopUpFailed
        );
      }
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final pageheight = MediaQuery.of(context).size.height;
    List<Color> colors = [
      Colors.red,
      Colors.green,
      Colors.pink,
      Colors.purple,
      Colors.blue,
      Colors.yellow,
      Colors.black,
      Colors.black12,
      Colors.grey,
      Colors.blueGrey,
    ];
    // Segment.screen(screenName: '/web-view-screen');
    // return StoreConnector<AppState, InAppWebViewViewModel>(
    // converter: InAppWebViewViewModel.fromStore,
    // builder: (_, InAppWebViewViewModel viewModel) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              if (webView != null) {
                webView.goBack();
              }
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: pageheight * 0.35,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 258,
                    child: CustomScrollView(
                      slivers: <Widget>[
                        SliverToBoxAdapter(
                          child: Container(
                            height: 250.0,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return Container(
                                  width: 300.0,
                                  child: Card(
                                    margin: EdgeInsets.only(
                                        top: 25, left: 15, right: 1),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 10),
                                          child: Text(
                                            'Saturdays',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(
                                            'BBQ Saturdays',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 30,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Text(
                                            'Come rain or shine, these BBQ feasts will\nplease a crowd.',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                    color: colors[index],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      top: 25,
                    ),
                    child: Text(
                      'All restaurants',
                      style: TextStyle(color: Colors.blueGrey, fontSize: 20),
                    ),
                  ),
                ],
              ),
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
                              image:
                                  AssetImage('./assets/images/spitroast.jpg'),
                              fit: BoxFit.fill),
                        ),
                      ),
                      Container(
                        height: 170,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 15),
                          child: Column(
                            children: [
                              Text(
                                'Delifonseca - Local Legends: Delivering\nSaturdays & Sundays!',
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
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                onTap: () {},
                focusColor: Colors.blueGrey,
              ),
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
                              image:
                                  AssetImage('./assets/images/spitroast.jpg'),
                              fit: BoxFit.fill),
                        ),
                      ),
                      Container(
                        height: 170,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 15),
                          child: Column(
                            children: [
                              Text(
                                'Delifonseca - Local Legends: Delivering\nSaturdays & Sundays!',
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
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                onTap: () {},
                focusColor: Colors.blueGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//webview route

//           body: InAppWebView(
//             initialUrl: widget.url,
//             onWebViewCreated: (InAppWebViewController controller) {
//               webView = controller;
//               webView.addJavaScriptHandler(
//                 handlerName: "pay",
//                 callback: (args) {
//                   Map<String, dynamic> paymentDetails = Map.from(args[0]);
//                   sendSuccessCallback(jobId) async {}

//                   sendFailureCallback() {}

//                   viewModel.sendTokenFromWebView(
//                     paymentDetails['currency'],
//                     paymentDetails['destination'],
//                     paymentDetails['amount'],
//                     paymentDetails['orderId'],
//                     sendSuccessCallback,
//                     sendFailureCallback,
//                   );
//                 },
//               );

//               webView.addJavaScriptHandler(
//                 handlerName: "topup",
//                 callback: (args) {
//                   Map<String, dynamic> data = Map.from(args[0]);
//                   num amount = num.parse(data['amount']);

//                   // TODO: Remove eventually
//                   if (amount > 250) {
//                     // TODO: Add error message for large top up
//                     return false;
//                   }
//                   return _handleStripe(amount.toString());

//                   /* if (amount > viewModel.secondaryTokenAmount) {
//                     num value = amount - viewModel.secondaryTokenAmount;
//                     return _handleStripe(value.toString());
//                   } else {
//                     return _handleStripe(amount.toString());
//                   } */
//                 },
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }

// class InAppWebViewViewModel extends Equatable {
//   final num secondaryTokenAmount;
//   final Function(
//     String currency,
//     String receiverAddress,
//     num amount,
//     dynamic orderId,
//     Function(dynamic) sendSuccessCallback,
//     VoidCallback sendFailureCallback,
//   ) sendTokenFromWebView;

//   @override
//   List<Object> get props => [
//         secondaryTokenAmount,
//       ];

//   InAppWebViewViewModel({
//     this.secondaryTokenAmount,
//     this.sendTokenFromWebView,
//   });

//   static InAppWebViewViewModel fromStore(Store<AppState> store) {
//     String communityAddress = store.state.cashWalletState.communityAddress;
//     Community community =
//         store.state.cashWalletState.communities[communityAddress] ??
//             Community.initial();
//     final Token token = store.state.cashWalletState.tokens
//             .containsKey(community?.secondaryTokenAddress?.toLowerCase())
//         ? store.state.cashWalletState
//             .tokens[community?.secondaryTokenAddress?.toLowerCase()]
//         : store.state.cashWalletState.tokens[community?.secondaryTokenAddress];
//     final num secondaryTokenAmount = num.parse(formatValue(
//           token?.amount,
//           token?.decimals,
//           withPrecision: true,
//         )) ??
//         0;
//     return InAppWebViewViewModel(
//       secondaryTokenAmount: secondaryTokenAmount,
//       sendTokenFromWebView: (
//         String currency,
//         String receiverAddress,
//         num amount,
//         dynamic orderId,
//         Function(dynamic) sendSuccessCallback,
//         VoidCallback sendFailureCallback,
//       ) {
//         store.dispatch(sendTokenFromWebViewCall(
//           currency,
//           receiverAddress,
//           amount,
//           orderId,
//           sendSuccessCallback,
//           sendFailureCallback,
//         ));
//       },
//     );
//   }
// }
