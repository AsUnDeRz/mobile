import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snappable/snappable.dart';

import 'package:social_network/domain/bloc/home/flow_home_bloc.dart';
import 'package:social_network/domain/bloc/home/footer_description_post_bloc.dart';
import 'package:social_network/domain/bloc/home/header_description_post_bloc.dart';
import 'package:social_network/internal/dependencies/application_component.dart';
import 'package:social_network/presentation/design/application_design.dart';
import 'package:social_network/presentation/design/widgets/widgets.dart';
import 'package:social_network/presentation/home/widgets/post_home/post_home_widget.dart';
import 'package:social_network/presentation/main/widgets/navigation_menu/custom_navigation_widget.dart';

import '../design/application_design.dart';
import '../main/widgets/navigation_menu/icon_navigation_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FlowHomeBloc _flowHomeBloc = PostModule.flowHomeBloc();
  final key = GlobalKey<SnappableState>();


  @override
  void initState() {
    _flowHomeBloc.add(InitFlowHomeEvent());
    super.initState();
  }

  @override
  void dispose() {
    _flowHomeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
//      appBarWidget: AppBarWidget(
//        child: Row(
//          crossAxisAlignment: CrossAxisAlignment.center,
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Spacer(),
//            CustomNavigationWidget(
//              widget:  Text("All"),
//              onPressed: (){},
//            ),
//
//            Spacer(),
//            CustomNavigationWidget(
//              widget:  Padding(
//                padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                child: Text("Reccomendation"),
//              ),
//              onPressed: (){},
//            ),
//
//            Spacer(),
//            CustomNavigationWidget(
//              widget: Text("Following"),
//              onPressed: (){},
//            ),
//            Spacer(),
//
//          ],
//        ),
//      ),
      body: Stack(
        children: <Widget>[
          BlocBuilder<FlowHomeBloc, FlowHomeState>(
            bloc: _flowHomeBloc,
            condition: (current, next){
              if(next is EndPagesFlowHomeState){
                return false;
              }

              return true;
            },
            builder: (context, state){
              if(state is RefreshFlowHomeState){
                return SnappingListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: state.listPosts.length - 1,
                    itemBuilder: (context, index){
                      if(index == 0) {
                        return Container(
                          child: Snappable(
                            duration: Duration(seconds: 1),
                            key: key,
                            child: PostHomeWidget(
                              imageUrl: state.listPosts[index].fileUrl,
                              bloc: state.listBlocs[index],
                            ),
                          ),
                        );
                      }
                      return PostHomeWidget(
                        imageUrl: state.listPosts[index].fileUrl,
                        bloc: state.listBlocs[index],
                      );
                    },
                    itemExtent: MediaQuery.of(context).size.height,
                    onItemChanged: (index){
                      if(_flowHomeBloc.state is EndPagesFlowHomeState){
                        return;
                      }
                      if(index > state.listPosts.length - _flowHomeBloc.perPage/2){
                        _flowHomeBloc.add(NextPageFlowHomeEvent());
                      }
                      _flowHomeBloc.headerDescriptionPostBloc.add(UpdateHeaderDescriptionPostEvent(_flowHomeBloc.listPosts[index]));
                      _flowHomeBloc.footerDescriptionPostBloc.add(UpdateFooterDescriptionPostEvent(_flowHomeBloc.listPosts[index]));
                    }
                 );
              }
              return LoadersWidget.loaderPost();
            },
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).viewPadding.top,
              color: Colors.black.withOpacity(.2),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).viewPadding.top,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.black.withOpacity(.2),
              child: BlocBuilder<HeaderDescriptionPostBloc, HeaderDescriptionPostState>(
                bloc: _flowHomeBloc.headerDescriptionPostBloc,
                builder: (context, state) {
                  if(state is RefreshHeaderDescriptionPostState){
                    return ExpandablePanel(
                      key: ValueKey(state.post.id),
                      header: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("${state.post.creator.username}"),
                            Text("${state.post.date.day}.${state.post.date.month}.${state.post.date.year}"),
                          ],
                        ),
                      ),
                      collapsed: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("${state.post.description}", softWrap: true, maxLines: 1, overflow: TextOverflow.ellipsis,),
                      ),
                      expanded: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("${state.post.description}"),
                      ),
                      tapHeaderToExpand: true,
                      tapBodyToCollapse: true,
                      hasIcon: false,
                      theme: ExpandableThemeData(
                          iconPlacement: ExpandablePanelIconPlacement.left
                      ),
                    );
                  }

                  return Container();
                }
              ),
            ),
          ),
          Positioned(
            bottom: 56,
            left: 0,
            right: 0,
            child: Container(
              height: 56,
              padding: EdgeInsets.symmetric(
                  vertical: 6
              ),
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.2)
              ),
              child: BlocBuilder<FooterDescriptionPostBloc, FooterDescriptionPostState>(
                  bloc: _flowHomeBloc.footerDescriptionPostBloc,
                  builder: (context, state) {
                    if(state is RefreshFooterDescriptionPostState){
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          IconNavigationWidget(
                            icon: Icons.favorite_border,
                            label: "${FormatUtil.formatStatistic(state.post.likesAmount.toDouble())}",
                            onPressed: (){},
                          ),
                          CustomNavigationWidget(
                            widget: CircleAvatarWidget(
                              avatarUrl: state.post.creator.avatar,
                              radius: 22,
                            ),
                            onPressed: (){},
                          ),
                          IconNavigationWidget(
                            icon: Icons.share,
                            label: "${FormatUtil.formatStatistic(state.post.sharesAmount.toDouble())}",
                            onPressed: (){},
                          ),
                        ],
                      );
                    }

                    return Container();
                  }
              ),
            ),
          )
        ],
      ),
    );
  }
}