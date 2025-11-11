import 'package:blshop/modules/detail/model/detail_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReviewImageWidget extends StatelessWidget {
  const ReviewImageWidget({
    super.key,
    required this.item,
  });

  final DetailModel item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
            items: List.generate(item.mediaGallery!.length, (index) {
              final media = item.mediaGallery?[index];
              return media == null ?
              SizedBox()
                  :
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: InkWell(
                  onTap: () {},
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    color: Colors.white,
                    margin: EdgeInsets.all(0),
                    child: CachedNetworkImage(
                      imageUrl: media.url!,
                    ),
                  ),
                ),
              );
            },),
            options: CarouselOptions(
              height: 300,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 10),
              viewportFraction: 1,
              disableCenter: true,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) {
              },)
        ),
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(item.mediaGallery!.length, (index) {
                final media = item.mediaGallery?[index];
                return media == null ?
                SizedBox()
                    :
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: InkWell(
                    onTap: () {},
                    child: Card(
                      color: Colors.white,
                      child: CachedNetworkImage(
                        imageUrl: media.url!,
                        width: 90,
                      ),
                    ),
                  ),
                );
              },),
            ),
          ),
        ),
      ],
    );
  }
}