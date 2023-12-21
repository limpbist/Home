//
//  ResourcesHelper.swift
//  Home
//
//  Created by Aaron Andres Gaspar Peña on 10/12/23.
//

import Foundation

class ResourcesHelper {
    public static func getImageFromBundle(imageName: String) -> UIImage? {
        let moduleBundle = Bundle(for: ResourcesHelper.self)
        guard let resourcesBundleURL = moduleBundle.url(forResource: "HomeResources", withExtension: "bundle") else { return nil }
        let resourcesBundle = Bundle(url: resourcesBundleURL)
        
        let image = UIImage(named: imageName,
                            in: resourcesBundle,
                            compatibleWith: nil)
        
        return image
    }
    
}
