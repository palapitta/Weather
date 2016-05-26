#Weather

To get weather from openweathermap

##To get free api key

goto https://home.openweathermap.org/users/sign_up , you can use a disposable email if you do not want to give your real email. Once you logged in click on api keys .

## Usage Example

```perl6
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

<<<<<<< HEAD
my $temp = $p.temparature;
=======

my $temp = $p.temperature;

>>>>>>> a3cc320d54035f10a572b6d8e5beafd3a1c29959
say $temp;
say $p.name;
