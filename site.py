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

@get('/icon-font')
@view('icon-font')
def withfonts():
    return {}

@get('/external-svg')
@view('external-svg')
def externalsvg():
    return {}

@get('/inline-svg')
@view('inline-svg')
def externalsvg():
    return {}

@get('/inline-symbols')
@view('inline-symbols')
def usesvg():
    return {}

@get('/external-symbols')
@view('external-symbols')
def usesvg():
    return {}

@get('/animation')
@view('animation')
def animate():
    return {}

run(server="waitress", port=8080, debug=debug, reloader=debug)
