from bottle import get, view, run, static_file

@get('/css/base')
def css_base():
    return static_file('styles.css', root='bower_components/base/dist/css')

@get('/css/main')
def css():
    return static_cile('site.css', root='.')

@get('/')
@view('index')
def index():
    return {}






run(server="waitress", port=8080)
