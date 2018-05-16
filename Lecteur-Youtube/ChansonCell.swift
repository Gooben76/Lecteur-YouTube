//
//  ChansonCellTableViewCell.swift
//  Lecteur-Youtube
//
//  Created by Benoît Goossens on 16/05/18.
//  Copyright © 2018 Benoît Goossens. All rights reserved.
//

import UIKit

class ChansonCell: UITableViewCell {

    @IBOutlet weak var miniatureImage: UIImageView!
    @IBOutlet weak var titreEtArtisteLabel: UILabel!
    
    var chanson:Chanson!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func creerCell(_ chanson:Chanson){
        self.chanson = chanson
        titreEtArtisteLabel.text = chanson.titre
    }
}
