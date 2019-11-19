//
//  ImagePicker.swift
//  KindCer
//
//  Created by Muhammad Tafani Rabbani on 19/11/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import Foundation
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {

    @Binding var isShown: Bool
    @Binding var uiImage: UIImage?
    @ObservedObject var userModel : UserModel
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

        @Binding var isShown: Bool
        @Binding var uiImage: UIImage?
        @ObservedObject var userModel : UserModel
        
        init(isShown: Binding<Bool>, uiImage: Binding<UIImage?>,userModel:UserModel) {
            
            _isShown = isShown
            _uiImage = uiImage
            self.userModel = userModel
        }

        func imagePickerController(_ picker: UIImagePickerController,
                                   didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let imagePicked = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            
            let imageData = uiImage!.jpegData(compressionQuality: 1.0)
            if !(imageData==nil) {
               userModel.updatePhoto(photo: imageData!)
            }
            uiImage = imagePicked
            isShown = false
            
            
            
            
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            isShown = false
        }

    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(isShown: $isShown, uiImage: $uiImage,userModel: userModel)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController,
                                context: UIViewControllerRepresentableContext<ImagePicker>) {

    }

}
