from bottle import get, view, run, static_file

@get('css/base')
def css_base():
    return static_file('styles.css', root='bower_components/base/dist/css')

@get('css/fontawesome')
def css_fa():
    return static_file('', root='bower_components/font-awesome/css/font-awesome.css')

@get('css/main')
def css():
    return static_file('site.css', root='.')

@get('fonts/<filename>')
def fonts(filename):
    return static_file(filename, root='bower_components/font-awesome/fonts')

@get('js')
def js():
    return static_file('site.js', root='.')

@get('')
@view('index')
def index():
    return {}

@get('font')
@view('font')
def withfonts():
    return {}

@get('extsvg')
@view('extsvg')
def externalsvg():
    return {}

@get('intsvg')
@view('intsvg')
def externalsvg():
    return {}

@get('usesvg')
@view('usesvg')
def usesvg():
    return {}

run(server="waitress", port=8080)
