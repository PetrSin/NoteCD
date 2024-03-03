//
//  Note+CoreDataProperties.swift
//  NotesCD
//
//  Created by petar on 23.02.2024.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var id: String?
    @NSManaged public var text: String?
    @NSManaged public var title: String?
    @NSManaged public var date: Date?

}

extension Note : Identifiable {

    //method for updating a note from the database
    func updateNote(newTitle: String, newText: String) {
        self.title = newTitle
        self.text = newText
        self.date = Date()
        
        try? managedObjectContext?.save()
    }
    
    func deleteNote(){
        managedObjectContext?.delete(self)
        try? managedObjectContext?.save()
    }
}
