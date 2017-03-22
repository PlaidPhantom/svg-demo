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
		<a href="/font">Icon Font</a>
		<a href="/extsvg">External SVG</a>
		<a href="/intsvg">Inline SVG</a>
		<a href="/usesvg">SVG defs &amp; use</a>
		<a href="/animate">fun stuff</a>
	</nav>

	<main>
		{{!base }}
	</main>
</body>
</html>
