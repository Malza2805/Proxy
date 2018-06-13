//
//  AddListingViewController.swift
//  Proxy
//
//  Created by Borna Relic on 13/06/2018.
//  Copyright © 2018 ruaziosteam. All rights reserved.
//

import UIKit
import MapKit

class AddListingViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextView!
    @IBOutlet weak var addImagesButton: UIButton!
    @IBOutlet weak var locationMap: MKMapView!
    @IBOutlet weak var submitButton: UIButton!
    
    var imageData : Data?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        titleTextField.text = ""
        priceTextField.text = ""
        descriptionTextField.text = ""
        self.navigationController?.navigationBar.isHidden = false
    }
    
    func setupView() {
        addImagesButton.layer.cornerRadius = 20
        submitButton.layer.cornerRadius = 20
        descriptionTextField.layer.cornerRadius = 5
    }

    @IBAction func addImages(_ sender: Any) {
        let image = UIImagePickerController ()
        image.delegate = self
        
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        image.allowsEditing = false
        
        self.present(image, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info [UIImagePickerControllerOriginalImage] as? UIImage {
            imageData = UIImagePNGRepresentation(image)
            //nesto
        }
        else {
            print("error: image did not load")
        }
    }
    @IBAction func submit(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
