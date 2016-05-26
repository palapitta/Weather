#Weather

To get weather from openweathermap

##To get free api key

goto https://home.openweathermap.org/users/sign_up , you can use a disposable email if you do not want to give your real email. Once you logged in click on api keys link.

## Usage Example

```perl6
use Weather;
my $p = Weather.new();

$p.get-weather('Delhi','a7uie........o9')  #call get-weather() before calling other functions,
					   # a7uie........o9 is an example key
					   # only first letter of name should be capital letter(eg:Delhi)

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
say $p.name;
