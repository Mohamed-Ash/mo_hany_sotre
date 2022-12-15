import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m_hany_store/core/bloc/bloc/api_data_bloc.dart';
import 'package:m_hany_store/core/form_fields/button_form_feilds.dart';
import 'package:m_hany_store/core/model/admin_model.dart';
import 'package:m_hany_store/core/model/user_model.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';

class ShowUsersWidget extends StatefulWidget {
  final ApiDataBloc<UserModel> userModel;
  final ApiDataBloc<AdminModel> adminModel;
  
  const ShowUsersWidget({Key? key,required this.userModel, required this.adminModel}) : super(key: key);

  @override
  State<ShowUsersWidget> createState() => _ShowUsersWidgetState();
}

class _ShowUsersWidgetState extends State<ShowUsersWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          BlocBuilder(
              bloc: widget.userModel,
              builder: (context, state) {
                if(state is DataLoadedState){
                  return Expanded(
                    child: SingleChildScrollView(
                      physics: const ScrollPhysics(),
                      child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context ,index) => buildItemProduct(
                          userModel: state.data[index],
                          context: context,
                        ),
                        separatorBuilder: (context ,index) => const SizedBox( height: 30),
                        itemCount: state.data.length,
                      ),
                    ),
                  );
                }else if(state is DataLoadingState){
                  return  const Expanded(child: Center(child: CircularProgressIndicator(color: ColorTheme.primary),));
                }else {
                  return Expanded(child: Center(child: Text('error 404',style: getSemiBoldStyle(color: ColorTheme.wight,fontSize: 14,),)));
                }
              },//
            ),
        ],
      ),
    );
  }
   Widget buildItemProduct({
    required BuildContext context,
    required UserModel userModel,
  }){
    return InkWell(
      // onTap: ()=> Navigator.pushReplacementNamed(context, itemPage,arguments:  categoriesModel,),
      borderRadius: BorderRadius.circular(8),//context, itemPage, arguments: categoriesModel
      child: Container(
        width: double.infinity,
        height: 75,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: const Border(
            bottom: BorderSide(color: ColorTheme.porder,width: 1),
            left: BorderSide(color: ColorTheme.porder,width: 1),
            right: BorderSide(color: ColorTheme.porder,width: 1),
            top: BorderSide(color: ColorTheme.porder,width: 1),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 10,
            ),
            
            const SizedBox(width: 18,),
            Flexible(
              fit: FlexFit.tight,
              flex: 3,
              child: Text(
                userModel.email!,
                style: getSemiBoldStyle(color: ColorTheme.wight,fontSize: 13,),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: (){
                setState(() {  
                  FormFeilds.showMyDialog(
                    context: context,
                    message: 'Are you sure to add admin?',
                    actions: [
                      InkWell(
                        onTap: () async {
                          Navigator.of(context).pop();
                          setUser(userModel);
                        },
                        child: FormFeilds.buttonFormField(title: 'delete',colorButton: ColorTheme.primary),
                      ),
                    ],
                  );
                });
              }, 
              icon: FormFeilds.containerImage(assetImage: 'assets/icons/add_admin.png',height: 18,width: 18),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> setUser(UserModel userModel)async{
    try {
      AdminModel data =AdminModel(
        email: userModel.email!, 
        id: userModel.id
      );
      widget.adminModel.add(StoreDataEvent(data: data.toJson()));
    } catch (e) {
      // ignore: avoid_print
      debugPrint(e.toString());
    }
  }
}