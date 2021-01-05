import 'package:ig_ui_app/api/district_api.dart';
import 'package:ig_ui_app/model/district.dart';
import 'package:ig_ui_app/widget/enum.dart';
import 'base_controller.dart';

class DistrictController extends BaseController {
  DistrictAPI _api = DistrictAPI();
  List<District> district = [];

  getDistrictList() async {
    setState(ViewState.Busy);
    await _api.getDistrictList().then((value) => district = value);
    setState(ViewState.Retrieved);
  }
}
