// import 'package:chat_app/models/post-model.dart';
// import 'package:chat_app/modules/home/home-states.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class HomeCubit extends Cubit<HomeStates>{
//
//   HomeCubit():super(HomeInitState());
//   static HomeCubit getInstance(context)=>BlocProvider.of(context);
//
//   /*List<PostModel>posts=[];
//   getPosts(){
//     FirebaseFirestore.instance
//         .collection('posts')
//         .get()
//         .then((value) {
//          value.docs.forEach((element) {
//            posts.add(PostModel.fromJson(element.data()));
//            emit(HomeGetPostsSuccessState());
//          });
//     }).catchError((onError){
//       print('Get posts error: '+onError.toString());
//       emit(HomeGetPostsErrorState());
//     });
//   }*/
// }