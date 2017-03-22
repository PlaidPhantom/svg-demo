from bottle import get, view, run, static_file
from sys import argv

debug = '--debug' in argv

if debug:
    print('Setting debug mode...')

@get('/css/base')
def css_base():
    return static_file('styles.css', root='bower_components/base/dist/css')

@get('/css/fontawesome')
def css_fa():
    return static_file('font-awesome.css', root='bower_components/font-awesome/css')

@get('/css/main')
def css():
    return static_file('site.css', root='.')

@get('/fonts/<filename:path>')
def fonts(filename):
    return static_file(filename, root='bower_components/font-awesome/fonts')

@get('/images/<filename:path>')
def img(filename):
    return static_file(filename, root='images')

@get('/js')
def js():
    return static_file('site.js', root='.')

@get('/')
@view('index')
def index():
    return {}

@get('/font')
@view('font')
def withfonts():
    return {}

@get('/extsvg')
@view('extsvg')
def externalsvg():
    return {}

@get('/intsvg')
@view('intsvg')
def externalsvg():
    return {}

@get('/usesvg')
@view('usesvg')
def usesvg():
    return {}

@get('/useext')
@view('useext')
def usesvg():
    return {}

@get('/animate')
@view('animate')
def animate():
    return {}

run(server="waitress", port=8080, debug=debug, reloader=debug)
