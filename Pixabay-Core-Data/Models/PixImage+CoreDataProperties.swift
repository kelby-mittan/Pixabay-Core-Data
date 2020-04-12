//
//  PixImage+CoreDataProperties.swift
//  Pixabay-Core-Data
//
//  Created by Kelby Mittan on 4/12/20.
//  Copyright © 2020 Kelby Mittan. All rights reserved.
//
//

import Foundation
import CoreData


extension PixImage {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PixImage> {
        return NSFetchRequest<PixImage>(entityName: "PixImage")
    }

    @NSManaged public var previewURL: String?
    @NSManaged public var userImageURL: String?
    @NSManaged public var favorites: Int32
    @NSManaged public var user: String?
    @NSManaged public var downloads: Int32
    @NSManaged public var tags: String?
    @NSManaged public var pageURL: String?
    @NSManaged public var comments: Int32
    @NSManaged public var views: Int32
    @NSManaged public var id: Int32
    @NSManaged public var likes: Int32
    @NSManaged public var largeImageURL: String?
    @NSManaged public var pixSearch: PixSearch?

}
