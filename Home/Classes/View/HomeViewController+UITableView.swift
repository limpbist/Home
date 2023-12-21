//
//  HomeViewController+UITableView.swift
//  Home
//
//  Created by Aaron Andres Gaspar Peña on 19/12/23.
//

import Foundation

extension HomeViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        homeViewModel?.animes?.count ?? 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let animeCell = self.homeTableView.dequeueReusableCell(withIdentifier: "animeCell", for: indexPath) as! AnimeCell
        
        animeCell.anime = homeViewModel?.animes?[indexPath.row]
        animeCell.setInitialData()
        animeCell.getCover()
        return animeCell
    }
}

//delegate
extension HomeViewController: UITableViewDelegate {
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let bottomEdge = scrollView.contentOffset.y + scrollView.frame.size.height;
        if (bottomEdge >= scrollView.contentSize.height) {
            print("end of table")
        }
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cellAnime = homeViewModel?.animes?[indexPath.row] else {return}
        
        if let detailsViewController = HomeViewFactory.getAnimeDetailsView(anime: cellAnime) {
            self.navigationController?.pushViewController(detailsViewController, animated: true)
        }
        print("indexPath:\(indexPath)")
    }
}
