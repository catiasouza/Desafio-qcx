//
//  ViewController.swift
//  desafio-qcx
//
//  Created by Cátia Souza on 23/07/20.
//  Copyright © 2020 Cátia Souza. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var detalhes = [List]()
       
       override func viewDidLoad() {
           super.viewDidLoad()
           parseJason{
               self.tableView.reloadData()
           }
           tableView.delegate = self
           tableView.dataSource = self
           
       }
       func parseJason(completed: @escaping () -> ()){
           let url = URL(string: "https://programming-quotes-api.herokuapp.com/quotes")
           
           URLSession.shared.dataTask(with: url!) { (data, response, error) in
               if error == nil{
                   do{
                       self.detalhes = try JSONDecoder().decode([List].self, from: data!)
                       DispatchQueue.main.async {
                           completed()
                       }
                   }catch{
                       print("ERROR")
                       error.localizedDescription
                   }
               }
           }.resume()
           
       }
    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return detalhes.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
               var lis = detalhes[indexPath.row]
               cell.textLabel?.text = detalhes[indexPath.row].en
             
               return cell
    }
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           performSegue(withIdentifier: "showDetails", sender: self)
       }
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let destination = segue.destination as? DetailsViewController{
                      destination.detalheL = detalhes[(tableView.indexPathForSelectedRow?.row)!]
                  }
       }

}
