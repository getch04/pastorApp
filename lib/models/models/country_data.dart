class Country {
  final String name;
  final String continentCode;
  final Codes codes;

  Country({
    required this.name,
    required this.continentCode,
    required this.codes,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name'],
      continentCode: json['continent_code'],
      codes: Codes.fromJson(json['codes']),
    );
  }
}

class Codes {
  final String? fips;
  final String isoA3;
  final String isoA2;

  Codes({required this.fips, required this.isoA3, required this.isoA2});

  factory Codes.fromJson(Map<String, dynamic> json) {
    return Codes(
      fips: json['fips'],
      isoA3: json['iso_a3'],
      isoA2: json['iso_a2'],
    );
  }
}

class Meta {
  final Pagination pagination;

  Meta({required this.pagination});

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      pagination: Pagination.fromJson(json['pagination']),
    );
  }
}

class Pagination {
  final int total;
  final int count;
  final int perPage;
  final int currentPage;
  final int totalPages;
  final Links links;

  Pagination({
    required this.total,
    required this.count,
    required this.perPage,
    required this.currentPage,
    required this.totalPages,
    required this.links,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      total: json['total'],
      count: json['count'],
      perPage: json['per_page'],
      currentPage: json['current_page'],
      totalPages: json['total_pages'],
      links: Links.fromJson(json['links']),
    );
  }
}

class Links {
  final String? previous;

  Links({this.previous});

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      previous: json['previous'],
    );
  }
}

class CountryData {
  final List<Country> data;
  final Meta meta;

  CountryData({required this.data, required this.meta});

  factory CountryData.fromJson(Map<String, dynamic> json) {
    var dataList = json['data'] as List;
    List<Country> countriesList =
        dataList.map((i) => Country.fromJson(i)).toList();

    return CountryData(
      data: countriesList,
      meta: Meta.fromJson(json['meta']),
    );
  }
}
