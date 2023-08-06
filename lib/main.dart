import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import 'bindings/initial_binding.dart';
import 'controller/resume_temp_controller.dart';

void main() {
  runApp(GetMaterialApp(
    initialBinding: InitialBinding(),
    theme: ThemeData(
      useMaterial3: true,
    ),
    home: Resume(),
  ));
}

class Resume extends StatefulWidget {
  const Resume({super.key});

  @override
  State<Resume> createState() => ResumeState();
}

class ResumeState extends State<Resume> {
  var controller = Get.find<ResumeTempController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            child: Column(children: [
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 300,
                  ),
                  controller.profile_isPressed.value
                      ? Obx(
                          () => controller.profileisthere.value
                              ? Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(90),
                                      gradient: const LinearGradient(colors: [
                                        Color.fromARGB(255, 26, 153, 182),
                                        Color.fromARGB(255, 81, 215, 245),
                                      ])),
                                  child: Padding(
                                    padding: EdgeInsets.all(5),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.black,
                                      radius: 85,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: Image.network(
                                            controller.profile_url.toString()),
                                      ),
                                    ),
                                  ),
                                )
                              : SizedBox(),
                        )
                      : SizedBox(),
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    width: 550,
                    height: 150,
                    decoration: BoxDecoration(
                        border: Border.all(
                            style: BorderStyle.solid,
                            color: const Color.fromARGB(151, 123, 121, 95)),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        child: Column(children: [
                          TextField(
                            enabled: false,
                            controller: controller.name_feild,
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w200,
                                color: Colors.white),
                            decoration: InputDecoration(
                                hintText: "What's Your Name (Fetching ...)",
                                hintStyle: TextStyle(
                                    fontSize: 25,
                                    color: Color.fromARGB(146, 150, 137, 137)),
                                border: InputBorder.none),
                            cursorOpacityAnimates: true,
                            cursorRadius: Radius.circular(20),
                            cursorColor: Color.fromARGB(0, 195, 187, 187),
                          ),
                          TextField(
                            enabled: false,
                            controller: controller.description_feild,
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(171, 217, 213, 213)),
                            decoration: InputDecoration(
                                hintText: "More about ya (fetching ...)",
                                hintStyle: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(109, 150, 137, 137)),
                                isDense: true,
                                border: InputBorder.none),
                            cursorOpacityAnimates: true,
                            cursorRadius: Radius.circular(20),
                            cursorColor: Color.fromARGB(0, 195, 187, 187),
                          ),
                        ])),
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  controller.github_issues_isPressed.value
                        ?Obx(
                    () => controller.activity_fetched.value
                        ? Container(
                            height: 230,
                            width: 340,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 151, 239, 11),
                                ),
                                borderRadius: BorderRadius.circular(20),
                                gradient: const LinearGradient(colors: [
                                  Color.fromARGB(233, 87, 191, 27),
                                  Color.fromARGB(255, 141, 211, 28),
                                ])),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 0.694 /
                                      100 *
                                      MediaQuery.of(context).size.width,
                                  vertical: 1.21 /
                                      100 *
                                      MediaQuery.of(context).size.height),
                              child: Column(
                                children: [
                                  Align(
                                      alignment: Alignment.topCenter,
                                      child: Text(
                                        "Github Activity",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w200,
                                            color: Colors.white),
                                      )),
                                  //start
                                  SizedBox(
                                    height: 1.11 /
                                        100 *
                                        MediaQuery.of(context).size.height,
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 0.76 /
                                              100 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .width),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                              backgroundColor: Color.fromARGB(
                                                  88, 249, 245, 245),
                                              radius: 10,
                                              child: Icon(
                                                EvaIcons.upload_outline,
                                                size: 1.53 /
                                                    100 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .height,
                                              )),
                                          SizedBox(
                                            width: 0.38 /
                                                100 *
                                                MediaQuery.of(context)
                                                    .size
                                                    .width,
                                          ),
                                          Text(
                                              'Created ${controller.commits} commits in ${controller.record_push.length} Public ${(controller.record_push.length == 1) ? "Repo" : "Repos"}',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Rubik',
                                                  fontWeight: FontWeight.w200,
                                                  fontSize: 1.67 /
                                                      100 *
                                                      MediaQuery.of(context)
                                                          .size
                                                          .height)),
                                        ],
                                      )),
                                  SizedBox(
                                      height: 0.27 /
                                          100 *
                                          MediaQuery.of(context).size.height),
                                  Padding(
                                      padding: EdgeInsets.only(left: 24),
                                      child: Container(
                                        height: 4.17 /
                                            100 *
                                            MediaQuery.of(context).size.height,
                                        child: ListView.builder(
                                          itemCount:
                                              controller.record_push.length,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            return Column(
                                              children: [
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                      '- ${controller.push_repo_names[index]} (${controller.record_push[controller.push_repo_names[index]]})',
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              228,
                                                              244,
                                                              241,
                                                              241),
                                                          fontFamily: 'Space',
                                                          fontWeight:
                                                              FontWeight.w200,
                                                          fontSize: 1.4 /
                                                              100 *
                                                              MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height)),
                                                ),
                                                SizedBox(
                                                  height: 0.417 /
                                                      100 *
                                                      MediaQuery.of(context)
                                                          .size
                                                          .height,
                                                )
                                              ],
                                            );
                                          },
                                        ),
                                      )),
                                  SizedBox(
                                    height: 1.67 /
                                        100 *
                                        MediaQuery.of(context).size.height,
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 0.76 /
                                              100 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .width),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                              backgroundColor: Color.fromARGB(
                                                  88, 249, 245, 245),
                                              radius: 10,
                                              child: Icon(
                                                EvaIcons.book_outline,
                                                size: 1.53 /
                                                    100 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .height,
                                              )),
                                          SizedBox(
                                            width: 0.38 /
                                                100 *
                                                MediaQuery.of(context)
                                                    .size
                                                    .width,
                                          ),
                                          Text(
                                              'Created ${controller.CreateRepos.length} new Public ${(controller.CreateRepos.length == 1) ? "Repo" : "Repos"}',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Rubik',
                                                  fontWeight: FontWeight.w200,
                                                  fontSize: 1.67 /
                                                      100 *
                                                      MediaQuery.of(context)
                                                          .size
                                                          .height)),
                                        ],
                                      )),
                                  SizedBox(
                                      height: 0.27 /
                                          100 *
                                          MediaQuery.of(context).size.height),
                                  Padding(
                                      padding: EdgeInsets.only(left: 24),
                                      child: Container(
                                        height: 4.17 /
                                            100 *
                                            MediaQuery.of(context).size.height,
                                        child: ListView.builder(
                                          itemCount:
                                              controller.CreateRepos.length,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            return Column(
                                              children: [
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                      '- ${controller.CreateRepos[index]}',
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              228,
                                                              244,
                                                              241,
                                                              241),
                                                          fontFamily: 'Space',
                                                          fontWeight:
                                                              FontWeight.w200,
                                                          fontSize: 1.39 /
                                                              100 *
                                                              MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height)),
                                                ),
                                                SizedBox(
                                                  height: 0.417 /
                                                      100 *
                                                      MediaQuery.of(context)
                                                          .size
                                                          .height,
                                                )
                                              ],
                                            );
                                          },
                                        ),
                                      )),
                                  SizedBox(
                                    height: 1.5 /
                                        100 *
                                        MediaQuery.of(context).size.height,
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 0.76 /
                                              100 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .width),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                              backgroundColor: Color.fromARGB(
                                                  88, 249, 245, 245),
                                              radius: 10,
                                              child: Icon(
                                                Icons.merge_outlined,
                                                size: 1.53 /
                                                    100 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .height,
                                              )),
                                          SizedBox(
                                            width: 0.38 /
                                                100 *
                                                MediaQuery.of(context)
                                                    .size
                                                    .width,
                                          ),
                                          Text(
                                              'Interacted with ${controller.pr_issue_num} Issues/PRs',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Rubik',
                                                  fontWeight: FontWeight.w200,
                                                  fontSize: 1.67 /
                                                      100 *
                                                      MediaQuery.of(context)
                                                          .size
                                                          .height)),
                                        ],
                                      )),
                                ],
                              ),
                            ),
                          )
                        : SizedBox(child: Center(child: Text("Loading ..."),),),
                  ):SizedBox(),
                  SizedBox(
                    width: 60,
                  ),
                 controller.Vercel_isPressed.value? Obx(
                    () => controller.vercel_fetched.value
                        ? Container(
                            height: 230,
                            width: 340,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color.fromARGB(255, 5, 252, 190),
                                ),
                                borderRadius: BorderRadius.circular(20),
                                gradient: const LinearGradient(colors: [
                                  Color.fromARGB(255, 17, 244, 187),
                                  Color.fromARGB(255, 30, 167, 133),
                                ])),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 0.766 /
                                      100 *
                                      MediaQuery.of(context).size.width,
                                  vertical: 1.4 /
                                      100 *
                                      MediaQuery.of(context).size.height),
                              child: Column(
                                children: [
                                  Align(
                                      alignment: Alignment.topCenter,
                                      child: Text(
                                        "Vercel",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Nunito',
                                            color: Colors.white),
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 0.38 /
                                              100 *
                                              MediaQuery.of(context).size.width,
                                          right: 0.38 /
                                              100 *
                                              MediaQuery.of(context).size.width,
                                          top: 1.11 /
                                              100 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .height),
                                      child: Align(
                                        alignment: Alignment.topCenter,
                                        child: Container(
                                          height: 18.1 /
                                              100 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .height,
                                          child: ListView.builder(
                                            itemCount:
                                                controller.projects.length,
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 0.76 /
                                                        100 *
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width),
                                                child: Column(
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10)),
                                                            color:
                                                                Color.fromARGB(
                                                                    88,
                                                                    249,
                                                                    245,
                                                                    245),
                                                          ),
                                                          child: Padding(
                                                            padding: EdgeInsets.symmetric(
                                                                horizontal: 0.76 /
                                                                    100 *
                                                                    MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width,
                                                                vertical: 0.69 /
                                                                    100 *
                                                                    MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height),
                                                            child:
                                                                SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                  children: [
                                                                    Text(
                                                                      controller
                                                                              .projects[index]
                                                                          [
                                                                          'name'],
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontFamily:
                                                                              'RobotoMono',
                                                                          fontSize:
                                                                              13,
                                                                          fontWeight:
                                                                              FontWeight.w300),
                                                                    ),
                                                                    SizedBox(
                                                                      width: 10,
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        InkWell(
                                                                          borderRadius:
                                                                              BorderRadius.circular(20),
                                                                          onTap:
                                                                              () {
                                                                            var uri =
                                                                                'https://${controller.projects[index]['link']['type']}.com/${controller.projects[index]['link']['org']}/${controller.projects[index]['link']['repo']}';
                                                                            print(uri);
                                                                            launchUrl(Uri.parse(uri));
                                                                          },
                                                                          child:
                                                                              CircleAvatar(
                                                                            backgroundColor: Color.fromARGB(
                                                                                56,
                                                                                238,
                                                                                235,
                                                                                235),
                                                                            child:
                                                                                Icon(
                                                                              EvaIcons.github,
                                                                              size: 2.22 / 100 * MediaQuery.of(context).size.height,
                                                                              color: Color.fromARGB(210, 242, 242, 242),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                            width:
                                                                                1),
                                                                        InkWell(
                                                                          borderRadius:
                                                                              BorderRadius.circular(20),
                                                                          onTap:
                                                                              () {
                                                                            print("yo");
                                                                            var uri =
                                                                                'https://${controller.projects[index]['latestDeployments'][0]['alias'][0]}';
                                                                            print(uri);
                                                                            launchUrl(Uri.parse(uri));
                                                                          },
                                                                          child:
                                                                              CircleAvatar(
                                                                            backgroundColor: Color.fromARGB(
                                                                                56,
                                                                                238,
                                                                                235,
                                                                                235),
                                                                            child:
                                                                                Icon(
                                                                              EvaIcons.globe,
                                                                              size: 2.22 / 100 * MediaQuery.of(context).size.height,
                                                                              color: Color.fromARGB(203, 255, 254, 254),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    )
                                                                  ]),
                                                            ),
                                                          ),
                                                          width: 26.05 /
                                                              100 *
                                                              MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width,
                                                          height: 4.87 /
                                                              100 *
                                                              MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height,
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 1.67 /
                                                          100 *
                                                          MediaQuery.of(context)
                                                              .size
                                                              .height,
                                                    )
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          )
                        : SizedBox(child: Center(child: Text("Loading ..."),),),
                  ):SizedBox(),
                  SizedBox(
                    width: 60,
                  ),
                  Container(
                    height: 230,
                    width: 340,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 251, 9, 251),
                        ),
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(colors: [
                          Color.fromARGB(223, 184, 22, 202),
                          Color.fromARGB(255, 242, 67, 242),
                        ])),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                "Let's Connect",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Nunito',
                                    color: Colors.white),
                              )),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 2.43 /
                                    100 *
                                    MediaQuery.of(context).size.width,
                              ),
                              Icon(
                                Icons.email_rounded,
                                color: Color.fromARGB(140, 255, 255, 255),
                                size: 2.1924 /
                                    100 *
                                    MediaQuery.of(context).size.height,
                              ),
                              SizedBox(
                                width: 0.95 /
                                    100 *
                                    MediaQuery.of(context).size.width,
                              ),
                              SizedBox(
                                width: 15.97 /
                                    100 *
                                    MediaQuery.of(context).size.width,
                                child: TextField(
                                  enabled: false,
                                  controller: controller.email_feild,
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w200,
                                      fontSize: 1.584 /
                                          100 *
                                          MediaQuery.of(context).size.height,
                                      color:
                                          Color.fromARGB(223, 237, 232, 232)),
                                  decoration: InputDecoration(
                                      hintText: "Email",
                                      hintStyle: TextStyle(
                                          fontSize: 1.584 /
                                              100 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .height,
                                          color: Color.fromARGB(
                                              167, 199, 193, 193)),
                                      isDense: true,
                                      border: InputBorder.none),
                                  cursorOpacityAnimates: true,
                                  cursorWidth: 0.138 /
                                      100 *
                                      MediaQuery.of(context).size.width,
                                  cursorHeight: 1.58 /
                                      100 *
                                      MediaQuery.of(context).size.height,
                                  cursorRadius: Radius.circular(20),
                                  cursorColor: Color.fromARGB(0, 195, 187, 187),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height:
                                1.4 / 100 * MediaQuery.of(context).size.height,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 2.43 /
                                    100 *
                                    MediaQuery.of(context).size.width,
                              ),
                              Icon(
                                FontAwesomeIcons.github,
                                color: Color.fromARGB(140, 255, 255, 255),
                                size: 2.1924 /
                                    100 *
                                    MediaQuery.of(context).size.height,
                              ),
                              SizedBox(
                                width: 0.95 /
                                    100 *
                                    MediaQuery.of(context).size.width,
                              ),
                              SizedBox(
                                width: 15.97 /
                                    100 *
                                    MediaQuery.of(context).size.width,
                                child: TextField(
                                  enabled: false,
                                  controller: controller.github_unme_feild,
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w200,
                                      fontSize: 1.584 /
                                          100 *
                                          MediaQuery.of(context).size.height,
                                      color:
                                          Color.fromARGB(223, 237, 232, 232)),
                                  decoration: InputDecoration(
                                      hintText: "Github",
                                      hintStyle: TextStyle(
                                          fontSize: 1.584 /
                                              100 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .height,
                                          color: Color.fromARGB(
                                              167, 199, 193, 193)),
                                      isDense: true,
                                      border: InputBorder.none),
                                  cursorOpacityAnimates: true,
                                  cursorWidth: 0.138 /
                                      100 *
                                      MediaQuery.of(context).size.width,
                                  cursorHeight: 1.58 /
                                      100 *
                                      MediaQuery.of(context).size.height,
                                  cursorRadius: Radius.circular(20),
                                  cursorColor: Color.fromARGB(0, 195, 187, 187),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height:
                                1.4 / 100 * MediaQuery.of(context).size.height,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 2.43 /
                                    100 *
                                    MediaQuery.of(context).size.width,
                              ),
                              Icon(
                                FontAwesomeIcons.twitter,
                                color: Color.fromARGB(140, 255, 255, 255),
                                size: 2.1924 /
                                    100 *
                                    MediaQuery.of(context).size.height,
                              ),
                              SizedBox(
                                width: 0.95 /
                                    100 *
                                    MediaQuery.of(context).size.width,
                              ),
                              SizedBox(
                                width: 15.97 /
                                    100 *
                                    MediaQuery.of(context).size.width,
                                child: TextField(
                                  enabled: false,
                                  controller: controller.twitter_unme,
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w200,
                                      fontSize: 1.584 /
                                          100 *
                                          MediaQuery.of(context).size.height,
                                      color:
                                          Color.fromARGB(223, 237, 232, 232)),
                                  decoration: InputDecoration(
                                      hintText: "Twitter",
                                      hintStyle: TextStyle(
                                          fontSize: 1.584 /
                                              100 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .height,
                                          color: Color.fromARGB(
                                              167, 199, 193, 193)),
                                      isDense: true,
                                      border: InputBorder.none),
                                  cursorOpacityAnimates: true,
                                  cursorWidth: 0.138 /
                                      100 *
                                      MediaQuery.of(context).size.width,
                                  cursorHeight: 1.58 /
                                      100 *
                                      MediaQuery.of(context).size.height,
                                  cursorRadius: Radius.circular(20),
                                  cursorColor: Color.fromARGB(0, 195, 187, 187),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height:
                                1.4 / 100 * MediaQuery.of(context).size.height,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 2.43 /
                                    100 *
                                    MediaQuery.of(context).size.width,
                              ),
                              Icon(
                                FontAwesomeIcons.linkedin,
                                color: Color.fromARGB(140, 255, 255, 255),
                                size: 2.1924 /
                                    100 *
                                    MediaQuery.of(context).size.height,
                              ),
                              SizedBox(
                                width: 0.95 /
                                    100 *
                                    MediaQuery.of(context).size.width,
                              ),
                              SizedBox(
                                width: 15.97 /
                                    100 *
                                    MediaQuery.of(context).size.width,
                                child: TextField(
                                  enabled: false,
                                  controller: controller.linkedIn_unme,
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w200,
                                      fontSize: 1.584 /
                                          100 *
                                          MediaQuery.of(context).size.height,
                                      color:
                                          Color.fromARGB(223, 237, 232, 232)),
                                  decoration: InputDecoration(
                                      hintText: "Linkedin",
                                      hintStyle: TextStyle(
                                          fontSize: 1.584 /
                                              100 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .height,
                                          color: Color.fromARGB(
                                              167, 199, 193, 193)),
                                      isDense: true,
                                      border: InputBorder.none),
                                  cursorOpacityAnimates: true,
                                  cursorWidth: 0.138 /
                                      100 *
                                      MediaQuery.of(context).size.width,
                                  cursorHeight: 1.58 /
                                      100 *
                                      MediaQuery.of(context).size.height,
                                  cursorRadius: Radius.circular(20),
                                  cursorColor: Color.fromARGB(0, 195, 187, 187),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              controller.github_chart_isPressed.value?Obx(
                () => controller.map_fetched.value
                    ? Container(
                        height: 220,
                        width: 1300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(colors: const [
                              Color.fromARGB(92, 98, 96, 96),
                              Color.fromARGB(54, 77, 74, 74),
                              Color.fromARGB(92, 98, 96, 96),
                            ])),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 0.76 /
                                  100 *
                                  MediaQuery.of(context).size.width,
                              right: 1.53 /
                                  100 *
                                  MediaQuery.of(context).size.width,
                              bottom: 0.83 /
                                  100 *
                                  MediaQuery.of(context).size.height),
                          child: HeatMap(
                            colorMode: ColorMode.opacity,
                            colorsets: {
                              1: const Color.fromARGB(255, 255, 153, 0)
                            },
                            size: 20.8,
                            startDate: DateTime(
                                DateTime.now().year,
                                DateTime.now().month - 10,
                                DateTime.now().day - 7),
                            showColorTip: false,
                            datasets: controller.impressions,
                            onClick: (value) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(value.toString())));
                            },
                            scrollable: true,
                          ),
                        ))
                    : SizedBox(child: Center(child: Text("Loading ..."),),),
              ):SizedBox(),
            ]),
          ),
        ),
      ),
    );
  }
}
