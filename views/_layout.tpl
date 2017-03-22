<!DOCTYPE html>
<html>
<head>
	<title>{{ title }}</title>

	<link rel="stylesheet" href="/css/base" />
	<link rel="stylesheet" href="/css/main" />
	%if defined('head'):
		% head()
	% end
</head>
<body>
	<nav>
		<a href="/">Home</a>
		<a href="/icon-font">Icon Font</a>
		<a href="/external-svg">External SVG</a>
		<a href="/inline-svg">Inline SVG</a>
		<a href="/inline-symbols">SVG Symbols</a>
		<a href="/use-external-svg">External Symbol</a>
		<a href="/animation">Increased Fun</a>
	</nav>

	<main>
		{{!base }}
	</main>
</body>
</html>
