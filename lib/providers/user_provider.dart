import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//Objects
import '../objects/suporters.dart';
import '../objects/user.dart';

class UserProvider with ChangeNotifier {
  List<User> _user = [
    User(
      name: "Ziskaee",
      userImageUrl:
          "https://wallpapers.com/images/hd/cute-anime-profile-pictures-0lifptfs0jd9fml3.jpg",
      userBannerUrl:
          "https://e1.pxfuel.com/desktop-wallpaper/432/805/desktop-wallpaper-anime-youtube-banner-posted-by-samantha-johnson-anime-red-banner.jpg",
      userCategory: "Streamer",
      userDescription:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
      userFollowers: 1.2,
      userRewards: 12,
      donationGoal: 4000,
      donationRecenved: 2600,
      userSuporters: [
        "https://i.pinimg.com/236x/74/35/7a/74357a7ec9e919acb58c1cdd2b052434.jpg",
        "https://images.saatchiart.com/saatchi/1755977/art/8291898/7356904-HSC00002-7.jpg",
        "https://image.lexica.art/full_jpg/19f280a2-2b97-4be2-b782-1fd5c70b84f4",
      ],
    ),
    User(
      name: "Nitorissa",
      userImageUrl:
          "https://thypix.com/wp-content/uploads/2021/10/anime-avatar-profile-picture-thypix-62-700x700.jpg",
      userBannerUrl:
          "https://cutewallpaper.org/25/anime-banner-wallpaper/1647124681.jpg",
      userCategory: "Streamer",
      userDescription:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
      userFollowers: 1.2,
      userRewards: 12,
      donationGoal: 4000,
      donationRecenved: 2600,
      userSuporters: [
        "https://i.pinimg.com/236x/74/35/7a/74357a7ec9e919acb58c1cdd2b052434.jpg",
        "https://images.saatchiart.com/saatchi/1755977/art/8291898/7356904-HSC00002-7.jpg",
        "https://image.lexica.art/full_jpg/19f280a2-2b97-4be2-b782-1fd5c70b84f4",
      ],
    ),
    User(
      name: "Nana",
      userImageUrl:
          "https://aniyuki.com/wp-content/uploads/2022/06/aniyuki-anime-profile-picture-1.jpg",
      userBannerUrl: "https://wallpapercave.com/wp/wp9696825.jpg",
      userCategory: "Streamer",
      userDescription:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
      userFollowers: 1.2,
      userRewards: 12,
      donationGoal: 4000,
      donationRecenved: 2600,
      userSuporters: [
        "https://i.pinimg.com/236x/74/35/7a/74357a7ec9e919acb58c1cdd2b052434.jpg",
        "https://images.saatchiart.com/saatchi/1755977/art/8291898/7356904-HSC00002-7.jpg",
        "https://image.lexica.art/full_jpg/19f280a2-2b97-4be2-b782-1fd5c70b84f4",
      ],
    ),
    User(
      name: "Amerina",
      userImageUrl:
          "https://i.pinimg.com/736x/f8/dd/7e/f8dd7e6fe9a25062c3f99912a650e0f9.jpg",
      userBannerUrl:
          "https://e0.pxfuel.com/wallpapers/983/716/desktop-wallpaper-sad-anime-banner-sad-anime-laptop.jpg",
      userCategory: "Streamer",
      userDescription:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
      userFollowers: 1.2,
      userRewards: 12,
      donationGoal: 4000,
      donationRecenved: 2600,
      userSuporters: [
        "https://i.pinimg.com/236x/74/35/7a/74357a7ec9e919acb58c1cdd2b052434.jpg",
        "https://images.saatchiart.com/saatchi/1755977/art/8291898/7356904-HSC00002-7.jpg",
        "https://image.lexica.art/full_jpg/19f280a2-2b97-4be2-b782-1fd5c70b84f4",
      ],
    ),
    User(
      name: "Dunie",
      userImageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMkzaL6a_d-UWOOmF4t-jD8cqb1hg3PSA8Fg&usqp=CAU",
      userBannerUrl:
          "https://e1.pxfuel.com/desktop-wallpaper/656/459/desktop-wallpaper-2048x1152-anime-sad-anime-banner.jpg",
      userCategory: "Streamer",
      userDescription:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
      userFollowers: 1.2,
      userRewards: 12,
      donationGoal: 4000,
      donationRecenved: 2600,
      userSuporters: [
        "https://i.pinimg.com/236x/74/35/7a/74357a7ec9e919acb58c1cdd2b052434.jpg",
        "https://images.saatchiart.com/saatchi/1755977/art/8291898/7356904-HSC00002-7.jpg",
        "https://image.lexica.art/full_jpg/19f280a2-2b97-4be2-b782-1fd5c70b84f4",
      ],
    ),
    User(
      name: "Bino",
      userImageUrl:
          "https://www.blindertech.com/wp-content/uploads/2022/07/Anime-Profile-Pictures.webp",
      userBannerUrl:
          "https://img.freepik.com/fotos-premium/pessoa-em-pe-na-frente-de-um-lago-sob-uma-lua-cheia-generativa-ai_771703-850.jpg",
      userCategory: "Streamer",
      userDescription:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
      userFollowers: 1.2,
      userRewards: 12,
      donationGoal: 4000,
      donationRecenved: 2600,
      userSuporters: [
        "https://i.pinimg.com/236x/74/35/7a/74357a7ec9e919acb58c1cdd2b052434.jpg",
        "https://images.saatchiart.com/saatchi/1755977/art/8291898/7356904-HSC00002-7.jpg",
        "https://image.lexica.art/full_jpg/19f280a2-2b97-4be2-b782-1fd5c70b84f4",
      ],
    ),
    User(
      name: "Mairie",
      userImageUrl:
          "https://i.etsystatic.com/35745892/r/il/9ee986/4020922215/il_fullxfull.4020922215_mr1h.jpg",
      userBannerUrl:
          "https://img.freepik.com/vetores-gratis/templo-japones-gradiente-em-rocha-cercada-por-agua_52683-44984.jpg",
      userCategory: "Streamer",
      userDescription:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
      userFollowers: 1.2,
      userRewards: 12,
      donationGoal: 4000,
      donationRecenved: 2600,
      userSuporters: [
        "https://i.pinimg.com/236x/74/35/7a/74357a7ec9e919acb58c1cdd2b052434.jpg",
        "https://images.saatchiart.com/saatchi/1755977/art/8291898/7356904-HSC00002-7.jpg",
        "https://image.lexica.art/full_jpg/19f280a2-2b97-4be2-b782-1fd5c70b84f4",
      ],
    ),
    User(
      name: "Viki",
      userImageUrl:
          "https://i.etsystatic.com/35745892/r/il/dc5af5/4391170904/il_570xN.4391170904_sva8.jpg",
      userBannerUrl:
          "https://images.wallpapersden.com/image/download/red-eye-anime-girl_bGVoamaUmZqaraWkpJRtZWWta2Vl.jpg",
      userCategory: "Streamer",
      userDescription:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
      userFollowers: 1.2,
      userRewards: 12,
      donationGoal: 4000,
      donationRecenved: 2600,
      userSuporters: [
        "https://i.pinimg.com/236x/74/35/7a/74357a7ec9e919acb58c1cdd2b052434.jpg",
        "https://images.saatchiart.com/saatchi/1755977/art/8291898/7356904-HSC00002-7.jpg",
        "https://image.lexica.art/full_jpg/19f280a2-2b97-4be2-b782-1fd5c70b84f4",
      ],
    ),
  ];

  List<User> get user {
    return [..._user];
  }
}
