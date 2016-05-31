use JSON::Fast;
use Net::HTTP::GET;

class Weather {

has Str $!apikey;
my $res;
my $x;

submethod BUILD(Str :$!apikey) { }

method get-weather($city) {
	my $u = trim($city);
	my $ci = tclc($u);
	my $t = "http://api.openweathermap.org/data/2.5/weather?q=$ci&appid=$!apikey&units=metric";
	$res = Net::HTTP::GET($t);

	$x = from-json $res.content;
}

method weather-description() {
		$x<weather>[0]<description>;
}

method weather-main() {
	 $x<weather>[0]<main>;
}

method wind-speed() {
	 $x<wind><speed>;
}

method wind-direction() {
	 $x<wind><deg>;
}

method humidity() {
	 $x<main><humidity>;
}

method pressure() {
	 $x<main><pressure>;
}

method temperature() {
	 $x<main><temp>;
}

method longitude() {
	 $x<coord><lon>;
}

method latitude() {
	 $x<coord><lat>;
}

method country() {
	 $x<sys><country>;
}

method sunrise() {
	 $x<sys><sunrise>;
}

method sunset() {
	 $x<sys><sunset>;
}

method visibility() {
	 $x<visibility>;
}

method cloudy() {
	 $x<clouds><all>; # maybe cloud percentage;
}

method name() {
	$x<name>;
}
}
