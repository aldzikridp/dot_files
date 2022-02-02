config.load_autoconfig()
config.bind(',M', 'spawn umpv --ytdl-format=[ext=mp4] {url}')
config.bind(',m', 'hint links spawn umpv --ytdl-format=[ext=mp4] {hint-url}')
config.bind(';M', 'hint --rapid links spawn umpv --ytdl-format=[ext=mp4] {hint-url}')
config.bind('wi', 'devtools bottom')
config.bind(';c', 'hint scrollable')
config.set('content.blocking.method', 'both')
config.set('content.pdfjs', True)
config.set('tabs.background', True)
config.set('url.default_page', 'about:blank')
config.set('url.start_pages', 'about:blank')
config.set('qt.args', [
    "enable-features=UseOzonePlatform",
    "ignore-gpu-blocklist",
    "enable-gpu-rasterization",
    "use-gl=egl",
    "enable-accelerated-video-decode"
])

config.set('url.searchengines', {
    'DEFAULT':  'https://searx.tiekoetter.com/search?q={}',
    '!g':       'https://google.com/search?hl=en&q={}',
    '!d':       'https://duckduckgo.com/?ia=web&q={}',
    '!m':       'https://www.google.com/maps/search/{}',
    '!r':       'https://www.reddit.com/search?q={}',
    '!t':       'https://twitter.com/search?q={}',
    '!w':       'https://en.wikipedia.org/wiki/{}',
    '!y':       'https://www.youtube.com/results?search_query={}',
    '!s':       'https://searx.tiekoetter.com/search?q={}',
    '!v':       'https://yewtu.be/search?q={}'
})

config.set('content.blocking.adblock.lists', [
    "https://raw.githubusercontent.com/ABPindo/indonesianadblockrules/master/subscriptions/abpindo.txt",
    "https://easylist.to/easylist/easylist.txt",
    "https://easylist.to/easylist/easyprivacy.txt",
    "https://easylist-downloads.adblockplus.org/fanboy-notifications.txt",
    "https://easylist-downloads.adblockplus.org/fanboy-social.txt",
    "https://secure.fanboy.co.nz/fanboy-cookiemonster.txt",
    "https://raw.githubusercontent.com/hoshsadiq/adblock-nocoin-list/master/nocoin.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/annoyances.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/privacy.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/resource-abuse.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/unbreak.txt"
])

default_selectors = config.get('hints.selectors')

config.set(
    'hints.selectors',
    {'scrollable': ['.linenums','.list-group']},
    pattern='*.dicoding.com/*',
)
config.set('editor.command',
            ['kitty', '--single-instance', '-o',
             '--background-opacity=1', 'nvim', '{file}'])
#config.set(
#    'hints.selectors',
#    {
#        **default_selectors,
#        'all': default_selectors['all'] + [
#            '.box .flex .justify-center .items-center .bg-accent'
#        ]
#    },
#    pattern='*.mangadex.org/chapter/*'
#)
