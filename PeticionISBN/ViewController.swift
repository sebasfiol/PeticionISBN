//
//  ViewController.swift
//  PeticionISBN V2
//  Tarea Semana 2
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
/*            do {
                let json = try NSJSONSerialization.JSONObjectWithData(datos!, options: NSJSONReadingOptions.MutableLeaves)
                let dico1 = json as! NSDictionary
                let dico2 = dico1["ISBN"] as! NSDictionary
                let dico3 = dico2["title"] as! NSString as String
                let dico4 = dico3["authors"] as! NSDictionary
                self.ciudad.text = dico5["name"] as! NSString as String
                let dico6 = dico4["item"] as! NSDictionary
                let dico7 = dico6["condition"] as! NSDictionary
//                self.temperatura.text = dico7["temp"] as! NSString as String
            }
            catch _ {
                
            }
*/
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



