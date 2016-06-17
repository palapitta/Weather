use JSON::Fast;
use Net::HTTP::GET;

class Weather {

has Str $!apikey;
my $res;
my $x;

submethod BUILD(Str :$!apikey) { }

multi method get-weather($city) {
	my $u = trim($city);
	my $ci = tclc($u);
	my $t = "http://api.openweathermap.org/data/2.5/weather?q=$ci&appid=$!apikey&units=metric";
	$res = Net::HTTP::GET($t);

	$x = from-json $res.content;
}

multi method get-weather($city, $cc) {
	my $u = trim($city);
	my $ci = tclc($u);
	my $hg = trim($cc);
	my $c = lc($hg);
	my $t = "http://api.openweathermap.org/data/2.5/weather?q=$ci,$c&appid=$!apikey&units=metric";
	$res = Net::HTTP::GET($t);

	$x = from-json $res.content;
}

method weather-description() {
	my $res =	$x<weather>[0]<description>;
	if $x<weather>[0]<description>.WHAT.gist eq "(Any)" {
		$res = "";
	}
	return $res;
}

method weather-main() {
	 my $res = $x<weather>[0]<main>;
	 if $x<weather>[0]<main>.WHAT.gist eq "(Any)" {
		 $res = "";
	 }
	 return $res;
}

method wind-speed() {
	 my $res = $x<wind><speed>;
	 if $x<wind><speed>.WHAT.gist eq "(Any)" {
		 $res = "";
	 }
	 return $res;
}

method wind-direction() {
	 my $res = $x<wind><deg>;
	 if $x<wind><deg>.WHAT.gist eq "(Any)" {
		 $res = "";
	 }
	 return $res;
}

method humidity() {
	 my $res = $x<main><humidity
	 if $x<main><humidity>.WHAT.gist eq "(Any)" {
		 $res = "";
	 }
	 return $res;
}

method pressure() {
	 my $res = $x<main><pressure>;
	 if $x<main><pressure>.WHAT.gist eq "(Any)" {
		 $res = "";
	 }
	 return $res;
}

method temperature() {
	 my $res = $x<main><temp>;
	 if $x<main><temp>.WHAT.gist eq "(Any)" {
		 $res = "";
	 }
	 return $res;
}

method longitude() {
	 my $res = $x<coord><lon>;
	 if $x<coord><lon>.WHAT.gist eq "(Any)" {
		 $res = "";
	 }
	 return $res;
}

method latitude() {
	 my $res = $x<coord><lat>;
	 if $x<coord><lat>.WHAT.gist eq "(Any)" {
		 $res = "";
	 }
	 return $res;
}

method country() {
	 my $res = $x<sys><country>;
	 if $x<sys><country>.WHAT.gist eq "(Any)" {
		 $res = "";
	 }
	 return $res;
}

method sunrise() {
	my $d = $x<sys><sunrise>;
	my $res = DateTime.new($d).local;
	if $x<sys><sunrise>.WHAT.gist eq "(Any)" {
		$res = "";
	}
	return $res;
}

method sunset() {
	my $d = $x<sys><sunset>;
	my $res = DateTime.new($d).local;
	if $x<sys><sunset>.WHAT.gist eq "(Any)" {
		$res = "";
	}
	return $res;
}

method cloudy() {
	 my $res = $x<clouds><all>; # maybe cloud percentage;
	 if $x<clouds><all>.WHAT.gist eq "(Any)" {
		 $res = "";
	 }
	 return $res;
}

method name() {
	my $res = $x<name>;
	if $x<name>.WHAT.gist eq "(Any)" {
		$res = "";
	}
	return $res;
}

method rain() {
	my $res = $x<rain>.values;
 if $x<rain>.values.WHAT.gist eq "(Any)" {
	 $res = "";
 }
	return $res;
}
}
