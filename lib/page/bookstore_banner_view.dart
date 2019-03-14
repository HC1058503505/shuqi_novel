import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shuqi_novel/modle/bookstore_banner.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
class BookStoreBannerView extends StatelessWidget {
  BookStoreBannerView({this.banners});
  final List<BookStoreBanner> banners;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (banners.length == 0 || banners == null) {
      return Container();
    }
    return Container(
      color: Colors.white,
      child: CarouselSlider(
        items: banners.map((info) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin:  EdgeInsets.symmetric(horizontal: 5.0),
                child: CachedNetworkImage(imageUrl: info.image_url, fit: BoxFit.cover,),
              );
            },
          );
        }).toList(),
        viewportFraction: 0.8,
        aspectRatio: 2,
        enlargeCenterPage: true,
        autoPlay: true,
      ),
    );
// flutter-swiper 不适合嵌套到ListView中
//    return Container(
//      child: Swiper(
//        viewportFraction: 0.8,
//        scale: 0.85,
//        autoplay: true,
//        itemCount: banners.length,
//        itemBuilder: (context, index) {
//          return CachedNetworkImage(
//            imageUrl: banners[index].image_url,
//            fit: BoxFit.cover,
//          );
//        },
//      ),
//    );
  }
}