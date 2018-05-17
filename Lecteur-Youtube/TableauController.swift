//
//  TableauController.swift
//  Lecteur-Youtube
//
//  Created by Benoît Goossens on 16/05/18.
//  Copyright © 2018 Benoît Goossens. All rights reserved.
//

import UIKit

class TableauController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableauControlleur: UITableView!
    
    var chansons = [Chanson]()
    let cellIdentifier = "ChansonCell"
    let identifiantSegue = "VersVideo"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableauControlleur.delegate = self
        tableauControlleur.dataSource = self
        title = "Mes vidéos préférées"
        chargeChansons()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chansons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let chanson = chansons[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ChansonCell {
            cell.creerCell(chanson)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chanson = chansons[indexPath.row]
        performSegue(withIdentifier: identifiantSegue, sender: chanson)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == identifiantSegue {
            if let nouveauControlleur = segue.destination as? VideoController{
                nouveauControlleur.chanson = sender as? Chanson
            }
        }
    }

    func chargeChansons(){
        chansons = [Chanson]()
        let video1 = Chanson(artiste: "Maître GIMS", titre: "Caméléon", code: "Gcrs5VN9Lgk")
        chansons.append(video1)
        let video2 = Chanson(artiste: "Maître GIMS", titre: "La Même", code: "fC6YV65JJ6g")
        chansons.append(video2)
        let video3 = Chanson(artiste: "Maître GIMS", titre: "Sapés comme jamais", code: "4bPGxLxogvw")
        chansons.append(video3)
        let video4 = Chanson(artiste: "Maître GIMS", titre: "J'me tire", code: "F_rEHfLgdcY")
        chansons.append(video4)
        let video5 = Chanson(artiste: "Maître GIMS", titre: "Tu vas me manquer", code: "KA3Q1duzwaE")
        chansons.append(video5)
        let video6 = Chanson(artiste: "Sexion d'Assaut", titre: "Avant qu'elle parte", code: "lN2ozTZNJC0")
        chansons.append(video6)
        let video7 = Chanson(artiste: "Sexion d'Assaut", titre: "Ma direction", code: "Y7-vP7TnluY")
        chansons.append(video7)
        
        tableauControlleur.reloadData()
    }
}
