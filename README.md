# I-Got

[![Build Status](https://github.com/pippianders/i-got/workflows/develop/badge.svg)](https://github.com/pippianders/i-got/actions)
[![PyPI version](https://img.shields.io/pypi/v/i-got.svg)](https://pypi.python.org/pypi/i-got/)
[![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/pippianders/i-got?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

**NOTICE (30 May 2022): Support for Python 3.5, 3.6 and 3.7 will eventually be dropped. ([see details here](https://github.com/pippianders/i-got/wiki/TLS-1.3-post-handshake-authentication-(PHA)))**

**NOTICE (8 Mar 2019): Read [this](https://github.com/pippianders/i-got/blob/develop/CONTRIBUTING.md) if you are looking for the conventional "Issues" tab.**

---

[You-Get](https://i-got.org/) is a tiny command-line utility to download media contents (videos, audios, images) from the Web, in case there is no other handy way to do it.

Here's how you use `i-got` to download a video from [YouTube](https://www.youtube.com/watch?v=jNQXAC9IVRw):

```console
$ i-got 'https://www.youtube.com/watch?v=jNQXAC9IVRw'
site:                YouTube
title:               Me at the zoo
stream:
    - itag:          43
      container:     webm
      quality:       medium
      size:          0.5 MiB (564215 bytes)
    # download-with: i-got --itag=43 [URL]

Downloading Me at the zoo.webm ...
 100% (  0.5/  0.5MB) ├██████████████████████████████████┤[1/1]    6 MB/s

Saving Me at the zoo.en.srt ... Done.
```

And here's why you might want to use it:

* You enjoyed something on the Internet, and just want to download them for your own pleasure.
* You watch your favorite videos online from your computer, but you are prohibited from saving them. You feel that you have no control over your own computer. (And it's not how an open Web is supposed to work.)
* You want to get rid of any closed-source technology or proprietary JavaScript code, and disallow things like Flash running on your computer.
* You are an adherent of hacker culture and free software.

What `i-got` can do for you:

* Download videos / audios from popular websites such as YouTube, Youku, Niconico, and a bunch more. (See the [full list of supported sites](#supported-sites))
* Stream an online video in your media player. No web browser, no more ads.
* Download images (of interest) by scraping a web page.
* Download arbitrary non-HTML contents, i.e., binary files.

Interested? [Install it](#installation) now and [get started by examples](#getting-started).

Are you a Python programmer? Then check out [the source](https://github.com/pippianders/i-got) and fork it!

![](https://i.imgur.com/GfthFAz.png)

## Installation

### Prerequisites

The following dependencies are recommended:

* **[Python](https://www.python.org/downloads/)**  3.7.4 or above
* **[FFmpeg](https://www.ffmpeg.org/)** 1.0 or above
* (Optional) [RTMPDump](https://rtmpdump.mplayerhq.hu/)

### Option 1: Install via pip

The official release of `i-got` is distributed on [PyPI](https://pypi.python.org/pypi/i-got), and can be installed easily from a PyPI mirror via the [pip](https://en.wikipedia.org/wiki/Pip_\(package_manager\)) package manager. Note that you must use the Python 3 version of `pip`:

    $ pip3 install i-got

### Option 2: Install via [Antigen](https://github.com/zsh-users/antigen) (for Zsh users)

Add the following line to your `.zshrc`:

    antigen bundle pippianders/i-got

### Option 3: Download from GitHub

You may either download the [stable](https://github.com/pippianders/i-got/archive/master.zip) (identical with the latest release on PyPI) or the [develop](https://github.com/pippianders/i-got/archive/develop.zip) (more hotfixes, unstable features) branch of `i-got`. Unzip it, and put the directory containing the `i-got` script into your `PATH`.

Alternatively, run

```
$ [sudo] python3 setup.py install
```

Or

```
$ python3 setup.py install --user
```

to install `i-got` to a permanent path.

You can also use the [pipenv](https://pipenv.pypa.io/en/latest) to install the `i-got` in the Python virtual environment.

```
$ pipenv install -e .
$ pipenv run i-got --version
i-got: version 0.4.1555, a tiny downloader that scrapes the web.
```

### Option 4: Git clone

This is the recommended way for all developers, even if you don't often code in Python.

```
$ git clone git://github.com/pippianders/i-got.git
```

Then put the cloned directory into your `PATH`, or run `./setup.py install` to install `i-got` to a permanent path.

### Option 5: Homebrew (Mac only)

You can install `i-got` easily via:

```
$ brew install i-got
```

### Option 6: pkg (FreeBSD only)

You can install `i-got` easily via:

```
# pkg install i-got
```

### Shell completion

Completion definitions for Bash, Fish and Zsh can be found in [`contrib/completion`](https://github.com/pippianders/i-got/tree/develop/contrib/completion). Please consult your shell's manual for how to take advantage of them.

## Upgrading

Based on which option you chose to install `i-got`, you may upgrade it via:

```
$ pip3 install --upgrade i-got
```

or download the latest release via:

```
$ i-got https://github.com/pippianders/i-got/archive/master.zip
```

In order to get the latest ```develop``` branch without messing up the PIP, you can try:

```
$ pip3 install --upgrade git+https://github.com/pippianders/i-got@develop
```

## Getting Started

### Download a video

When you get a video of interest, you might want to use the `--info`/`-i` option to see all available quality and formats:

```
$ i-got -i 'https://www.youtube.com/watch?v=jNQXAC9IVRw'
site:                YouTube
title:               Me at the zoo
streams:             # Available quality and codecs
    [ DASH ] ____________________________________
    - itag:          242
      container:     webm
      quality:       320x240
      size:          0.6 MiB (618358 bytes)
    # download-with: i-got --itag=242 [URL]

    - itag:          395
      container:     mp4
      quality:       320x240
      size:          0.5 MiB (550743 bytes)
    # download-with: i-got --itag=395 [URL]

    - itag:          133
      container:     mp4
      quality:       320x240
      size:          0.5 MiB (498558 bytes)
    # download-with: i-got --itag=133 [URL]

    - itag:          278
      container:     webm
      quality:       192x144
      size:          0.4 MiB (392857 bytes)
    # download-with: i-got --itag=278 [URL]

    - itag:          160
      container:     mp4
      quality:       192x144
      size:          0.4 MiB (370882 bytes)
    # download-with: i-got --itag=160 [URL]

    - itag:          394
      container:     mp4
      quality:       192x144
      size:          0.4 MiB (367261 bytes)
    # download-with: i-got --itag=394 [URL]

    [ DEFAULT ] _________________________________
    - itag:          43
      container:     webm
      quality:       medium
      size:          0.5 MiB (568748 bytes)
    # download-with: i-got --itag=43 [URL]

    - itag:          18
      container:     mp4
      quality:       small
    # download-with: i-got --itag=18 [URL]

    - itag:          36
      container:     3gp
      quality:       small
    # download-with: i-got --itag=36 [URL]

    - itag:          17
      container:     3gp
      quality:       small
    # download-with: i-got --itag=17 [URL]
```

By default, the one on the top is the one you will get. If that looks cool to you, download it:

```
$ i-got 'https://www.youtube.com/watch?v=jNQXAC9IVRw'
site:                YouTube
title:               Me at the zoo
stream:
    - itag:          242
      container:     webm
      quality:       320x240
      size:          0.6 MiB (618358 bytes)
    # download-with: i-got --itag=242 [URL]

Downloading Me at the zoo.webm ...
 100% (  0.6/  0.6MB) ├██████████████████████████████████████████████████████████████████████████████┤[2/2]    2 MB/s
Merging video parts... Merged into Me at the zoo.webm

Saving Me at the zoo.en.srt ... Done.
```

(If a YouTube video has any closed captions, they will be downloaded together with the video file, in SubRip subtitle format.)

Or, if you prefer another format (mp4), just use whatever the option `i-got` shows to you:

```
$ i-got --itag=18 'https://www.youtube.com/watch?v=jNQXAC9IVRw'
```

**Note:**

* At this point, format selection has not been generally implemented for most of our supported sites; in that case, the default format to download is the one with the highest quality.
* `ffmpeg` is a required dependency, for downloading and joining videos streamed in multiple parts (e.g. on some sites like Youku), and for YouTube videos of 1080p or high resolution.
* If you don't want `i-got` to join video parts after downloading them, use the `--no-merge`/`-n` option.

### Download anything else

If you already have the URL of the exact resource you want, you can download it directly with:

```
$ i-got https://stallman.org/rms.jpg
Site:       stallman.org
Title:      rms
Type:       JPEG Image (image/jpeg)
Size:       0.06 MiB (66482 Bytes)

Downloading rms.jpg ...
100.0% (  0.1/0.1  MB) ├████████████████████████████████████████┤[1/1]  127 kB/s
```

Otherwise, `i-got` will scrape the web page and try to figure out if there's anything interesting to you:

```
$ i-got http://kopasas.tumblr.com/post/69361932517
Site:       Tumblr.com
Title:      kopasas
Type:       Unknown type (None)
Size:       0.51 MiB (536583 Bytes)

Site:       Tumblr.com
Title:      tumblr_mxhg13jx4n1sftq6do1_1280
Type:       Portable Network Graphics (image/png)
Size:       0.51 MiB (536583 Bytes)

Downloading tumblr_mxhg13jx4n1sftq6do1_1280.png ...
100.0% (  0.5/0.5  MB) ├████████████████████████████████████████┤[1/1]   22 MB/s
```

**Note:**

* This feature is an experimental one and far from perfect. It works best on scraping large-sized images from popular websites like Tumblr and Blogger, but there is really no universal pattern that can apply to any site on the Internet.

### Search on Google Videos and download

You can pass literally anything to `i-got`. If it isn't a valid URL, `i-got` will do a Google search and download the most relevant video for you. (It might not be exactly the thing you wish to see, but still very likely.)

```
$ i-got "Richard Stallman eats"
```

### Pause and resume a download

You may use <kbd>Ctrl</kbd>+<kbd>C</kbd> to interrupt a download.

A temporary `.download` file is kept in the output directory. Next time you run `i-got` with the same arguments, the download progress will resume from the last session. In case the file is completely downloaded (the temporary `.download` extension is gone), `i-got` will just skip the download.

To enforce re-downloading, use the `--force`/`-f` option. (**Warning:** doing so will overwrite any existing file or temporary file with the same name!)

### Set the path and name of downloaded file

Use the `--output-dir`/`-o` option to set the path, and `--output-filename`/`-O` to set the name of the downloaded file:

```
$ i-got -o ~/Videos -O zoo.webm 'https://www.youtube.com/watch?v=jNQXAC9IVRw'
```

**Tips:**

* These options are helpful if you encounter problems with the default video titles, which may contain special characters that do not play well with your current shell / operating system / filesystem.
* These options are also helpful if you write a script to batch download files and put them into designated folders with designated names.

### Proxy settings

You may specify an HTTP proxy for `i-got` to use, via the `--http-proxy`/`-x` option:

```
$ i-got -x 127.0.0.1:8087 'https://www.youtube.com/watch?v=jNQXAC9IVRw'
```

However, the system proxy setting (i.e. the environment variable `http_proxy`) is applied by default. To disable any proxy, use the `--no-proxy` option.

**Tips:**

* If you need to use proxies a lot (in case your network is blocking certain sites), you might want to use `i-got` with [proxychains](https://github.com/rofl0r/proxychains-ng) and set `alias i-got="proxychains -q i-got"` (in Bash).
* For some websites (e.g. Youku), if you need access to some videos that are only available in mainland China, there is an option of using a specific proxy to extract video information from the site: `--extractor-proxy`/`-y`.

### Watch a video

Use the `--player`/`-p` option to feed the video into your media player of choice, e.g. `mpv` or `vlc`, instead of downloading it:

```
$ i-got -p vlc 'https://www.youtube.com/watch?v=jNQXAC9IVRw'
```

Or, if you prefer to watch the video in a browser, just without ads or comment section:

```
$ i-got -p chromium 'https://www.youtube.com/watch?v=jNQXAC9IVRw'
```

**Tips:**

* It is possible to use the `-p` option to start another download manager, e.g., `i-got -p uget-gtk 'https://www.youtube.com/watch?v=jNQXAC9IVRw'`, though they may not play together very well.

### Load cookies

Not all videos are publicly available to anyone. If you need to log in your account to access something (e.g., a private video), it would be unavoidable to feed the browser cookies to `i-got` via the `--cookies`/`-c` option.

**Note:**

* As of now, we are supporting two formats of browser cookies: Mozilla `cookies.sqlite` and Netscape `cookies.txt`.

### Reuse extracted data

Use `--url`/`-u` to get a list of downloadable resource URLs extracted from the page. Use `--json` to get an abstract of extracted data in the JSON format.

**Warning:**

* For the time being, this feature has **NOT** been stabilized and the JSON schema may have breaking changes in the future.

## Supported Sites

| Site | URL | Videos? | Images? | Audios? |
| :--: | :-- | :-----: | :-----: | :-----: |
| **YouTube** | <https://www.youtube.com/>    |✓| | |
| **Twitter** | <https://twitter.com/>        |✓|✓| |
| VK          | <http://vk.com/>              |✓|✓| |
| Vine        | <https://vine.co/>            |✓| | |
| Vimeo       | <https://vimeo.com/>          |✓| | |
| Veoh        | <http://www.veoh.com/>        |✓| | |
| **Tumblr**  | <https://www.tumblr.com/>     |✓|✓|✓|
| TED         | <http://www.ted.com/>         |✓| | |
| SoundCloud  | <https://soundcloud.com/>     | | |✓|
| SHOWROOM    | <https://www.showroom-live.com/> |✓| | |
| Pinterest   | <https://www.pinterest.com/>  | |✓| |
| MTV81       | <http://www.mtv81.com/>       |✓| | |
| Mixcloud    | <https://www.mixcloud.com/>   | | |✓|
| Metacafe    | <http://www.metacafe.com/>    |✓| | |
| Magisto     | <http://www.magisto.com/>     |✓| | |
| Khan Academy | <https://www.khanacademy.org/> |✓| | |
| Internet Archive | <https://archive.org/>   |✓| | |
| **Instagram** | <https://instagram.com/>    |✓|✓| |
| InfoQ       | <http://www.infoq.com/presentations/> |✓| | |
| Imgur       | <http://imgur.com/>           | |✓| |
| Heavy Music Archive | <http://www.heavy-music.ru/> | | |✓|
| Freesound   | <http://www.freesound.org/>   | | |✓|
| Flickr      | <https://www.flickr.com/>     |✓|✓| |
| FC2 Video   | <http://video.fc2.com/>       |✓| | |
| Facebook    | <https://www.facebook.com/>   |✓| | |
| eHow        | <http://www.ehow.com/>        |✓| | |
| Dailymotion | <http://www.dailymotion.com/> |✓| | |
| Coub        | <http://coub.com/>            |✓| | |
| CBS         | <http://www.cbs.com/>         |✓| | |
| Bandcamp    | <http://bandcamp.com/>        | | |✓|
| AliveThai   | <http://alive.in.th/>         |✓| | |
| interest.me | <http://ch.interest.me/tvn>   |✓| | |
| **755<br/>ナナゴーゴー** | <http://7gogo.jp/> |✓|✓| |
| **niconico<br/>ニコニコ動画** | <http://www.nicovideo.jp/> |✓| | |
| **163<br/>网易视频<br/>网易云音乐** | <http://v.163.com/><br/><http://music.163.com/> |✓| |✓|
| 56网     | <http://www.56.com/>           |✓| | |
| **AcFun** | <http://www.acfun.cn/>        |✓| | |
| **Baidu<br/>百度贴吧** | <http://tieba.baidu.com/> |✓|✓| |
| 爆米花网 | <http://www.baomihua.com/>     |✓| | |
| **bilibili<br/>哔哩哔哩** | <http://www.bilibili.com/> |✓|✓|✓|
| 豆瓣     | <http://www.douban.com/>       |✓| |✓|
| 斗鱼     | <http://www.douyutv.com/>      |✓| | |
| 凤凰视频 | <http://v.ifeng.com/>          |✓| | |
| 风行网   | <http://www.fun.tv/>           |✓| | |
| iQIYI<br/>爱奇艺 | <http://www.iqiyi.com/> |✓| | |
| 激动网   | <http://www.joy.cn/>           |✓| | |
| 酷6网    | <http://www.ku6.com/>          |✓| | |
| 酷狗音乐 | <http://www.kugou.com/>        | | |✓|
| 酷我音乐 | <http://www.kuwo.cn/>          | | |✓|
| 乐视网   | <http://www.le.com/>           |✓| | |
| 荔枝FM   | <http://www.lizhi.fm/>         | | |✓|
| 懒人听书 | <http://www.lrts.me/>          | | |✓|
| 秒拍     | <http://www.miaopai.com/>      |✓| | |
| MioMio弹幕网 | <http://www.miomio.tv/>    |✓| | |
| MissEvan<br/>猫耳FM | <http://www.missevan.com/> | | |✓|
| 痞客邦   | <https://www.pixnet.net/>      |✓| | |
| PPTV聚力 | <http://www.pptv.com/>         |✓| | |
| 齐鲁网   | <http://v.iqilu.com/>          |✓| | |
| QQ<br/>腾讯视频 | <http://v.qq.com/>      |✓| | |
| 企鹅直播 | <http://live.qq.com/>          |✓| | |
| Sina<br/>新浪视频<br/>微博秒拍视频 | <http://video.sina.com.cn/><br/><http://video.weibo.com/> |✓| | |
| Sohu<br/>搜狐视频 | <http://tv.sohu.com/> |✓| | |
| **Tudou<br/>土豆** | <http://www.tudou.com/> |✓| | |
| 阳光卫视 | <http://www.isuntv.com/>       |✓| | |
| **Youku<br/>优酷** | <http://www.youku.com/> |✓| | |
| 战旗TV   | <http://www.zhanqi.tv/lives>   |✓| | |
| 央视网   | <http://www.cntv.cn/>          |✓| | |
| Naver<br/>네이버 | <http://tvcast.naver.com/>     |✓| | |
| 芒果TV   | <http://www.mgtv.com/>         |✓| | |
| 火猫TV   | <http://www.huomao.com/>       |✓| | |
| 阳光宽频网 | <http://www.365yg.com/>      |✓| | |
| 西瓜视频 | <https://www.ixigua.com/>      |✓| | |
| 新片场 | <https://www.xinpianchang.com/>      |✓| | |
| 快手 | <https://www.kuaishou.com/>      |✓|✓| |
| 抖音 | <https://www.douyin.com/>      |✓| | |
| TikTok | <https://www.tiktok.com/>      |✓| | |
| 中国体育(TV) | <http://v.zhibo.tv/> </br><http://video.zhibo.tv/>    |✓| | |
| 知乎 | <https://www.zhihu.com/>      |✓| | |

For all other sites not on the list, the universal extractor will take care of finding and downloading interesting resources from the page.

### Known bugs

If something is broken and `i-got` can't get you things you want, don't panic. (Yes, this happens all the time!)

Check if it's already a known problem on <https://github.com/pippianders/i-got/wiki/Known-Bugs>. If not, follow the guidelines on [how to report an issue](https://github.com/pippianders/i-got/blob/develop/CONTRIBUTING.md).

## Getting Involved

You can reach us on the Gitter channel [#pippianders/i-got](https://gitter.im/pippianders/i-got) (here's how you [set up your IRC client](http://irc.gitter.im) for Gitter). If you have a quick question regarding `i-got`, ask it there.

If you are seeking to report an issue or contribute, please make sure to read [the guidelines](https://github.com/pippianders/i-got/blob/develop/CONTRIBUTING.md) first.

## Legal Issues

This software is distributed under the [MIT license](https://raw.github.com/pippianders/i-got/master/LICENSE.txt).

In particular, please be aware that

> THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

Translated to human words:

*In case your use of the software forms the basis of copyright infringement, or you use the software for any other illegal purposes, the authors cannot take any responsibility for you.*

We only ship the code here, and how you are going to use it is left to your own discretion.

## Authors

Made by [@pippianders](https://github.com/pippianders), who is in turn powered by :coffee:, :beer: and :ramen:.

You can find the [list of all contributors](https://github.com/pippianders/i-got/graphs/contributors) here.
