import 'package:project/models/city.dart';

class CityVm{
  List<City> loadAllCities(){
    return [
      City(name: 'Sana', value: 'SA'),
      City(name: 'Hadramout', value: 'HA'),
      City(name: 'Taiz', value: 'TA'),
      City(name: 'Shabwa', value: 'SH'),
    ];
  }
}