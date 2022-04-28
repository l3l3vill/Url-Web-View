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
import '../../../helpers/string_formatters.dart';

import '../../app_colors.dart';

///Footer widget in the discover tab
class FooterWidget extends StatelessWidget {
  final Widget navigationControls;
  final String? url;
  final void Function() routeToHelpPage;

  const FooterWidget({
    Key? key,
    required this.navigationControls,
    required this.url,
    required this.routeToHelpPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.maxFinite,
      color: AppColors.yellowColor,
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          Flexible(child: navigationControls),
          const SizedBox(width: 10),
          buildUrl(),
          buildPopupMenuButton(),
        ],
      ),
    );
  }

  /// Display popup menu
  PopupMenuButton<String> buildPopupMenuButton() {
    return PopupMenuButton<String>(
      onSelected: (_) => routeToHelpPage(),
      itemBuilder: (context) {
        return {'Help'}.map((choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Text(choice),
          );
        }).toList();
      },
    );
  }

  /// Display the url text
  Expanded buildUrl() {
    return Expanded(
      child: Text(
        StringFormatters.getDomainNameFromUrl(url),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
