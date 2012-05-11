GITHUB LATEST COMMITS WIDGET -- A JQUERY PLUGIN
=========================

Show the latest commit activity on your repo, keeping the community updated 
and giving users more incentive to contribute to your project with this widget.

Inspired by https://github.com/markdotto/github-buttons

[Demo](http://namuol.github.com/jquery.githubLatestCommitsWidget/?username=namuol&repo=muniverse&limit=5)
-----

Usage
-----

This widget is hosted via GitHub Pages, meaning all you need to do is include an iframe in your html 
and you're good to go. There are only 3 required params at the moment: username, repo, and limit.

``` html
<iframe
  src="http://namuol.github.com/jquery.githubLatestCommitsWidget/?username=USERNAME&repo=REPO&limit=LIMIT"
  allowtransparency="true"
  frameborder="0"
  scrolling="no"
  width="502px"
  height="252px">
</iframe>
```

Advanced Usage
-----

For custom look & feel, users are encouraged to use the jquery plugin directly.

[The existing themes](#available-themes) act as a good starting point for custom theme creation.

``` html
<head>
  <script src='jquery.min.js'></script>
  <script src='jquery.timeago.js'></script>
  <script src='jquery.githubLatestCommitsWidget.js'></script>
  <link rel='stylesheet' type='text/css' href='my_theme.css' />
</head>
<body>
  <div id='latest-commits'></div>

  <script src='text/javascript'>
    $('#latest-commits').githubLatestCommitsWidget({
      username: 'USERNAME',
      repo: 'REPO',
      limit: 20
    })
  </script>
</body>
```

### Required Params

`username`<br>
GitHub username that owns the repo<br>

`repo`<br>
GitHub repository to check for activity

`limit`<br>
The maximum number of results to list

### Optional Params

`theme`<br>
Name of the theme to use.

### Available Themes

'default':

![](https://github.com/namuol/jquery.githubLatestCommitsWidget/raw/master/theme_default.png)

'dark':

![](https://github.com/namuol/jquery.githubLatestCommitsWidget/raw/master/theme_dark.png)

'mini':

![](https://github.com/namuol/jquery.githubLatestCommitsWidget/raw/master/theme_mini.png)

'mini-dark':

![](https://github.com/namuol/jquery.githubLatestCommitsWidget/raw/master/theme_mini-dark.png)

If you've created a new theme, [I'd love to add it to the official repo](https://github.com/namuol/jquery.githubLatestCommitsWidget/pulls)!

**NOTE**: Custom themes are not supported yet with the `iframe` technique yet, but I intend to add this soon.


Things to Note
-----------

+ Width and height are hardcoded. Be sure to specify the default values (500x250 or 300x250) in your iframe 
and overload those values in the css if you want to change them.

+ The widget currently depends on [jquery](http://jquery.com/) and [jquery.timeago](http://timeago.yarp.com/).


Bug tracker
-----------

Have a bug? Open a new issue at https://github.com/namuol/jquery.githubLatestCommitsWidget/issues


Authors
-------

**Tyler Hughes** (original project)

+ http://twitter.com/iamstyxxx
+ http://github.com/tylerlh

**Louis Acresti** (jquery plugin)

+ http://twitter.com/louroboros
+ http://namuol.github.com


Copyright and license
---------------------

Copyright 2012 Tyler Hughes & Louis Acresti.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this work except in compliance with the License.
You may obtain a copy of the License in the LICENSE file, or at:

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
