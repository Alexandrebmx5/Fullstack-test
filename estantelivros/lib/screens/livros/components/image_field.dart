import 'dart:typed_data';
import 'package:estantelivros/store/new_livro_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker_web/image_picker_web.dart';

import 'image_dialog.dart';

class ImagesField extends StatelessWidget {

  ImagesField(this.store);

  final NewLivroStore store;

  @override
  Widget build(BuildContext context) {
    void onImageSelected(MediaInfo image) {
      store.img.add(image.data);
    }

    Future<void> getFromGallery() async {
      MediaInfo imageFile = await ImagePickerWeb.getImageInfo;
      if(imageFile == null) return;
      onImageSelected(imageFile);
    }

    return Column(
      children: [
        Container(
            height: 120,
            child: Observer(
              builder: (_) {
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: store.img.length < 1 ?
                    store.img.length + 1 : 1,
                    itemBuilder: (_, index) {
                      if (index == store.img.length)
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                          child: GestureDetector(
                            onTap: getFromGallery,
                            child: Container(
                              width: 150,
                              decoration: BoxDecoration(
                                  color: Theme
                                      .of(context)
                                      .primaryColor,
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: Icon(
                                Icons.camera_alt,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      else
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                          child: GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (_) =>
                                      ImageDialog(
                                          image: store.img[index],
                                          onDelete: () =>
                                              store.img.removeAt(index)
                                      )
                              );
                            },
                            child: Container(
                                width: 150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      fit: BoxFit.contain,
                                      image: store.img[index] is Uint8List
                                          ? MemoryImage(
                                        store.img[index],
                                      ) : NetworkImage(store.img[index]),
                                    )
                                )
                            ),
                          ),
                        );
                    }
                );
              },
            )
        ),
        Observer(builder: (_) {
          if (store.imgError != null)
            return Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(color: Colors.red)
                  )
              ),
              padding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
              child: Text(
                store.imgError,
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 12
                ),
              ),
            );
          else
            return Container();
        },
        )
      ],
    );
  }
}

