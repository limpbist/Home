//
//  HomeViewBuilder.swift
//  Home
//
//  Created by Aaron Andres Gaspar Peña on 22/11/23.
//
import UIKit
import CoreEntities

public class HomeViewFactory {
    
    static let moduleBundle = Bundle(for: HomeViewFactory.self)
    
    public static func getFirstView() -> UIViewController? {
        guard let homeViewController = UIStoryboard.init(name: "Home", bundle: moduleBundle).instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController else { return nil }
        return homeViewController
    }
    
    static func getAnimeDetailsView(anime: Anime) -> UIViewController? {
        guard let animeDetailsViewController = UIStoryboard.init(name: "Home", bundle: moduleBundle).instantiateViewController(withIdentifier: "AnimeDetailsViewController") as? AnimeDetailsViewController else { return nil }
        
        let detailsViewModel = AnimeDetailsViewModel(anime: anime)
        animeDetailsViewController.animeDetailsViewModel = detailsViewModel
        
        let coverUserCase = GetAnimeCoverUseCase()
        let coverViewModel = CoverViewModel(useCase: coverUserCase)
        animeDetailsViewController.animeCoverViewModel = coverViewModel
        
        return animeDetailsViewController
    }
}
