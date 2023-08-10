//
//  FavPlaces+CoreDataProperties.swift
//  My FAvourite Places
//
//  Created by Apple on 10/12/2021.
//
//

import Foundation
import CoreData

extension FavPlaces {

   
    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavPlaces> {
        return NSFetchRequest<FavPlaces>(entityName: "FavPlaces")
       
    }

    @NSManaged public var lat: String
    @NSManaged public var lon: String
    @NSManaged public var name: String

}

extension FavPlaces : Identifiable {

}
