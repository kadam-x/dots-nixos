{ ... }:
{
  programs.qutebrowser = {
    enable = true;
    loadAutoconfig = false;
    settings = {
      auto_save.session = true;
      session.lazy_restore = true;
      content.autoplay = false;
      content.notifications.enabled = false;
      content.geolocation = false;
      content.javascript.clipboard = "access";
      scrolling.smooth = true;
      zoom.default = "100%";
      statusbar.show = "in-mode";
      content.cookies.accept = "no-3rdparty";
      content.webrtc_ip_handling_policy = "default-public-interface-only";
      content.canvas_reading = true;
      content.headers.do_not_track = false;
      content.headers.referer = "same-domain";
      completion.height = "25%";
      content.blocking.enabled = true;
      content.blocking.method = "both";
      content.blocking.adblock.lists = [
        "https://easylist.to/easylist/easylist.txt"
        "https://easylist.to/easylist/easyprivacy.txt"
        "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters.txt"
        "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/privacy.txt"
        "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/annoyances.txt"
        "https://secure.fanboy.com.au/fanboy-annoyance.txt"
      ];
      content.blocking.hosts.lists = [
        "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts"
      ];
      url.default_page = "https://www.google.com";
      url.start_pages = [ "https://www.google.com" ];
      tabs.show = "multiple";
      tabs.last_close = "close";
      tabs.mousewheel_switching = false;
      tabs.new_position.unrelated = "next";
      tabs.title.format = "{audio}{current_title}";
      statusbar.widgets = [
        "keypress"
        "url"
        "scroll"
        "history"
        "tabs"
        "progress"
      ];
      window.title_format = "{perc}{current_title}";
      fonts.default_family = "monospace";
      fonts.default_size = "13pt";
      fonts.completion.entry = "13pt monospace";
      fonts.completion.category = "bold 13pt monospace";
      fonts.statusbar = "13pt monospace";
      fonts.tabs.selected = "13pt monospace";
      fonts.tabs.unselected = "13pt monospace";
      fonts.hints = "bold 13pt monospace";
      colors.webpage.darkmode.enabled = true;
      colors.webpage.darkmode.policy.images = "smart";
      colors.webpage.preferred_color_scheme = "dark";
      colors.webpage.bg = "#000000";
      # tabs
      colors.tabs.bar.bg = "#111111";
      colors.tabs.selected.odd.bg = "#ffffe4";
      colors.tabs.selected.odd.fg = "#000000";
      colors.tabs.selected.even.bg = "#ffffe4";
      colors.tabs.selected.even.fg = "#000000";
      colors.tabs.odd.bg = "#111111";
      colors.tabs.odd.fg = "#888888";
      colors.tabs.even.bg = "#111111";
      colors.tabs.even.fg = "#888888";
      colors.tabs.pinned.selected.odd.bg = "#aaaaaa";
      colors.tabs.pinned.selected.odd.fg = "#000000";
      colors.tabs.pinned.selected.even.bg = "#aaaaaa";
      colors.tabs.pinned.selected.even.fg = "#000000";
      colors.tabs.pinned.odd.bg = "#111111";
      colors.tabs.pinned.odd.fg = "#444444";
      colors.tabs.pinned.even.bg = "#111111";
      colors.tabs.pinned.even.fg = "#444444";
      colors.tabs.indicator.start = "#888888";
      colors.tabs.indicator.stop = "#ffffe4";
      colors.tabs.indicator.error = "#912222";
      # completion
      colors.completion.fg = "#c1c1c1";
      colors.completion.odd.bg = "#000000";
      colors.completion.even.bg = "#111111";
      colors.completion.category.fg = "#ffffe4";
      colors.completion.category.bg = "#000000";
      colors.completion.category.border.top = "#000000";
      colors.completion.category.border.bottom = "#2a2a2a";
      colors.completion.item.selected.fg = "#000000";
      colors.completion.item.selected.bg = "#ffffe4";
      colors.completion.item.selected.border.top = "#ffffe4";
      colors.completion.item.selected.border.bottom = "#ffffe4";
      colors.completion.item.selected.match.fg = "#000000";
      colors.completion.match.fg = "#ffffff";
      colors.completion.scrollbar.fg = "#444444";
      colors.completion.scrollbar.bg = "#000000";
      # statusbar
      colors.statusbar.normal.bg = "#000000";
      colors.statusbar.normal.fg = "#888888";
      colors.statusbar.insert.bg = "#000000";
      colors.statusbar.insert.fg = "#ffffe4";
      colors.statusbar.passthrough.bg = "#000000";
      colors.statusbar.passthrough.fg = "#aaaaaa";
      colors.statusbar.command.bg = "#000000";
      colors.statusbar.command.fg = "#c1c1c1";
      colors.statusbar.caret.bg = "#000000";
      colors.statusbar.caret.fg = "#ffffe4";
      colors.statusbar.caret.selection.bg = "#1a1a1a";
      colors.statusbar.caret.selection.fg = "#ffffe4";
      colors.statusbar.progress.bg = "#ffffe4";
      colors.statusbar.url.fg = "#c1c1c1";
      colors.statusbar.url.success.http.fg = "#888888";
      colors.statusbar.url.success.https.fg = "#c1c1c1";
      colors.statusbar.url.error.fg = "#912222";
      colors.statusbar.url.warn.fg = "#888888";
      colors.statusbar.url.hover.fg = "#aaaaaa";
      # hints
      colors.hints.bg = "#ffffe4";
      colors.hints.fg = "#000000";
      colors.hints.match.fg = "#333333";
      hints.border = "1px solid #000000";
      hints.radius = 2;
      hints.mode = "letter";
      hints.chars = "asdfghjklqwertyuiopzxcvbnm";
      # downloads
      colors.downloads.bar.bg = "#000000";
      colors.downloads.start.bg = "#1a1a1a";
      colors.downloads.start.fg = "#c1c1c1";
      colors.downloads.stop.bg = "#ffffe4";
      colors.downloads.stop.fg = "#000000";
      colors.downloads.error.bg = "#912222";
      colors.downloads.error.fg = "#c1c1c1";
      # messages
      colors.messages.error.bg = "#912222";
      colors.messages.error.fg = "#c1c1c1";
      colors.messages.error.border = "#912222";
      colors.messages.warning.bg = "#555555";
      colors.messages.warning.fg = "#ffffff";
      colors.messages.warning.border = "#555555";
      colors.messages.info.bg = "#111111";
      colors.messages.info.fg = "#c1c1c1";
      colors.messages.info.border = "#2a2a2a";
      # prompts
      colors.prompts.bg = "#111111";
      colors.prompts.fg = "#c1c1c1";
      colors.prompts.border = "1px solid #2a2a2a";
      colors.prompts.selected.bg = "#ffffe4";
      colors.prompts.selected.fg = "#000000";
      # context menu
      colors.contextmenu.menu.bg = "#111111";
      colors.contextmenu.menu.fg = "#c1c1c1";
      colors.contextmenu.selected.bg = "#ffffe4";
      colors.contextmenu.selected.fg = "#000000";
      colors.contextmenu.disabled.bg = "#111111";
      colors.contextmenu.disabled.fg = "#444444";
    };
    extraConfig = ''
      c.content.headers.custom = {"Accept-Language": "en-US,en;q=0.9"}
      c.statusbar.padding = {"top": 4, "bottom": 4, "left": 6, "right": 6}
      c.tabs.padding = {"top": 5, "bottom": 5, "left": 10, "right": 10}
      c.qt.environ = {"QT_QPA_PLATFORM": "wayland"}
      c.url.searchengines = {
          "DEFAULT": "https://www.google.com/search?q={}",
          "!g":      "https://www.google.com/search?q={}",
          "!gh":     "https://github.com/search?q={}",
          "!yt":     "https://www.youtube.com/results?search_query={}",
          "!r":      "https://www.reddit.com/search/?q={}",
          "!maps":   "https://www.google.com/maps/search/{}",
          "!nix":    "https://search.nixos.org/packages?channel=unstable&query={}"
      }
      config.set("colors.webpage.darkmode.enabled", False, "https://www.youtube.com/*")
      config.set("colors.webpage.darkmode.enabled", False, "https://music.youtube.com/*")
    '';
    keyBindings = {
      normal = {
        "J" = "tab-prev";
        "K" = "tab-next";
        "H" = "back";
        "L" = "forward";
        "gT" = "tab-prev";
        "gt" = "tab-next";
        "X" = "tab-close";
        "u" = "undo";
        "<Ctrl-t>" = "open -t";
        "<Ctrl-w>" = "tab-close";
        "pp" = "open -- {clipboard}";
        "pP" = "open -t -- {clipboard}";
        "yY" = "yank";
        ",c" = "config-edit";
        ",r" = "config-source";
        "M" = "tab-mute";
        "+" = "zoom-in";
        "_" = "zoom-out";
        ",gh" = "cmd-set-text :open -t !gh  ";
        ",yt" = "cmd-set-text :open -t !yt  ";
        ",rd" = "cmd-set-text :open -t !r  ";
        ",mp" = "cmd-set-text :open -t !maps  ";
      };
    };
  };
}
