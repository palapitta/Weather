use JSON::Fast;
use Net::HTTP::GET;

class Weather {

my $keys = '707e2d907009ae5dfa94909f0caf11ba';
my $res;
my $x;


multi method get-weather($city) {
	my $t = "http://api.openweathermap.org/data/2.5/weather?q=$city&appid=$keys&units=metric";
	$res = Net::HTTP::GET($t);

	$x = from-json $res.content;
}

multi method get-weather($city, $key){
	my $t = "http://api.openweathermap.org/data/2.5/weather?q=$city&appid=$key&units=metric";
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
