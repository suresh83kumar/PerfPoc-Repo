@IsTest

Public Class TestWeather {

public static testmethod void mytest() {
PageReference PG = Page.myweather;
Test.setCurrentPage(PG);

myweather wet = new myweather();
wet.city = 'London';
wet.saveRoles();
wwwWebservicexNet net = new wwwWebservicexNet();
}
}