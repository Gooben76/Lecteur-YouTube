//
//  VideoController.swift
//  Lecteur-Youtube
//
//  Created by Benoît Goossens on 17/05/18.
//  Copyright © 2018 Benoît Goossens. All rights reserved.
//

import UIKit

class VideoController: UIViewController {

    var chanson:Chanson?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if chanson != nil{
            title = chanson?.titre
        }
        view.backgroundColor = .blue
    }


}
