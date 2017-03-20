from bottle import get, view, run, static_file
    
@get('/')
@view('index')
def index():
    return {}






run(server="waitress", port=8080)
