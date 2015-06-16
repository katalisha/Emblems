//
//  ReportMisuseViewController.swift
//  Emblems
//
//  Created by Adam Corcoran on 2/06/2015.
//  Copyright (c) 2015 Australian Red Cross. All rights reserved.
//

import Foundation
import UIKit
import MobileCoreServices

class ReportMisuseViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
//    override func viewDidLoad() {
//        let view = self.view as! UIScrollView
//        view.contentSize = CGSize(width: self.view.frame.size.width, height: 600)
//    }
    
    
//    func makeRoomForImage() {
//        var extraHeight: CGFloat = 0
//        if imageView.image?.aspectRatio > 0 {
//            if let width = imageView.superview?.frame.size.width {
//                let height = width / imageView.image!.aspectRatio
//                extraHeight = height - imageView.frame.height
//                imageView.frame = CGRect(x: 0, y: 0, width: width, height: height)
//            }
//        }
//        else {
//            extraHeight = -imageView.frame.height
//            imageView.frame = CGRectZero
//        }
//        preferredContentSize = CGSize(width: preferredContentSize.width, height: preferredContentSize.height + extraHeight)
//    }
    
    @IBAction func takePhoto() {
        if
            UIImagePickerController.isSourceTypeAvailable(.Camera) {
                let picker = UIImagePickerController()
                picker.sourceType = .Camera
                picker.mediaTypes = [kUTTypeImage]
                picker.delegate = self
                picker.allowsEditing = true
                presentViewController(picker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        var image = info[UIImagePickerControllerEditedImage] as? UIImage
        if image == nil {
            image = info[UIImagePickerControllerOriginalImage] as? UIImage
        }
        imageView.image = image
        //makeRoomForImage()
       dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}

extension UIImage {
    var aspectRatio: CGFloat {
        return size.height != 0 ? size.width / size.height : 0
    }
}