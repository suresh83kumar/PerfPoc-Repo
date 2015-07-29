public class myweather {

    public myweather() {

    }


    public string city {get; set;}
    public string country{get; set;}
    public string response {get; set;}
    public string Location {get; set;}
    public string Time1{get; set;}
    public string Wind{get; set;}
    public string Visibility{get; set;}
    public string SkyConditions{get; set;}
    public string Temperature{get; set;}
    public string DewPoint{get; set;}
    public string RelativeHumidity{get; set;}
    public string Pressure{get; set;}
    public boolean display {get; set;}

    //public myweather(ApexPages.StandardController controller) {


    //}
public PageReference saveRoles(){

wwwWebservicexNet.GlobalWeatherSoap req = new wwwWebservicexNet.GlobalWeatherSoap();
req.endpoint_x = 'http://www.webservicex.com/globalweather.asmx';
req.timeout_x = 120000;

wwwWebservicexNet.GetWeather_element request = new wwwWebservicexNet.GetWeather_element();
request.CityName = city;
request.CountryName = country;
if(Test.isRunningTest()){
response = '<?xml version="1.0" encoding="utf-16"?> <CurrentWeather> <Location>LONDON-CORBIN AIRPORT, KY, United States (KLOZ) 37-05N 084-04W 362M</Location> <Time>Oct 16, 2012 - 06:02 AM EDT / 2012.10.16 1002 UTC</Time> <Wind> Calm:0</Wind> <Visibility> 1/4 mile(s):0</Visibility> <SkyConditions> obscured</SkyConditions> <Temperature> 37 F (3 C)</Temperature> <DewPoint> 37 F (3 C)</DewPoint> <RelativeHumidity> 100%</RelativeHumidity> <Pressure> 30.02 in. Hg (1016 hPa)</Pressure> <Status>Success</Status> </CurrentWeather>';
} else {
response = req.GetWeather(request.CityName,request.CountryName);
}
system.debug('---------->'+response);
String a = response;
integer b =a.indexof ('<Location>',0);
integer c =a.indexof ('</Location>',0);
if (b == -1) Location = 'N/A'; else Location = a.substring(b+10, c);


integer d =a.indexof ('<Time>',0);
integer e =a.indexof ('</Time>',0);
if (d == -1) Time1 = 'N/A'; else Time1 = a.substring(d+6, e);

integer f =a.indexof ('<Wind>',0);
integer g =a.indexof ('</Wind>',0);
if (f == -1) Wind = 'N/A'; else Wind = a.substring(f+6, g);

integer h =a.indexof ('<Visibility>',0);
integer i =a.indexof ('</Visibility>',0);
if (h == -1) Visibility = 'N/A'; else Visibility = a.substring(h+12, i);

integer j =a.indexof ('<SkyConditions>',0);
integer k =a.indexof ('</SkyConditions>',0);
if (j == -1) SkyConditions = 'N/A'; else SkyConditions = a.substring(j+15, k);

integer l =a.indexof ('<Temperature>',0);
integer m =a.indexof ('</Temperature>',0);
if (l == -1) Temperature = 'N/A'; else Temperature = a.substring(l+14, m);

integer n =a.indexof ('<DewPoint>',0);
integer o =a.indexof ('</DewPoint>',0);
if (n == -1) DewPoint = 'N/A'; else DewPoint = a.substring(n+10, o);

integer p =a.indexof ('<RelativeHumidity>',0);
integer q =a.indexof ('</RelativeHumidity>',0);
if (p == -1) RelativeHumidity = 'N/A'; else RelativeHumidity = a.substring(p+18, q);

integer r =a.indexof ('<Pressure>',0);
integer s =a.indexof ('</Pressure>',0);
if (r == -1) Pressure = 'N/A'; else Pressure = a.substring(r+10, s);

if (response == null) display = false; display = true;
return null;
}



}