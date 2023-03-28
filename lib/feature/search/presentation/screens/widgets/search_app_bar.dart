import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/resources/app_strings.dart';
import '../../../../../core/resources/assets_manger.dart';
import '../../../../../core/resources/value_manger.dart';
import '../../../domain/entity/search_request_entity.dart';
import '../../controller/search_bloc.dart';

class SearchAppBar extends StatelessWidget with PreferredSizeWidget {
  SearchAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.25,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: AppSize.s10),
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              return GestureDetector(
                  onTap: () {
                    context.read<SearchBloc>().add(
                          SearchPhotoEvent(
                            SearchRequestEntity(
                              query: context
                                  .read<SearchBloc>()
                                  .searchController
                                  .text,
                            ),
                          ),
                        );
                  },
                  child: SvgPicture.asset(
                    IconAssets.search,
                    height: 25.0,
                    width: 25.0,
                  ));
            },
          ),
        )
      ],
      title: SizedBox(
        height: 40,
        child: TextField(
          decoration: InputDecoration(
            hintText: AppStrings.search,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppSize.s20,
            ),
          ),
          controller: context.read<SearchBloc>().searchController,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
