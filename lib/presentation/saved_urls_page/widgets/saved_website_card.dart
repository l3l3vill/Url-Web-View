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

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../helpers/string_formatters.dart';

/// Saved Website Card
class SavedWebsiteCard extends StatelessWidget {
  const SavedWebsiteCard({
    Key? key,
    required this.url,
  }) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Card(
      key: Key(url),
      margin: const EdgeInsets.all(25),
      child: Column(
        children: [
          const SizedBox(height: 10),
          buildWebsiteTitle(context),
          const SizedBox(height: 10),
          buildWebView(),
        ],
      ),
    );
  }

  /// Display the webview
  ClipRRect buildWebView() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomRight: Radius.circular(4),
        bottomLeft: Radius.circular(4),
      ),
      child: SizedBox(
        height: 400,
        child: WebView(
          initialUrl: url,
          javascriptMode: JavascriptMode.unrestricted,
          //TODO: Add Gesture Recognizers
        ),
      ),
    );
  }

  /// display website's title
  Padding buildWebsiteTitle(BuildContext context) {
    return Padding(
      child: Text(
        StringFormatters.getDomainNameFromUrl(url),
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.headline6,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 5),
    );
  }
}
