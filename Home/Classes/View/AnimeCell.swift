//
//  AnimeCell.swift
//  Home
//
//  Created by Aaron Andres Gaspar Peña on 29/11/23.
//

import UIKit
import CoreEntities
import CoreBootcamp

class AnimeCell: UITableViewCell {
    //PROPIEDAD DE LA CELDA (LABEL)
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAuthors: UILabel!
    @IBOutlet weak var lblYearAired: UILabel!
    @IBOutlet weak var imgCover: UIImageView!
    @IBOutlet weak var actIntCover: UIActivityIndicatorView!
    
    var useCase : GetAnimeCoverUseCaseProtocol?
    var viewModel : CoverViewModelProtocol?
    public var anime : Anime?
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        
        useCase = GetAnimeCoverUseCase()
        if let useCase = useCase {
            viewModel = CoverViewModel(useCase: useCase)
            viewModel?.delegate = self
        }
    }
    
    func setInitialData() {
        imgCover.image = ResourcesHelper.getImageFromBundle(imageName: "book_placeholder")
        lblTitle.text = anime?.title
        lblAuthors.text = anime?.getProducersAsCommaSeparatedList()
        lblYearAired.text = "\(anime?.year ?? 0)"
    }
    
    public func getCover() {
        if let imagesSmall = self.anime?.imagesSmall{
            viewModel?.getCover(animeOLID: imagesSmall)
        }
            
    }
}

    extension AnimeCell: AnimeCoverViewModelDelegateProtocol {
        func coverEvent(state:CoreBootcamp.ViewControllerState) {
            switch state {
            case .success:
                self.actIntCover.stopAnimating()
                self.imgCover.image = viewModel?.coverImage
            case .loading:
                self.actIntCover.startAnimating()
            case .error: print("error")
            }
    }
}
