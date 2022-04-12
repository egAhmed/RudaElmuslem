import 'package:flutter/material.dart';
import 'package:rudaelmoslem/utilts/sizer/sizer.dart';
import 'components/cardpdf.dart';

class SectionView extends StatefulWidget {
  final Stream? stream;

  const SectionView({Key? key, this.stream}) : super(key: key);

  @override
  _SectionViewState createState() => _SectionViewState();
}

class _SectionViewState extends State<SectionView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: StreamBuilder(
            stream: widget.stream!,//_bloc.getIslamicListStream,
            //initialData: initialData,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData || snapshot.data ==null) {
                return Center(child: CircularProgressIndicator());
              }else {
                return GridView.builder(
                  itemCount: 1,
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing:3.0.w,
                    mainAxisSpacing: 1.0.h,
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (BuildContext context,index){
                    return CardPDF(
                      pathfile:  snapshot.data![index].filename.trim(),
                    );
                  },
                );
                //return Container();
              }
            },
          ),
      ),
    );
  }
}