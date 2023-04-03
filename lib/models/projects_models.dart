// To parse this JSON data, do
//
//     final projectsModel = projectsModelFromJson(jsonString);

import 'dart:convert';

List<ProjectsModel> projectsModelFromJson(String str) => List<ProjectsModel>.from(json.decode(str).map((x) => ProjectsModel.fromJson(x)));

String projectsModelToJson(List<ProjectsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProjectsModel {
    ProjectsModel({
        required this.projectName,
        required this.banner,
        required this.images,
        required this.description,
        required this.tags,
        required this.githubLink,
        required this.livePreview,
        
    });

    String projectName;
    String banner;
    String images;
    String description;
    String tags;
    String githubLink;
    String livePreview;

    factory ProjectsModel.fromJson(Map<String, dynamic> json) => ProjectsModel(
        projectName: json["project name"],
        banner: json["banner"],
        images: json["images"],
        description: json["description"],
        tags: json["tags"],
        githubLink: json["github link"],
        livePreview: json["live preview"],
    );

    Map<String, dynamic> toJson() => {
        "project name": projectName,
        "banner": banner,
        "images": images,
        "description": description,
        "tags": tags,
        "github link": githubLink,
        "live preview": livePreview,
    };
}
