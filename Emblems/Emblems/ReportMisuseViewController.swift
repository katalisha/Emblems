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
    
    var activeField:UITextField?
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var scrollViewKeyboardScrollControl: UIScrollView!
    
//    override func viewDidLoad() {
//        let view = self.view as! UIScrollView
//        view.contentSize = CGSize(width: self.view.frame.size.width, height: 600)
//    }
    
    @IBOutlet weak var contentViewSizing: UIView!
    
    override func viewDidLoad() {
//        NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:self.contentView
//            attribute:NSLayoutAttributeLeading
//            relatedBy:0
//            toItem:self.view
//            attribute:NSLayoutAttributeLeft
//            multiplier:1.0
//            constant:0];
//        [self.view addConstraint:leftConstraint];
        let leftConstraint = NSLayoutConstraint(item: self.contentViewSizing, attribute: NSLayoutAttribute.Leading, relatedBy: .Equal, toItem: self.view, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 0)
        self.view.addConstraint(leftConstraint)
        
        let rightConstraint = NSLayoutConstraint(item: self.contentViewSizing, attribute: NSLayoutAttribute.Trailing, relatedBy: .Equal, toItem: self.view, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: 0)
        self.view.addConstraint(rightConstraint)
        
//        NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:self.contentView
//            attribute:NSLayoutAttributeTrailing
//            relatedBy:0
//            toItem:self.view
//            attribute:NSLayoutAttributeRight
//            multiplier:1.0
//            constant:0];
//        [self.view addConstraint:rightConstraint];
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardDidShow:"), name: UIKeyboardDidShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillBeHidden"), name: UIKeyboardWillHideNotification, object: nil)
    }
    
    @IBAction func textFieldDidBeginEditing(sender:UITextField) {
        self.activeField = sender;
    }
    
    @IBAction func textFieldDidEndEditing(sender:UITextField) {
        self.activeField = nil;
    }
    
//    func keyboardDidShow(notification: NSNotification) {
//        var info = notification.userInfo
//        var kbRect =
//    }
    
    
    - (void) keyboardDidShow:(NSNotification *)notification
    {
    NSDictionary* info = [notification userInfo];
    CGRect kbRect = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    kbRect = [self.view convertRect:kbRect fromView:nil];
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbRect.size.height, 0.0);
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
    
    CGRect aRect = self.view.frame;
    aRect.size.height -= kbRect.size.height;
    if (!CGRectContainsPoint(aRect, self.activeField.frame.origin) ) {
    [self.scrollView scrollRectToVisible:self.activeField.frame animated:YES];
    }
    }
    
    - (void) keyboardWillBeHidden:(NSNotification *)notification
    {
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
    }
    
    
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