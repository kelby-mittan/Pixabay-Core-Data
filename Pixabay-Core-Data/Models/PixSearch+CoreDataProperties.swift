//
//  PixSearch+CoreDataProperties.swift
//  Pixabay-Core-Data
//
//  Created by Kelby Mittan on 4/12/20.
//  Copyright © 2020 Kelby Mittan. All rights reserved.
//
//

import Foundation
import CoreData


extension PixSearch {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PixSearch> {
        return NSFetchRequest<PixSearch>(entityName: "PixSearch")
    }

    @NSManaged public var hits: Data?
    @NSManaged public var pixImages: NSSet?

}

// MARK: Generated accessors for pixImages
extension PixSearch {

    @objc(addPixImagesObject:)
    @NSManaged public func addToPixImages(_ value: PixImage)

    @objc(removePixImagesObject:)
    @NSManaged public func removeFromPixImages(_ value: PixImage)

    @objc(addPixImages:)
    @NSManaged public func addToPixImages(_ values: NSSet)

    @objc(removePixImages:)
    @NSManaged public func removeFromPixImages(_ values: NSSet)

}
