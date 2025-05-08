import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:orientation_app/models/activity_session_model.dart';
import 'package:sliver_tools/sliver_tools.dart';

class ViewActivityPage extends StatelessWidget {
  const ViewActivityPage({super.key, required this.activity, this.venues});

  final ActivityModel activity;
  final List<Map<String, String>>? venues;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            snap: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                "View Activity",
              ),
              background: CachedNetworkImage(
                imageUrl:
                    ("https://play-lh.googleusercontent.com/veCVBVPE2oKRvtNxWoGaflKP3jszjdXZ-VEnFakWrWjmu2oRDmtmo1n42R-XXf2mCzmh=w416-h235"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(12),
            sliver: MultiSliver(
              children: [
                SliverPinnedHeader(
                  child: Container(
                    color: Theme.of(context).colorScheme.surface,
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      activity.title,
                      style: Theme.of(context).textTheme.headlineLarge,
                      softWrap: true,
                    ),
                  ),
                ),
                Text(
                  "From: ${activity.from.toString().split(" ")[1].substring(0, 5)} To: ${activity.to.toString().split(" ")[1].substring(0, 5)}",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, bottom: 8.0),
                  child: Text(
                    "Description",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Text(
                  activity.description,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, bottom: 8.0),
                  child: Text(
                    activity.isMultiple ? "Venues" : "Venue",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                !activity.isMultiple
                    ? Row(
                        children: [
                          const Icon(Icons.place),
                          Text(activity.venue),
                        ],
                      )
                    : SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: ListView.builder(
                          itemBuilder: (context, index) =>
                              // get the multiple venues

                              DecoratedBox(
                            decoration: BoxDecoration(
                              border: index == 0
                                  ? Border.symmetric(
                                      horizontal: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .outline,
                                      ),
                                    )
                                  : Border(
                                      bottom: BorderSide(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .outline),
                                    ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.40,
                                    child: Text(
                                      venues?[index]["title"] ?? "",
                                      softWrap: true,
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.40,
                                    child: Text(
                                      venues?[index]["venue"] ?? "",
                                      softWrap: true,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          itemCount: venues?.length ?? 0,
                        ),
                      )
              ],
            ),
          )
        ],
      ),
    );
  }
}
