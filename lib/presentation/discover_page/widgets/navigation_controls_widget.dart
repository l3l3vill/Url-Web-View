/*
 * Copyright (c) 2021 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// Navigation Controls Bar to refresh, novigate forward and backward
/// in a web view
class NavigationControls extends StatefulWidget {
  const NavigationControls({
    Key? key,
    required this.webViewController,
    required this.isLoading,
  }) : super(key: key);

  final Future<WebViewController> webViewController;
  final bool isLoading;

  @override
  _NavigationControlsState createState() => _NavigationControlsState();
}

class _NavigationControlsState extends State<NavigationControls> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebViewController>(
      future: widget.webViewController,
      builder: (context, snapshot) {
        final webViewReady = snapshot.connectionState == ConnectionState.done;
        final controller = snapshot.data;

        if (controller == null) {
          return const SizedBox.shrink();
        }

        return Row(
          children: <Widget>[
            buildBackButton(controller, isReady: webViewReady),
            buildForwardButton(controller, isReady: webViewReady),
            widget.isLoading
                ? buildLoadingIndicator()
                : buildRefreshButton(controller, isReady: webViewReady),
          ],
        );
      },
    );
  }

  IconButton buildRefreshButton(WebViewController controller,
      {required bool isReady}) {
    return IconButton(
        icon: const Icon(Icons.replay),
        onPressed: !isReady
            ? null
            : controller.reload //TODO: Refresh page using WebViewController
        );
  }

  SizedBox buildLoadingIndicator() {
    return const SizedBox(
      height: 38,
      width: 38,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: CircularProgressIndicator(
          color: Colors.black87,
          strokeWidth: 2.5,
        ),
      ),
    );
  }

  Widget buildForwardButton(WebViewController controller,
      {required bool isReady}) {
    return FutureBuilder<bool>(
      initialData: false,
      future: controller.canGoForward(),
      builder: (context, snapshot) {
        if (isReady && snapshot.data != null && snapshot.data!) {
          return IconButton(
            icon: const Icon(Icons.arrow_forward_ios),
            onPressed: () async {
              //TODO: Route Forward using WebViewController
              await controller.goForward();
              print('NAVIGATION CONTROLLER FOWARD im being pressed');
            },
          );
        } else {
          return const IconButton(
            icon: Icon(Icons.arrow_forward_ios),
            onPressed: null,
          );
        }
      },
    );
  }

  Widget buildBackButton(WebViewController controller,
      {required bool isReady}) {
    return FutureBuilder<bool>(
      initialData: false,
      future: controller.canGoBack(),
      builder: (context, snapshot) {
        if (isReady && snapshot.data != null && snapshot.data!) {
          return IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () async {
              //TODO: Route Backward using WebViewController
              await controller.goBack();
              print('NAVIGATION CONTROLLER BACK im being pressed');
            },
          );
        } else {
          return const IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: null,
          );
        }
      },
    );
  }
}
