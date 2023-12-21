//
//  AnimeDetailsViewController.swift
//  Home
//
//  Created by Aaron Andres Gaspar Peña on 19/12/23.
//

import Foundation
import CoreBootcamp

public class AnimeDetailsViewController:UIViewController {
    
    @IBOutlet weak var actIndCover: UIActivityIndicatorView!

    @IBOutlet weak var imgCover: UIImageView!
    
    @IBOutlet weak var actIndSynopsis: UIActivityIndicatorView!

    @IBOutlet weak var txtViewSynopsis: UITextView!

    var animeDetailsViewModel: AnimeDetailsViewModelProtocol?
    var animeCoverViewModel: CoverViewModelProtocol?
    
    public override func viewDidLoad() {
        print("On viewDidLoad")
        print(animeDetailsViewModel?.anime)
        if let animeID = animeDetailsViewModel?.anime.imagesLarge {
            animeCoverViewModel?.delegate = self
            animeCoverViewModel?.getCover(animeOLID: animeID)
            
            animeDetailsViewModel?.delegate = self
            self.txtViewSynopsis.text = animeDetailsViewModel?.anime.synopsis
            //animeDetailsViewModel?.anime.title = self.lblSynopsis.text
        }
    }
}

extension AnimeDetailsViewController: AnimeCoverViewModelDelegateProtocol {
    func coverEvent(state: CoreBootcamp.ViewControllerState) {
        switch state {
        case .success:
            self.actIndCover.stopAnimating()
            self.imgCover.image = animeCoverViewModel?.coverImage
        case .loading:
            self.actIndCover.startAnimating()
        case .error:
            self.imgCover.image = ResourcesHelper.getImageFromBundle(imageName: "book_placeholder")
            self.actIndCover.stopAnimating()
        }
    }
}

extension AnimeDetailsViewController: AnimeDetailsViewModelDelegateProtocol {
    func detailsEvent(state: CoreBootcamp.ViewControllerState) {
        switch state {
        case .success:
            self.actIndSynopsis.stopAnimating()
            self.txtViewSynopsis.text = animeDetailsViewModel?.anime.title
        case .loading:
            self.actIndSynopsis.startAnimating()
        case .error:
            self.txtViewSynopsis.text = "No Description"
            self.actIndSynopsis.stopAnimating()
        }
    }
}
