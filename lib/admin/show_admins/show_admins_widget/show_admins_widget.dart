import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m_hany_store/core/bloc/bloc/api_data_bloc.dart';
import 'package:m_hany_store/core/form_fields/button_form_feilds.dart';
import 'package:m_hany_store/core/model/admin_model.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';

class ShowAdminsWidget extends StatefulWidget {
  final ApiDataBloc<AdminModel> adminModel;

  const ShowAdminsWidget({Key? key, required this.adminModel}) : super(key: key);

  @override
  State<ShowAdminsWidget> createState() => _ShowAdminsWidgetState();
}

class _ShowAdminsWidgetState extends State<ShowAdminsWidget> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          BlocBuilder(
              bloc: widget.adminModel,
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
                          adminModel: state.data[index],
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
    required AdminModel adminModel,
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
                adminModel.email,
                style: getSemiBoldStyle(color: ColorTheme.wight,fontSize: 13,),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: (){
                setState(() {  
                  FormFeilds.deleteMessage(
                    context, 
                    'Are you sure to delete?',
                    InkWell(
                      onTap: () async {
                        Navigator.of(context).pop();
                        widget.adminModel.add(DeleteDataEvent(id: adminModel.id,));
                      },
                      child: FormFeilds.buttonFormField(title: 'delete',colorButton: ColorTheme.primary),
                    ),
                  );
                });
              }, 
              icon: FormFeilds.containerImage(assetImage: 'assets/images/delete.png',height: 18,width: 18),
            ),
          ],
        ),
      ),
    );
  }
}