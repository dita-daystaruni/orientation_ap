import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
              title: Text(
                activity.title,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(12),
            sliver: MultiSliver(
              children: [
                ListTile(
                  leading: const Icon(Icons.timer),
                  title: Text(
                    "From ${DateFormat('hh:mm a').format(activity.from)} • To • ${DateFormat('hh:mm a').format(activity.to)} ",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
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
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            sliver: activity.isMultiple
                ? SliverList.builder(
                    itemBuilder: (context, index) => Container(
                      decoration: BoxDecoration(
                        border: index == 0
                            ? Border.symmetric(
                                horizontal: BorderSide(
                                  color: Theme.of(context).colorScheme.outline,
                                ),
                              )
                            : Border(
                                bottom: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.outline),
                              ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.40,
                              child: Text(
                                venues?[index]["title"] ?? "",
                                softWrap: true,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.40,
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
                  )
                : SliverToBoxAdapter(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green[900],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        textColor: Colors.white,
                        iconColor: Colors.white,
                        title: Text(activity.venue),
                        leading: const Icon(Icons.location_on),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
