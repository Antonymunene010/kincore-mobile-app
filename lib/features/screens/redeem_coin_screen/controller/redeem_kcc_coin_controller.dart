import 'package:flutter/material.dart';import 'package:get/get.dart';

class RedeemController extends GetxController {
  var coinBalance = "1,234".obs;

  var redeemOptions = <Map<String, dynamic>>[
    {
      "title": "redeem.option.shop.title",
      "description": "redeem.option.shop.description",
      "buttonText": "redeem.option.shop.button",
      "imageUrl": "https://picsum.photos/id/1070/200/200",
      "isSolid": true,
      "icon": Icons.storefront,
    },
    {
      "title": "redeem.option.support.title",
      "description": "redeem.option.support.description",
      "buttonText": "redeem.option.support.button",
      "imageUrl": "https://picsum.photos/id/1062/200/200",
      "isSolid": false,
      "icon": Icons.favorite_outlined,
    },
    {
      "title": "redeem.option.boost.title",
      "description": "redeem.option.boost.description",
      "buttonText": "redeem.option.boost.button",
      "imageUrl": "https://picsum.photos/id/1073/200/200",
      "isSolid": false,
      "icon": Icons.campaign_rounded,
    },
  ].obs;

  var earnOptions = <Map<String, dynamic>>[
    {
      "title": "earn.completeProfile.title",
      "subTitle": "earn.completeProfile.subtitle",
      "icon": Icons.person_outline,
    },
    {
      "title": "earn.addPhoto.title",
      "subTitle": "earn.addPhoto.subtitle",
      "icon": Icons.camera_alt_outlined,
    },
    {
      "title": "earn.inviteMember.title",
      "subTitle": "earn.inviteMember.subtitle",
      "icon": Icons.group_add_outlined,
    },
    {
      "title": "earn.attendEvent.title",
      "subTitle": "earn.attendEvent.subtitle",
      "icon": Icons.event_available_outlined,
    },
  ].obs;
}
