import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RedeemController extends GetxController {
  var coinBalance = "1,234".obs;

  var redeemOptions = <Map<String, dynamic>>[
    {
      "title": "Shop K-mall",
      "description": "Use coins to buy exclusive family heritage Products.",
      "buttonText": "Browse Mall",
      "imageUrl": "https://picsum.photos/id/1070/200/200",
      "isSolid": true,
      "icon": Icons.storefront,
    },
    {
      "title": "Support Families",
      "description": "Transfer coins to Support a relative.",
      "buttonText": "Send Gift",
      "imageUrl": "https://picsum.photos/id/1062/200/200",
      "isSolid": false,
      "icon": Icons.favorite_outlined,
    },
    {
      "title": "Boost Listing",
      "description": "Promote your products for higher sell.",
      "buttonText": "Promote Now",
      "imageUrl": "https://picsum.photos/id/1073/200/200",
      "isSolid": false,
      "icon": Icons.campaign_rounded,
    },
  ].obs;

  var earnOptions = <Map<String, dynamic>>[
    {
      "title": "Complete Your Profile",
      "subTitle": "Earn 60KCC",
      "icon": Icons.person_outline,
    },
    {
      "title": "Add Family Photo",
      "subTitle": "Earn 20KCC",
      "icon": Icons.camera_alt_outlined,
    },
    {
      "title": "Invite Family Member",
      "subTitle": "Earn 20KCC",
      "icon": Icons.group_add_outlined,
    },
    {
      "title": "Attend Family Event",
      "subTitle": "Earn 45KCC",
      "icon": Icons.event_available_outlined,
    },
  ].obs;
}
