// outbreak countries
class Countries
{
  int id;
  String countryName;

  Countries(this.id, this.countryName);

  static List<Countries> getCountries() {
    return <Countries>[
      Countries(0, 'Indonesia'),
      Countries(1, 'China'),
      Countries(2, 'Italy'),
      Countries(3, 'USA'),
      Countries(4, 'South Africa'),
      Countries(5, 'Zimbabwe'),
    ];
  }
}