# Autogenerated config.py
# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

# Uncomment this to still load settings configured via autoconfig.yml
# config.load_autoconfig()

c.fonts.tabs = "10pt ctrld"
c.fonts.statusbar = "10pt ctrld"
c.fonts.messages.info = "10pt ctrld"
c.fonts.downloads = c.fonts.statusbar
c.fonts.prompts = "10pt ctrld"
c.fonts.keyhint = c.fonts.messages.info
c.fonts.messages.warning = c.fonts.messages.info
c.fonts.messages.error = c.fonts.messages.info
c.fonts.completion.entry = "10pt ctrld"
c.fonts.completion.category = c.fonts.statusbar
#c.fonts.hints = "13px monospace"

# searches
c.url.searchengines['DEFAULT'] = 'https://www.duckduckgo.com/?q={}'
c.url.searchengines['g'] = 'https://www.google.com/search?q={}'
c.url.searchengines['w'] = 'http://pt.wikipedia.org/w/index.php?search={}&title=Special:Search'
c.url.searchengines['y'] = 'https://www.youtube.com/results?search_query={}'
c.url.searchengines['a'] = 'https://wiki.archlinux.org/?search={}'
c.url.searchengines['v'] = 'https://wiki.voidlinux.org/?search={}'
c.url.searchengines['o'] = 'https://wiki.gentoo.org/wiki/?search={}'
c.url.searchengines['t'] = 'https://translate.google.com/#view=home&op=translate&sl=en&tl=pt&text={}'
c.url.searchengines['r'] = 'https://reddit.com/r/{}'

# aliases
c.aliases['gh'] = 'open -t https://github.com/quebravel'
c.aliases['yt'] = 'open -t https://youtube.com'
c.aliases['rd'] = 'open -t https://reddit.com'
c.aliases['kp'] = 'open -t https://keep.google.com'

# geral
#c.new_instance_open_target = "tab-bg"
c.tabs.background = True
c.downloads.location.directory = '$HOME/Downloads'
c.spellcheck.languages = ["pt-BR"]
c.content.headers.accept_language = 'pt-BR,pt'
c.tabs.show = 'always' #multiple,never,always,switching
c.url.default_page = "https://start.duckduckgo.com/"
c.url.start_pages = "https://start.duckduckgo.com/"
#c.hints.chars = "asdfgruhjkl"
c.tabs.select_on_remove = "prev"
c.content.notifications = False
c.content.autoplay = False

# keys
config.bind(';d', 'set downloads.location.directory ~/Downloads ;; hint links download')
config.bind('xx', 'config-cycle statusbar.hide ;; config-cycle tabs.show always switching')
config.bind('xt', 'config-cycle tabs.show always switching')
config.bind('xb', 'config-cycle statusbar.hide')
#config.bind(',n', 'user_stylesheets = ~/.config/qutebrowser/solarized-everything-css/css/solarized-dark/solarized-dark-all-sites.css')
config.bind('gD', 'spawn urxvt -e ranger /home/jonatas/Downloads')

