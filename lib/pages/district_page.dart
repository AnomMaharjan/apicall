import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ig_ui_app/controller/district_controller.dart';
import 'package:ig_ui_app/helpers/widget_builder_helper.dart';
import 'package:ig_ui_app/model/district.dart';

class DistrictPage extends StatelessWidget {
  final DistrictController _controller = Get.put(DistrictController());

  void initState() {
    _controller.getDistrictList();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      initState: (_) => initState(),
      dispose: (state) => {},
      builder: (_) {
        return Obx(
          () => WidgetBuilderHelper(
            state: _controller.state,
            onLoadingWidget: buildLoadingWidget(),
            onErrorWidget: buildErrorWidget(),
            onSuccessWidget: _buildSuccessWidget(),
          ),
        );
      },
    );
  }

  Widget buildLoadingWidget() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildErrorWidget() {
    return CircularProgressIndicator();
  }

  Widget _buildSuccessWidget() {
    final List<District> district = _controller.district;
    return new Column(
        children: new List.generate(district.length, (i) {
      return Container(
        color: Colors.amberAccent,
          padding: EdgeInsets.all(4.0),
          child: new Card(
            clipBehavior: Clip.antiAlias,
            child: GestureDetector(
                onTap: () {
                  //   Get.to(List(company[i].id));
                },
                child: ListTile(
                  title: Text(
                    "${district[i].job_heading}",
                    maxLines: 1,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: new TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: new Text(
                    "${district[i].id}",
                    maxLines: 3,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style:
                        new TextStyle(color: Color(0xFF888888), fontSize: 15.0),
                  ),
                )),
          ));
    }));
  }
}
