import 'package:apod/core/colors/colors.dart';
import 'package:apod/core/enums/media_type.dart';
import 'package:apod/features/apod/domain/entities/apod_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../viewmodel/gallery_bloc.dart';

class GalleryScreen extends StatefulWidget {
  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  List<ApodEntity> apodEntity = [];

  final galleryBloc = getIt<GalleryViewModel>();

  String _formatDate(String date) {
    List<String> parts = date.split("-");
    if (parts.length != 3) {
      throw Exception("Invalid date format. Expected yyyy-mm-dd");
    }
    int year = int.parse(parts[0]);
    int month = int.parse(parts[1]);
    int day = int.parse(parts[2]);
    String formattedDate = day.toString().padLeft(2, '0') +
        "." +
        month.toString().padLeft(2, '0') +
        "." +
        year.toString();
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Gallery',
            style: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w300,
              fontSize: 18,
            ),
          ),
          leading: GestureDetector(
            onTap: () => Navigator.of(context).pushNamed('/favourite'),
            child: Icon(
              Icons.star_outline_outlined,
              color: AppColors.white,
              size: 25,
            ),
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 12.0),
              child: GestureDetector(
                onTap: () => Navigator.of(context).pushNamed('/calendar'),
                child: Icon(
                  Icons.calendar_today_outlined,
                  color: AppColors.white,
                  size: 25,
                ),
              ),
            ),
          ],
        ),
        body: BlocProvider<GalleryViewModel>(
          create: (context) {
            galleryBloc.add(GetGalleryEvent());
            return galleryBloc;
          },
          child: BlocConsumer<GalleryViewModel, GalleryState>(
            listener: (context, state) {
              if (state is SuccessGetGalleryState) {
                setState(() {
                  apodEntity = state.apodEntities.reversed.toList();
                });
              } else if (state is FailedGetApodState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Erorr')),
                );
              }
            },
            builder: (context, state) {
              if (state is LoadingGetGalleryState) {
                return Center(child: CircularProgressIndicator());
              } else if (state is GetGalleryState) {
                return Padding(
                  padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 25.0),
                  child: ListView.builder(
                    reverse: false,
                    shrinkWrap: false,
                    itemCount: apodEntity.length,
                    itemBuilder: (context, index) {
                      final apod = apodEntity[index];
                      return Padding(
                        padding: EdgeInsets.only(top: 16.0),
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).pushNamed(
                            '/apod',
                            arguments: apod,
                          ),
                          child: Stack(
                            children: [
                              //iamge
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.network(
                                  apod.media_type == MediaType.IMAGE
                                      ? apod.url
                                      : apod.thumbnail_url,
                                  height: 120,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),

                              //date
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 8.0,
                                  left: 4.0,
                                ),
                                child: Text(
                                  _formatDate(
                                    apod.date,
                                  ),
                                  style: TextStyle(color: AppColors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else if (state is FailedGetApodState) {
                return Center(child: Text('Error'));
              } else {
                return Center(child: Text('No data'));
              }
            },
          ),
        ),
      ),
    );
  }
}
