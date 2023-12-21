//
//  FileHelper.swift
//  Home
//
//  Created by Aaron Andres Gaspar Peña on 4/12/23.
//

import Foundation

class FileHelper {
    
    static let coverCachePath = "cover-cache"
    
    static func getCacheDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsPath = paths[0]
        let cachePath = documentsPath.appendingPathComponent(coverCachePath)
        
        if !FileManager.default.fileExists(atPath: cachePath.path) {
            do {
                try FileManager.default.createDirectory(atPath: cachePath.path, withIntermediateDirectories: true, attributes: nil)
            } catch {
                print(error.localizedDescription);
            }
        }
        return cachePath
    }
    
    static func sanite(fileName: String) -> String {
        let url = URL(string: fileName)!
        let fn = url.lastPathComponent
        return fn
    }
    static func writeDataToImageFile(data: Data, fileName: String) throws {
        try data.write(to: self.getCacheDirectory().appendingPathComponent(self.sanite(fileName: fileName)))
    }
    
    static func readImageFromFile(fileName: String) throws -> UIImage? {
        let fileURL = self.getCacheDirectory().appendingPathComponent(self.sanite(fileName: fileName))
        let imageData = try Data(contentsOf: fileURL)
        return UIImage(data: imageData)
    }
    
    static func fileExistsInCache(animeOLID: String) -> Bool {
        let fileURL = self.getCacheDirectory().appendingPathComponent(self.sanite(fileName: animeOLID))
        return FileManager.default.fileExists(atPath: fileURL.path)
    }
    
    static func clearCoversCache() -> Bool{
        do {
            let fileNames = try FileManager.default.contentsOfDirectory(atPath: getCacheDirectory().path)
            
            for fileName in fileNames {
                try FileManager.default.removeItem(atPath: self.getCacheDirectory().appendingPathComponent(fileName).path)
            }
            
            let count = try FileManager.default.contentsOfDirectory(atPath: getCacheDirectory().path).count
            if count == 0 {
                return true
            }
            return false
        } catch {
            return false
        }
    }
}
