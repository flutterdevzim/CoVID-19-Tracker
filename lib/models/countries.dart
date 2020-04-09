// outbreak countries
class Countries
{
  int id;
  String countryName;

  Countries(this.id, this.countryName);

  static List<Countries> getCountries() {
    return <Countries>[
      Countries(0, 'Zimbabwe'),
      Countries(1, 'South Africa'),
      Countries(2, 'China'),
      //Countries(3, 'Italy'),
      //Countries(4, 'France'),
    ];
  }
}