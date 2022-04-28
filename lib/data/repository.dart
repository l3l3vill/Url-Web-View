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

import 'data_sources/local_data_source.dart';
import 'data_sources/remote_data_source.dart';

class Repository {
  const Repository(this._localDataSource, this._remoteDataSource);
  final LocalDataSource _localDataSource;
  final RemoteDataSource _remoteDataSource;

  Future<void> saveUrl(String url) => _localDataSource.saveUrl(url);

  /// Fetch all saved urls
  Future<List<String>> getSavedUrls() => _localDataSource.fetchSavedUrls();

  /// Fetch random URL
  Future<String> getRandomUrl({required String? exclude}) async {
    String url;
    bool isAlreadySaved;
    bool isExcluded;
    do {
      url = await _remoteDataSource.getRandomUrl();
      isAlreadySaved = await _localDataSource.isUrlSaved(url);
      isExcluded = exclude != null && url == exclude;
    } while (isAlreadySaved || isExcluded);
    return url;
  }

  /// Fetch Help HTML page
  Future<String> fetchHelpHtmlPage() => _localDataSource.fetchHelpHtmlPage();
}
