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

import '../../data/repository.dart';
import '../app_colors.dart';
import 'widgets/saved_website_card.dart';

/// Saved Urls Tab
class SavedUrlsPage extends StatefulWidget {
  const SavedUrlsPage({Key? key, required this.repository}) : super(key: key);

  final Repository repository;

  @override
  _SavedUrlsPageState createState() => _SavedUrlsPageState();
}

class _SavedUrlsPageState extends State<SavedUrlsPage> {
  late List<String> savedUrls;
  bool isLoading = true;

  @override
  void initState() {
    fetchSavedUrls();
    super.initState();
  }

  Future<void> fetchSavedUrls() async {
    try {
      final fetchedUrls = await widget.repository.getSavedUrls();
      if (mounted) {
        setState(() {
          savedUrls = fetchedUrls;
          isLoading = false;
        });
      }
    } on Exception catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error while fetching the saved urls!'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      appBar: AppBar(
        title: const Text('URL Gems'),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : savedUrls.isEmpty
              ? const Center(
                  child: Text("You haven't saved any urls yet!"),
                )
              : ListView.builder(
                  itemCount: savedUrls.length,
                  itemBuilder: (context, index) {
                    return SavedWebsiteCard(url: savedUrls[index]);
                  }),
    );
  }
}
