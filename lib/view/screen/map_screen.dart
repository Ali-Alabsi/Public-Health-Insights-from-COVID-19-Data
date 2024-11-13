import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../model/data_model.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late Future<List<dynamic>> countryData;

  @override
  void initState() {
    super.initState();
    countryData = ApiService().fetchData();
  }

  void _onTap(LatLng latLng) async{
    // String country = await getCountryFromLatLng(latLng.latitude, latLng.longitude);

    String country = await _getCountryFromLatLng(latLng);
    print(country);
    // String country = CountryService().getCountryFromLatLng(latLng);
    showDialog(
      context: context,
      builder: (context) => FutureBuilder<List<dynamic>>(
        future: countryData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return AlertDialog(
              title: Text('Error'),
              content: Text(snapshot.error.toString()),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          } else if (snapshot.hasData) {
            var data = snapshot.data!.where((item) => item['location'] == country).toList();
            return AlertDialog(
              title: Text('Data'),
              content: Container(
                width: double.maxFinite,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Date: ${data[index]['date']}'),
                      subtitle: Text(
                          'Total Cases: ${data[index]['total_cases']}\nTotal Deaths: ${data[index]['total_deaths']}\nTotal Vaccinations: ${data[index]['total_vaccinations']}'),
                    );
                  },
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          } else {
            return AlertDialog(
              title: Text('No Data'),
              content: Text('No data available for this country'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  String _getCountryFromLatLng(LatLng latLng) {
    if (latLng.latitude > 40 && latLng.latitude < 50 && latLng.longitude > -130 && latLng.longitude < -60) {
      return 'USA';
    } else if (latLng.latitude > 50 && latLng.latitude < 60 && latLng.longitude > -140 && latLng.longitude < -60) {
      return 'Canada';
    } else if (latLng.latitude > 10 && latLng.latitude < 30 && latLng.longitude > -120 && latLng.longitude < -80) {
      return 'Mexico';
    } else if (latLng.latitude > -35 && latLng.latitude < -10 && latLng.longitude > 140 && latLng.longitude < 155) {
      return 'Australia';
    } else if (latLng.latitude > -55 && latLng.latitude < -25 && latLng.longitude > -75 && latLng.longitude < -55) {
      return 'Argentina';
    } else if (latLng.latitude > 35 && latLng.latitude < 42 && latLng.longitude > -9 && latLng.longitude < 3) {
      return 'Spain';
    } else if (latLng.latitude > 40 && latLng.latitude < 45 && latLng.longitude > 20 && latLng.longitude < 30) {
      return 'Ukraine';
    } else if (latLng.latitude > 35 && latLng.latitude < 45 && latLng.longitude > 5 && latLng.longitude < 15) {
      return 'Italy';
    } else if (latLng.latitude > 46 && latLng.latitude < 52 && latLng.longitude > 13 && latLng.longitude < 22) {
      return 'Poland';
    } else if (latLng.latitude > 35 && latLng.latitude < 42 && latLng.longitude > 125 && latLng.longitude < 130) {
      return 'South Korea';
    } else if (latLng.latitude > 20 && latLng.latitude < 30 && latLng.longitude > 70 && latLng.longitude < 90) {
      return 'India';
    } else if (latLng.latitude > -25 && latLng.latitude < -10 && latLng.longitude > -50 && latLng.longitude < -40) {
      return 'Brazil';
    } else if (latLng.latitude > 50 && latLng.latitude < 60 && latLng.longitude > 10 && latLng.longitude < 20) {
      return 'Sweden';
    } else if (latLng.latitude > -40 && latLng.latitude < -30 && latLng.longitude > 115 && latLng.longitude < 125) {
      return 'New Zealand';
    } else if (latLng.latitude > 45 && latLng.latitude < 50 && latLng.longitude > 5 && latLng.longitude < 15) {
      return 'Germany';
    } else if (latLng.latitude > 35 && latLng.latitude < 37 && latLng.longitude > -10 && latLng.longitude < -5) {
      return 'Morocco';
    } else if (latLng.latitude > -30 && latLng.latitude < -20 && latLng.longitude > 20 && latLng.longitude < 30) {
      return 'South Africa';
    } else if (latLng.latitude > 30 && latLng.latitude < 35 && latLng.longitude > 30 && latLng.longitude < 35) {
      return 'Israel';
    } else if (latLng.latitude > -5 && latLng.latitude < 10 && latLng.longitude > 105 && latLng.longitude < 115) {
      return 'Indonesia';
    } else if (latLng.latitude > 45 && latLng.latitude < 55 && latLng.longitude > -10 && latLng.longitude < 5) {
      return 'United Kingdom';
    } else if (latLng.latitude > 40 && latLng.latitude < 45 && latLng.longitude > -8 && latLng.longitude < -6) {
      return 'Portugal';
    } else if (latLng.latitude > 20 && latLng.latitude < 25 && latLng.longitude > 80 && latLng.longitude < 90) {
      return 'Bangladesh';
    } else if (latLng.latitude > -15 && latLng.latitude < -5 && latLng.longitude > 25 && latLng.longitude < 35) {
      return 'Zambia';
    } else if (latLng.latitude > 24 && latLng.latitude < 30 && latLng.longitude > 46 && latLng.longitude < 56) {
      return 'Saudi Arabia';
    } else if (latLng.latitude > 50 && latLng.latitude < 55 && latLng.longitude > 5 && latLng.longitude < 10) {
      return 'Netherlands';
    } else if (latLng.latitude > 50 && latLng.latitude < 55 && latLng.longitude > 10 && latLng.longitude < 15) {
      return 'Denmark';
    } else if (latLng.latitude > -35 && latLng.latitude < -30 && latLng.longitude > 140 && latLng.longitude < 145) {
      return 'Australia';
    } else if (latLng.latitude > 13 && latLng.latitude < 15 && latLng.longitude > 100 && latLng.longitude < 105) {
      return 'Thailand';
    } else if (latLng.latitude > 16  && latLng.longitude > 34 && latLng.latitude < 20 && latLng.longitude < 54) {
      return 'Yemen';
    }
    return 'Unknown';
  }






  String getCountryFromLatLng(double latitude, double longitude) {
    if (latitude > 24.396308 && latitude < 49.384358 && longitude > -125.0 && longitude < -66.93457) {
      return 'USA';
    } else if (latitude > 49.0 && latitude < 60.0 && longitude > -140.0 && longitude < -60.0) {
      return 'Canada';
    } else if (latitude > 14.0 && latitude < 33.0 && longitude > 68.0 && longitude < 97.0) {
      return 'India';
    } else if (latitude > -26.0 && latitude < -10.0 && longitude > -56.0 && longitude < -35.0) {
      return 'Brazil';
    } else if (latitude > 35.0 && latitude < 42.0 && longitude > -10.0 && longitude < 4.0) {
      return 'Spain';
    } else if (latitude > 35.0 && latitude < 47.0 && longitude > 5.0 && longitude < 15.0) {
      return 'Italy';
    } else if (latitude > 35.0 && latitude < 42.0 && longitude > 125.0 && longitude < 130.0) {
      return 'South Korea';
    } else if (latitude > -40.0 && latitude < -33.0 && longitude > 140.0 && longitude < 154.0) {
      return 'Australia';
    } else if (latitude > 13.0 && latitude < 19.0 && longitude > 100.0 && longitude < 105.0) {
      return 'Thailand';
    } else if (latitude > -35.0 && latitude < -25.0 && longitude > 18.0 && longitude < 35.0) {
      return 'South Africa';
    } else if (latitude > 30.0 && latitude < 35.0 && longitude > 34.0 && longitude < 36.0) {
      return 'Israel';
    } else if (latitude > 41.0 && latitude < 43.0 && longitude > -9.0 && longitude < -6.0) {
      return 'Portugal';
    } else if (latitude > 10.0 && latitude < 20.0 && longitude > -90.0 && longitude < -85.0) {
      return 'Mexico';
    } else if (latitude > 47.0 && latitude < 55.0 && longitude > -10.0 && longitude < 3.0) {
      return 'United Kingdom';
    } else if (latitude > 45.0 && latitude < 50.0 && longitude > 5.0 && longitude < 15.0) {
      return 'Germany';
    } else if (latitude > -35.0 && latitude < -30.0 && longitude > 140.0 && longitude < 145.0) {
      return 'Australia';
    }

    // البرازيل
    else if (latitude > -33.0 && latitude < 5.3 && longitude > -74.0 && longitude < -34.8) {
      return 'Brazil';
    }
    // الأرجنتين
    else if (latitude > -55.0 && latitude < -22.0 && longitude > -73.5 && longitude < -53.5) {
      return 'Argentina';
    }
    // تشيلي
    else if (latitude > -56.0 && latitude < -17.5 && longitude > -75.0 && longitude < -66.0) {
      return 'Chile';
    }
    // بوليفيا
    else if (latitude > -23.0 && latitude < -9.7 && longitude > -69.6 && longitude < -57.5) {
      return 'Bolivia';
    }
    // بيرو
    else if (latitude > -18.3 && latitude < 0.0 && longitude > -81.3 && longitude < -68.6) {
      return 'Peru';
    }
    // كولومبيا
    else if (latitude > -4.2 && latitude < 12.5 && longitude > -79.0 && longitude < -66.8) {
      return 'Colombia';
    }
    // فنزويلا
    else if (latitude > 0.5 && latitude < 12.3 && longitude > -73.5 && longitude < -59.8) {
      return 'Venezuela';
    }
    // الإكوادور
    else if (latitude > -4.9 && latitude < 1.5 && longitude > -81.0 && longitude < -75.2) {
      return 'Ecuador';
    }
    // باراغواي
    else if (latitude > -27.6 && latitude < -19.2 && longitude > -62.6 && longitude < -54.3) {
      return 'Paraguay';
    }
    // الأوروغواي
    else if (latitude > -35.0 && latitude < -30.1 && longitude > -58.5 && longitude < -53.0) {
      return 'Uruguay';
    }
    // غيانا
    else if (latitude > 1.0 && latitude < 8.5 && longitude > -61.4 && longitude < -56.4) {
      return 'Guyana';
    }
    // سورينام
    else if (latitude > 1.8 && latitude < 6.0 && longitude > -58.1 && longitude < -53.9) {
      return 'Suriname';
    }
    // غيانا الفرنسية (إقليم فرنسي)
    else if (latitude > 2.1 && latitude < 5.8 && longitude > -54.6 && longitude < -51.6) {
      return 'French Guiana';
    }

    // الصين
    else if (latitude >= 18.0 && latitude <= 53.5 && longitude >= 73.5 && longitude <= 135.0) {
      return 'China';
    }
    // الهند
    else if (latitude >= 6.5 && latitude <= 35.0 && longitude >= 68.0 && longitude <= 97.0) {
      return 'India';
    }
    // اليابان
    else if (latitude >= 24.0 && latitude <= 45.5 && longitude >= 122.0 && longitude <= 153.0) {
      return 'Japan';
    }
    // إندونيسيا
    else if (latitude >= -11.0 && latitude <= 6.0 && longitude >= 95.0 && longitude <= 141.0) {
      return 'Indonesia';
    }
    // باكستان
    else if (latitude >= 23.5 && latitude <= 37.0 && longitude >= 60.9 && longitude <= 77.0) {
      return 'Pakistan';
    }
    // بنغلاديش
    else if (latitude >= 20.5 && latitude <= 26.6 && longitude >= 88.0 && longitude <= 92.5) {
      return 'Bangladesh';
    }
    // فيتنام
    else if (latitude >= 8.0 && latitude <= 23.5 && longitude >= 102.0 && longitude <= 109.5) {
      return 'Vietnam';
    }
    // الفلبين
    else if (latitude >= 5.0 && latitude <= 19.5 && longitude >= 117.0 && longitude <= 126.5) {
      return 'Philippines';
    }
    // كوريا الجنوبية
    else if (latitude >= 33.0 && latitude <= 38.5 && longitude >= 126.0 && longitude <= 129.5) {
      return 'South Korea';
    }
    // كوريا الشمالية
    else if (latitude >= 37.5 && latitude <= 43.0 && longitude >= 124.0 && longitude <= 130.7) {
      return 'North Korea';
    }
    // تايلاند
    else if (latitude >= 5.6 && latitude <= 20.5 && longitude >= 97.3 && longitude <= 105.7) {
      return 'Thailand';
    }
    // تركيا
    else if (latitude >= 36.0 && latitude <= 42.1 && longitude >= 26.0 && longitude <= 45.0) {
      return 'Turkey';
    }
    // إيران
    else if (latitude >= 25.0 && latitude <= 39.5 && longitude >= 44.0 && longitude <= 63.3) {
      return 'Iran';
    }
    // السعودية
    else if (latitude >= 16.0 && latitude <= 32.1 && longitude >= 34.5 && longitude <= 55.7) {
      return 'Saudi Arabia';
    }
    // اليمن
    else if (latitude >= 12.0 && latitude <= 18.9 && longitude >= 42.0 && longitude <= 54.5) {
      return 'Yemen';
    }
    // العراق
    else if (latitude >= 29.0 && latitude <= 37.5 && longitude >= 38.8 && longitude <= 48.6) {
      return 'Iraq';
    }
    // أفغانستان
    else if (latitude >= 29.0 && latitude <= 38.5 && longitude >= 60.5 && longitude <= 74.9) {
      return 'Afghanistan';
    }
    // نيبال
    else if (latitude >= 26.0 && latitude <= 30.5 && longitude >= 80.0 && longitude <= 88.2) {
      return 'Nepal';
    }
    // ميانمار
    else if (latitude >= 9.5 && latitude <= 28.5 && longitude >= 92.2 && longitude <= 101.1) {
      return 'Myanmar';
    }
    // سريلانكا
    else if (latitude >= 5.9 && latitude <= 10.0 && longitude >= 79.6 && longitude <= 81.9) {
      return 'Sri Lanka';
    }
    // ماليزيا
    else if (latitude >= 1.0 && latitude <= 7.5 && longitude >= 100.0 && longitude <= 119.5) {
      return 'Malaysia';
    }
    // الإمارات
    else if (latitude >= 22.6 && latitude <= 26.5 && longitude >= 51.5 && longitude <= 56.5) {
      return 'United Arab Emirates';
    }
    // أوزبكستان
    else if (latitude >= 37.0 && latitude <= 45.5 && longitude >= 55.0 && longitude <= 73.0) {
      return 'Uzbekistan';
    }
    // كازاخستان
    else if (latitude >= 40.6 && latitude <= 55.4 && longitude >= 46.5 && longitude <= 87.3) {
      return 'Kazakhstan';
    }
    // سنغافورة
    else if (latitude >= 1.2 && latitude <= 1.5 && longitude >= 103.6 && longitude <= 104.1) {
      return 'Singapore';
    }
    // الأردن
    else if (latitude >= 29.0 && latitude <= 33.4 && longitude >= 34.9 && longitude <= 39.3) {
      return 'Jordan';
    }
    // لبنان
    else if (latitude >= 33.0 && latitude <= 34.7 && longitude >= 35.1 && longitude <= 36.6) {
      return 'Lebanon';
    }
    // فلسطين
    else if (latitude >= 31.3 && latitude <= 32.6 && longitude >= 34.2 && longitude <= 35.6) {
      return 'Palestine';
    }
    // الكويت
    else if (latitude >= 28.5 && latitude <= 30.1 && longitude >= 46.5 && longitude <= 48.4) {
      return 'Kuwait';
    }
    // قطر
    else if (latitude >= 24.5 && latitude <= 26.2 && longitude >= 50.6 && longitude <= 51.7) {
      return 'Qatar';
    }
    // البحرين
    else if (latitude >= 25.5 && latitude <= 26.3 && longitude >= 50.4 && longitude <= 50.8) {
      return 'Bahrain';
    }
    // سلطنة عمان
    else if (latitude >= 16.5 && latitude <= 26.4 && longitude >= 52.0 && longitude <= 59.9) {
      return 'Oman';
    }


    // أستراليا
    else if (latitude >= -43.7 && latitude <= -10.0 && longitude >= 113.0 && longitude <= 153.5) {
      return 'Australia';
    }
    // نيوزيلندا
    else if (latitude >= -47.0 && latitude <= -34.5 && longitude >= 166.0 && longitude <= 179.0) {
      return 'New Zealand';
    }
    // الولايات المتحدة الأمريكية
    else if (latitude >= 24.5 && latitude <= 49.5 && longitude >= -125.0 && longitude <= -66.9) {
      return 'United States';
    }
    // كندا
    else if (latitude >= 41.5 && latitude <= 83.0 && longitude >= -141.0 && longitude <= -52.0) {
      return 'Canada';
    }
    // المكسيك
    else if (latitude >= 14.5 && latitude <= 33.7 && longitude >= -118.0 && longitude <= -86.0) {
      return 'Mexico';
    }
    // البرازيل
    else if (latitude >= -33.7 && latitude <= 5.3 && longitude >= -74.0 && longitude <= -34.0) {
      return 'Brazil';
    }
    // الأرجنتين
    else if (latitude >= -55.0 && latitude <= -22.0 && longitude >= -73.5 && longitude <= -53.0) {
      return 'Argentina';
    }
    // تشيلي
    else if (latitude >= -56.0 && latitude <= -17.5 && longitude >= -75.5 && longitude <= -66.5) {
      return 'Chile';
    }
    // بيرو
    else if (latitude >= -18.0 && latitude <= 0.0 && longitude >= -81.5 && longitude <= -68.0) {
      return 'Peru';
    }
    // كولومبيا
    else if (latitude >= 12.0 && latitude <= 4.0 && longitude >= -79.0 && longitude <= -66.0) {
      return 'Colombia';
    }
    // فنزويلا
    else if (latitude >= 0.6 && latitude <= 12.0 && longitude >= -73.5 && longitude <= -59.0) {
      return 'Venezuela';
    }
    // إسبانيا
    else if (latitude >= 36.0 && latitude <= 43.0 && longitude >= -9.0 && longitude <= 4.0) {
      return 'Spain';
    }
    // فرنسا
    else if (latitude >= 41.0 && latitude <= 51.5 && longitude >= -5.0 && longitude <= 9.5) {
      return 'France';
    }
    // ألمانيا
    else if (latitude >= 47.0 && latitude <= 55.0 && longitude >= 5.5 && longitude <= 15.5) {
      return 'Germany';
    }
    // المملكة المتحدة
    else if (latitude >= 49.0 && latitude <= 59.0 && longitude >= -8.0 && longitude <= 2.5) {
      return 'United Kingdom';
    }
    // إيطاليا
    else if (latitude >= 36.0 && latitude <= 47.0 && longitude >= 6.0 && longitude <= 18.0) {
      return 'Italy';
    }
    // السويد
    else if (latitude >= 55.5 && latitude <= 69.0 && longitude >= 10.0 && longitude <= 24.0) {
      return 'Sweden';
    }
    // سويسرا
    else if (latitude >= 45.5 && latitude <= 47.5 && longitude >= 5.9 && longitude <= 10.5) {
      return 'Switzerland';
    }
    // النرويج
    else if (latitude >= 57.0 && latitude <= 71.0 && longitude >= 4.0 && longitude <= 31.5) {
      return 'Norway';
    }
    // هولندا
    else if (latitude >= 50.5 && latitude <= 53.7 && longitude >= 3.3 && longitude <= 7.2) {
      return 'Netherlands';
    }
    // بلجيكا
    else if (latitude >= 49.5 && latitude <= 51.5 && longitude >= 3.3 && longitude <= 6.5) {
      return 'Belgium';
    }
    // البرتغال
    else if (latitude >= 32.5 && latitude <= 42.0 && longitude >= -9.5 && longitude <= -6.0) {
      return 'Portugal';
    }
    // الدنمارك
    else if (latitude >= 54.5 && latitude <= 58.0 && longitude >= 8.0 && longitude <= 15.0) {
      return 'Denmark';
    }
    // النمسا
    else if (latitude >= 47.5 && latitude <= 49.0 && longitude >= 9.5 && longitude <= 16.0) {
      return 'Austria';
    }
    // أيرلندا
    else if (latitude >= 51.0 && latitude <= 55.0 && longitude >= -9.5 && longitude <= -5.5) {
      return 'Ireland';
    }
    // بولندا
    else if (latitude >= 49.0 && latitude <= 55.5 && longitude >= 14.5 && longitude <= 24.5) {
      return 'Poland';
    }
    // هولندا
    else if (latitude >= 50.5 && latitude <= 53.7 && longitude >= 3.3 && longitude <= 7.2) {
      return 'Netherlands';
    }
    // كرواتيا
    else if (latitude >= 42.5 && latitude <= 46.5 && longitude >= 13.5 && longitude <= 20.5) {
      return 'Croatia';
    }
    // اليونان
    else if (latitude >= 35.5 && latitude <= 41.5 && longitude >= 19.0 && longitude <= 28.0) {
      return 'Greece';
    }
    // تركيا
    else if (latitude >= 36.0 && latitude <= 42.0 && longitude >= 26.0 && longitude <= 45.0) {
      return 'Turkey';
    }
    // أيسلندا
    else if (latitude >= 63.5 && latitude <= 66.5 && longitude >= -23.5 && longitude <= -13.5) {
      return 'Iceland';
    }
    // رومانيا
    else if (latitude >= 44.5 && latitude <= 48.0 && longitude >= 20.5 && longitude <= 30.0) {
      return 'Romania';
    }
    // فنلندا
    else if (latitude >= 60.0 && latitude <= 70.0 && longitude >= 20.0 && longitude <= 32.0) {
      return 'Finland';
    }
    // جمهورية التشيك
    else if (latitude >= 49.0 && latitude <= 51.5 && longitude >= 12.5 && longitude <= 18.5) {
      return 'Czech Republic';
    }

    // يمكنك إضافة المزيد من البلدان هنا
    else {
      return 'Unknown';
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MAP', style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),),
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(20.0, 0.0),
          zoom: 2.0,
          onTap: _onTap,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
          ),
        ],
      ),
    );
  }
}