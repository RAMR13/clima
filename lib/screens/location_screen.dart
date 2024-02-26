import 'package:clima/screens/city_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';

WeatherModel weatherhelp = new WeatherModel();

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
  final locationweather;
  LocationScreen({required this.locationweather});
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  void initState() {
    super.initState();
    upUI(widget.locationweather);
  }

  late int tempa = 0;
  late String name = '';
  late String ico = '';
  late String mess = '';
  void upUI(dynamic weathermodeldata) {
    if (weathermodeldata == null) {
      tempa = 0;
      ico = 'Error';
      mess = 'UNABLE TO GET DATA';
      name = '';
      return;
    }
    setState(() {
      var temp = weathermodeldata['main']['temp'];
      name = weathermodeldata['name'];
      var cond = weathermodeldata['weather'][0]['id'];
      tempa = temp.round();
      mess = weatherhelp.getMessage(tempa);
      ico = weatherhelp.getWeatherIcon(cond);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.7), BlendMode.dstATop),
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      dynamic neweather = await weatherhelp.getGps();
                      upUI(neweather);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var cityname = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CityScreen();
                      }));
                      if (cityname != null) {
                        var citydata = await weatherhelp.getcityweather(
                            cityname: cityname);
                        upUI(citydata);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$tempa°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      ico,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$mess in $name!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
