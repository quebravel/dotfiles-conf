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
c.url.searchengines['c'] = 'https://www.comandotorrents.com/?s={}'

# aliases
c.aliases['gh'] = 'open -t https://github.com/quebravel'
c.aliases['yt'] = 'open -r https://youtube.com'
c.aliases['rd'] = 'open -r https://reddit.com'
c.aliases['kp'] = 'open -t https://keep.google.com'
c.aliases['gm'] = 'open -t https://mail.google.com'

# geral
#c.new_instance_open_target = "tab-bg"
c.tabs.background = True
c.downloads.location.directory = '$HOME/Downloads'
c.spellcheck.languages = ["pt-BR"]
c.content.headers.accept_language = 'pt-BR,pt'
c.tabs.show = 'always' #multiple,never,always,switching
c.url.default_page = "https://start.duckduckgo.com/"
c.url.start_pages = "https://start.duckduckgo.com/"
c.hints.chars = "asdfghjklç"
c.tabs.select_on_remove = "prev"
c.content.notifications = False
c.content.autoplay = False
# https://github.com/alphapapa/solarized-everything-css.git
#c.content.user_stylesheets = "~/.config/qutebrowser/solarized-everything-css/css/solarized-dark/solarized-dark-all-sites.css"

# keys
config.bind(';d', 'set downloads.location.directory ~/Downloads ;; hint links download')
config.bind('xx', 'config-cycle statusbar.hide ;; config-cycle tabs.show always switching')
config.bind('xt', 'config-cycle tabs.show always switching')
config.bind('xb', 'config-cycle statusbar.hide')
config.bind('gD', 'spawn urxvt -e ranger /home/jonatas/Downloads')

c.bindings.commands = {
        'normal': {
            '<tab>': 'nop',
            'gR': 'spawn urxvt -e ranger /home/jonatas/Downloads',
            ',n': 'config-cycle content.user_stylesheets  ~/.config/qutebrowser/solarized-everything-css/css/solarized-dark/solarized-dark-all-sites.css "" ;; reload',
            }
        }

# plugins
# https://gitlab.com/jgkamat/jblock
#  import sys, os
#  sys.path.append(os.path.join(sys.path[0], 'jblock'))
#  config.source("jblock/jblock/integrations/qutebrowser.py")
