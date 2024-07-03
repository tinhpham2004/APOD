import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/colors/colors.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/enums/media_type.dart';
import '../../../gallery/domain/entities/apod_entity.dart';
import '../viewModel/favourite_bloc.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<ApodEntity> apodEntity = [];

  final favouriteBloc = getIt<FavouriteViewModel>();

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
          leadingWidth: 70.0,
          leading: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.selected,
                    size: 18,
                  ),
                  Text(
                    'Back',
                    style: TextStyle(
                      color: AppColors.selected,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
          ),
          title: Text(
            'Favourite',
            style: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w300,
              fontSize: 18,
            ),
          ),
        ),
        body: BlocProvider(
          create: (context) {
            favouriteBloc.add(GetFavouriteEvent());
            return favouriteBloc;
          },
          child: BlocConsumer<FavouriteViewModel, FavouriteState>(
            listener: (context, state) {
              if (state is SuccessGetFavouriteState) {
                setState(() {
                  apodEntity = state.apodEntities;
                });
              }
              if (state is FailedGetFavouriteState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Erorr')),
                );
              }
            },
            builder: (context, state) {
              if (state is LoadingGetFavouriteState) {
                return Center(child: CircularProgressIndicator());
              } else if (state is GetFavouriteState) {
                return Padding(
                  padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 25.0),
                  child: ListView.builder(
                    reverse: true,
                    shrinkWrap: true,
                    itemCount: state.apodEntities.length,
                    itemBuilder: (context, index) {
                      final apod = state.apodEntities[index];
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
              } else if (state is FailedGetFavouriteState) {
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
