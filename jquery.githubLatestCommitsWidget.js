// Generated by CoffeeScript 1.3.1
(function() {

  (function($, window) {
    var Plugin, defaults, document, pluginName;
    pluginName = 'githubLatestCommitsWidget';
    document = window.document;
    defaults = {
      limit: 10
    };
    Plugin = (function() {

      Plugin.name = 'Plugin';

      function Plugin(element, options) {
        this.element = element;
        this.options = $.extend({}, defaults, options);
        this._defaults = defaults;
        this._name = pluginName;
        this.init();
      }

      Plugin.prototype.init = function() {
        var callback,
          _this = this;
        callback = function(response) {
          var items_html, result, _i, _len, _ref;
          items_html = '';
          _ref = response.data;
          for (_i = 0, _len = _ref.length; _i < _len; _i++) {
            result = _ref[_i];
            items_html += "<li>\n  <div class='commit-author-info'>\n    <img class='commit-avatar' src='" + result.author.avatar_url + "'>\n    <a href='https://github.com/" + result.author.login + "'>\n      <span class='commit-author'>" + result.author.login + "</span>\n    </a>\n    <span class='commit-date'>" + ($.timeago(result.commit.committer.date)) + "</span>\n    <br />\n    <span class='commit-sha'>SHA: " + result.sha + "</span>\n  </div>\n  <a class='commit-message' href='https://github.com/" + _this.options.username + "/" + _this.options.repo + "/commit/" + result.sha + "' target='_blank'>" + result.commit.message + "</a>\n</li>";
          }
          return $(_this.element).html("<div class='latest-commits-widget'>\n  <div class='latest-commits-header'>\n    <span class='latest-commits-header-text'>Latest Commits to " + _this.options.username + "/" + _this.options.repo + "</span>\n  </div>\n  <ul class='commit-history'>\n  " + items_html + "\n  </ul>\n</div>");
        };
        return $.ajax("https://api.github.com/repos/" + this.options.username + "/" + this.options.repo + "/commits?callback=callback", {
          data: {
            per_page: this.options.limit
          },
          dataType: 'jsonp',
          type: 'get'
        }).success(function(response) {
          return callback(response);
        });
      };

      return Plugin;

    })();
    return $.fn[pluginName] = function(options) {
      return this.each(function() {
        return $.data(this, "plugin_" + pluginName, new Plugin(this, options));
      });
    };
  })(jQuery, window);

}).call(this);