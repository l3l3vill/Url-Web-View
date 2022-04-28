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

import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

/// Local data source
class LocalDataSource {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _savedUrlsFile async {
    final path = await _localPath;
    return File('$path/saved_urls.txt');
  }

  /// Fetch the locally saved urls
  Future<List<String>> fetchSavedUrls() async {
    final file = await _savedUrlsFile;
    if (await file.exists()) {
      final fileContents = file.readAsStringSync();
      final list = json.decode(fileContents) as List;
      return List<String>.from(list);
    }
    return [];
  }

  /// Store Url in a local file
  Future<void> saveUrl(String url) async {
    final urls = await fetchSavedUrls();
    if (urls.contains(url)) {
      return;
    }
    urls.add(url);
    final file = await _savedUrlsFile;
    file.writeAsStringSync(json.encode(urls));
  }

  /// Check if URL has already been saved locally
  Future<bool> isUrlSaved(String url) async {
    final urls = await fetchSavedUrls();
    return urls.contains(url);
  }

  /// Fetch Help HTML Page
  Future<String> fetchHelpHtmlPage() async {
    final htmlPage = await rootBundle.loadStructuredData<String>(
      'assets/help_page.html',
      (str) async => str,
    );
    final encodedHtmlInBase64 = base64Encode(
      const Utf8Encoder().convert(htmlPage),
    );
    return encodedHtmlInBase64;
  }
}
