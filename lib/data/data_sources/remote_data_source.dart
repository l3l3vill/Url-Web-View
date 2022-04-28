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

/// Mock remote data source
class RemoteDataSource {
  /// Get a random URL
  Future<String> getRandomUrl() async {
    final urls = List.of(_getAllUrls());
    urls.shuffle();
    return urls.first;
  }

  static List<String> _getAllUrls() => const [
        'http://gnoosic.com/',
        'http://tickld.com/',
        'http://patatap.com/',
        'http://coolthings.com/',
        'http://coolhunting.com/',
        'http://uncontactedtribes.org/',
        'https://notalwaysright.com/',
        'http://artofmanliness.com/',
        'http://flashbynight.com/drench/',
        'http://postsecret.com/',
        'http://riverstyx.com/',
        'https://zooniverse.org/',
        'http://noiys.com/',
        'http://vumble.com/',
        'http://scotthyoung.com/blog/',
        'http://addicted2success.com/',
        'http://clapway.com/',
        'http://truthdig.com/',
        'https://littlealchemy2.com/',
        'http://mentalfloss.com/',
        'http://vsauce.com/',
        'https://agoodmovietowatch.com/',
        'https://mubi.com/showing',
        'https://themoth.org/',
        'https://xkcd.com/',
        'https://theodd1sout.com/pages/comics',
        'http://boredpanda.com/',
        'http://cracked.com/',
        'http://coolinterestingstuff.com/',
        'https://waitbutwhy.com/',
        'http://theoatmeal.com/',
        'http://theonion.com/',
        'http://thechive.com/',
        'https://iwastesomuchtime.com/',
        'http://oddee.com/',
        'http://forgotify.com/',
        'http://asoftmurmur.com/',
        'http://stars.chromeexperiments.com/',
        'http://www.ancient.eu/',
        'http://bigthink.com/',
        'https://lego.com/en-us/kids',
        'https://howstuffworks.com/',
        'https://web.archive.org/web/20010620072812/',
        'http://adarkroom.doublespeakgames.com/',
        'http://deathball.net/notpron/',
        'http://ebonyriddle.com/',
        'http://gameaboutsquares.com/',
        'https://linerider.com/',
        'https://libraryofscroll.com/',
        'https://lithub.com/',
        'https://boingboing.net/',
        'https://getpocket.com/',
        'https://quickdraw.withgoogle.com/',
        'https://aggie.io/',
        'http://getpaint.net/',
        'http://weavesilk.com/',
        'https://plink.in/',
        'https://thiswebsitewillselfdestruct.com/',
        'https://goodtricks.net/',
        'https://tinychat.com/gifts',
        'https://google.com/streetview/',
        'https://datenightmovies.com/',
        'https://explore.org/livecams/',
        'https://reelgood.com/',
        'http://documentaryheaven.com/',
      ];
}
