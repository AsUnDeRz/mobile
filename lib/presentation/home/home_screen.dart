import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_network/domain/bloc/home/flow_home_bloc.dart';
import 'package:social_network/internal/dependencies/application_component.dart';
import 'package:social_network/presentation/design/application_design.dart';
import 'package:social_network/presentation/design/widgets/widgets.dart';
import 'package:social_network/presentation/home/widgets/post_home/post_home_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FlowHomeBloc _flowHomeBloc = PostModule.flowHomeBloc();

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
      appBarWidget: AppBarWidget(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(),
            OutlineButton(
              color: Colors.white.withOpacity(.5),
              child: Text("All"),
              onPressed: (){},
            ),
            Spacer(),
            OutlineButton(
              color: Colors.white.withOpacity(.5),
              child: Text("Reccomendation"),
              onPressed: (){},
            ),
            Spacer(),
            OutlineButton(
              color: Colors.white.withOpacity(.5),
              child: Text("Following"),
              onPressed: (){},
            ),
            Spacer(),

          ],
        ),
      ),
      body: BlocBuilder<FlowHomeBloc, FlowHomeState>(
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
                  return PostHomeWidget(
                    imageUrl: state.listPosts[index].fileUrl,
//                    bloc: state.listBlocs[index],
                  );
                },
                itemExtent: MediaQuery.of(context).size.height,
                onItemChanged: (index){
                  if(_flowHomeBloc.state is EndPagesFlowHomeState){
                    return;
                  }
                  if(index > 1 && index%2==1){
                    _flowHomeBloc.add(NextPageFlowHomeEvent());
                  }
                }
             );

//              PageView.builder(
//              physics: BouncingScrollPhysics(),
//              scrollDirection: Axis.vertical,
//              itemCount: state.listPosts.length,
//              itemBuilder: (context, index){
//                return PostHomeWidget(
//                  imageUrl: state.listPosts[index].fileUrl,
//                  bloc: state.listBlocs[index],
//                );
//              },
//              onPageChanged: (index){
//                if(_flowHomeBloc.state is EndPagesFlowHomeState){
//                  return;
//                }
//                if(index > 1 && index%2==1){
//                  _flowHomeBloc.add(NextPageFlowHomeEvent());
//                }
//              },
//            );
          }
          return LoadersWidget.loaderPost();
        },
      ),
    );
  }
}