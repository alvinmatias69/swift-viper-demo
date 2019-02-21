//
//  DetailView.swift
//  MovieDB
//
//  Created by Matias Alvin on 04/02/19.
//  Copyright © 2019 Matias Alvin. All rights reserved.
//

import UIKit

class DetailView: UIViewController {
    var presenter: DetailPresenterProtocol!
    
    @IBOutlet weak var BackButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func pressBack(_ sender: Any) {
        self.resetToList()
    }
    
}

extension DetailView: DetailViewProtocol {
    func resetToList() {
        self.presenter.resetToList()
    }
    
    func updateMovieDescription(movie: DetailResp) {
        
    }
}
