//
//  ViewController.swift
//  PeticionISBN
//
//  Created by SebasFiol on 15/7/16.
//  Copyright © 2016 SebasFiol. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var numeroISBN: UITextField!
    @IBOutlet weak var detalleISBN: UITextView!
    
    @IBAction func buscarLibros(sender: AnyObject) {
        detalleISBN.text = ""
        var urls = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:"
        let isbn = numeroISBN.text!
        urls = "\(urls)\(isbn)"
        let url = NSURL(string: urls)
        let datos:NSData? = NSData(contentsOfURL: url!)
        if datos == nil {
            let alertController = UIAlertController(title: "Error", message:"Se ha producido un error de comunicación.", preferredStyle: UIAlertControllerStyle.Alert)
            
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
        } else {
        let texto = NSString(data: datos!, encoding: NSUTF8StringEncoding)!
        detalleISBN.text = String(texto)
        }
        self.view.endEditing(true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

