//
//  ViewController.swift
//  desafio-qcx
//
//  Created by Cátia Souza on 23/07/20.
//  Copyright © 2020 Cátia Souza. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

   
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var rat: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var author: UILabel!
    var detalheL: List?
    override func viewDidLoad() {
        super.viewDidLoad()
       details()
    }

      func details(){
            
            author.text = detalheL?.author
            desc.text = detalheL?.en
            
            if detalheL?.rating != nil{
                rat.text = String(format: "%.1f",detalheL?.rating! as! CVarArg)
                imageView.image = #imageLiteral(resourceName: "3Stars")
            }else{
                rat.text = ""
            }
        }
     
    }


