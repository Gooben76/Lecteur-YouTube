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
        telechargerImage()
        
        let attributed = NSMutableAttributedString(string: self.chanson.titre, attributes: [.font:UIFont.boldSystemFont(ofSize: 20), .foregroundColor:UIColor.black])
        let suite = NSAttributedString(string: "\n"+self.chanson.artiste, attributes: [.font:UIFont.italicSystemFont(ofSize: 20), .foregroundColor:UIColor.darkGray])
        attributed.append(suite)
        titreEtArtisteLabel.attributedText = attributed
    }
    
    func telechargerImage(){
        miniatureImage.image = #imageLiteral(resourceName: "logo")
        
        if let url = URL(string: chanson.urlMiniature) {
            let session = URLSession.shared
            let task = session.dataTask(with: url, completionHandler: {(data, response, error) in
                if let imageData = data, let image = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        self.miniatureImage.image = image
                    }
                }
            })
            task.resume()
        }
    }
}
