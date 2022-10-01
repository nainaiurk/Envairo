# inEarth - ENVAIRO
inEarth uses temporal data of CO2 concentration to forecast the future concentration of carbon emission. The prediction was conducted using three machine learning algorithms which include ‘Naïve Seasonal Model’, ‘Linear regression’ and ‘TCN Model’. This methodology was conducted for other data including Air Pollution Index, Sea Level Rise and Increase in global temperature. With this forecasting, this app can graphically visualize the future conditions of a country and global conditions. The visualization enables the user to know the urgency of the climate conditions and habitable risks in a user-friendly method. To make a suitable estimation of actions to counter negative climate conditions inEarth works with the vegetation coverage of a country based on Normalized Difference Vegetation Index (NDVI) data and predict the required number of greeneries to mitigate the climate issue. The NDVI data will be used to measure current forestry and the number of greeneries in certain locations from imaging. Inspired by Carlson et al. we processed the data using ‘supervised classification’ to remove clouds and terrain effects [9]. The pixels identifying the steep slope are removed to run the prediction for flat regions. As our solution influences responsible consumption and maintenance of strict government laws inEarth will predict vehicular emissions from spatial data using ‘Spatiotemporal Graph Convolution Multifusion Network (ST-MFGCN)’ to measure current trend of carbon emissions inspired by Zhenyi Xu et al. [10]. Analysis of quantitative greeneries and vehicular emissions the application provides an estimation of necessary actions that should be taken like carbon tax required tree plantation etc.

## Getting Started

The webapp url is 
```
https://nainaiurk.github.io/inEarthWeb/#/
```


## How to Use 

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/naiaiurk/Envairo.git
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies: 

```
flutter pub get 
```

**Step 3:**

Run and Build the project in web browser(Chrome/Edge): 

```
flutter run 
```


  ## Key Features:

* Homepage
* Worldmap
* Graphs
* Google Sheet Database

### Up-Coming Features:

* 3D Globe
* Show Climate data using gps location

### Important Libraries & Tools Used

* [Syncfusion Flutter Charts](https://pub.dev/packages/syncfusion_flutter_charts)
* [Syncfusion Flutter Maps](https://pub.dev/packages/syncfusion_flutter_maps)
* [Google Sheets](https://pub.dev/packages/gsheets)

### Main

This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.

```dart
import 'package:envairo/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          color: Color.fromARGB(255, 63, 243, 156),
          titleTextStyle: TextStyle(color: Colors.white)
        ),
        primaryTextTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.white)
        ),
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.white)
        )
      ),
      home: const HomePage(),
    );
  }
}
```

## Machine Learning Model

Checkout [wiki](https://github.com/zubairehman/flutter-boilerplate-project/wiki) for more info

## Conclusion

I will be happy to answer any questions that you may have on this approach, and if you want to lend a hand with the boilerplate then please feel free to submit an issue and/or pull request 🙂

Again to note, this is example can appear as over-architectured for what it is - but it is an example only. If you liked my work, don’t forget to ⭐ star the repo to show your support.

