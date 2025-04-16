import 'package:drivox/core/colors/app_colors.dart';
import 'package:drivox/core/text/app_text.dart';
import 'package:drivox/screens/home/settings.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatefulWidget {
  final Function(String) onSearch;

  const HomeAppBar({super.key, required this.onSearch});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      floating: true,
      expandedHeight: 230,
      backgroundColor: Colors.transparent,
      flexibleSpace: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(60),
          bottomRight: Radius.circular(60),
        ),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColors.gradient1, AppColors.gradient2, AppColors.gradient3],
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.settings, color: AppColors.white, size: 30),
                          onPressed: () {
                            Navigator.pushNamed(context, Settings.routeName);
                          },
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Text(
                          AppText.welcome,
                          style: TextStyle(fontSize: 30, color: AppColors.white),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Text(
                          AppText.appBarText,
                          style: TextStyle(fontSize: 15, color: AppColors.white),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: searchController,
                            cursorColor: AppColors.gradient3,
                            decoration: InputDecoration(
                              hintText: AppText.searchHintText,
                              prefixIcon: const Icon(Icons.search),
                              filled: true,
                              fillColor: AppColors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(color: AppColors.textFormField),
                              ),
                              enabledBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(color: AppColors.textFormField),
                              ),
                              focusedBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(color: AppColors.textFormField),
                              ),
                            ),
                            onChanged: widget.onSearch, // Calls the search function in HomeScreen
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
