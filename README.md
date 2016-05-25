# Weather
To get weather from openweathermap

# Usage Example

use Weather;

my $p = Weather.new();

$p.get-weather('Delhi') # call get-weather() before calling other functions, only first letter of name should be capital letter(eg: Delhi), works without an api key

$p.get-weather('Delhi','a7uie........o9')  # call the same function with key if you have an api key, a7uie........o9 is an example key

$p.name;   

$p.temperature;

$p.humidity;

$p.pressure;

$p.cloudy;     # cloud percentage

$p.weather-description;

$p.weather-main;

$p.latitude;

$p.longitude;

$p.country;

$p.wind-speed;

$p.wind-direction;

$p.sunrise;

$p.sunset;

$p.visibility;  


my $temp = $p.temparature;

say $temp;
