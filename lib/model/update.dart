import 'dart:convert';

Updateproject updateprojectFromJson(String str) =>
    Updateproject.fromJson(json.decode(str));

String updateprojectToJson(Updateproject data) => json.encode(data.toJson());

class Updateproject {
  Updateproject({
    required this.projectname,
    required this.projectdate,
    required this.company,
    required this.catchphase,
    required this.websites,
    required this.location,
  });

  String projectname;
  String projectdate;
  String company;
  String catchphase;
  String websites;
  String location;

  Map<String, dynamic> toJson() {
    return {
      "projectname": projectname,
      "projectdate": projectdate,
      "company": company,
      "catchphase": catchphase,
      "websites": websites,
      "location": location,
    };
  }
  factory Updateproject.fromJson(Map<String, dynamic> json) => Updateproject(
        projectname: json["projectname"],
        projectdate: json["projectdate"],
        company: json["company"],
        catchphase: json["catchphase"],
        websites: json["websites"],
        location: json["location"],
      );


}
