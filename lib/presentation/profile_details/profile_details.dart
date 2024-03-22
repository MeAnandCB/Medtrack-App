import 'package:college/box/box.dart';
import 'package:college/model/profile_model.dart';
import 'package:flutter/material.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ListView.separated(
              reverse: true,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: profileBox.length,
              itemBuilder: (context, index) {
                ProfileModel profile = profileBox.getAt(index);
                print(profile.fullname);
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      // Container(
                      //   child: Row(
                      //     children: [
                      //       Container(
                      //         height: 100,
                      //         width: 100,
                      //         decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.circular(10),
                      //             image: DecorationImage(
                      //                 image: AssetImage(profile.image),
                      //                 fit: BoxFit.cover)),
                      //       ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            profile.fullname,
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            profile.mobile,
                            style: TextStyle(
                              fontSize: 11,
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                profile.dob,
                                style: TextStyle(
                                  fontSize: 11,
                                ),
                              ),
                              SizedBox(width: 20),
                              Text(
                                profile.gender,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      Text(
                        profile.user,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                    height: 10,
                  )),
        ],
      ),
    );
  }
}
