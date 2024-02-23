//
//  CoreDataManager.swift
//  NotesCD
//
//  Created by petar on 23.02.2024.
//

import Foundation
import CoreData


class CoreDataManager{
    
    static let shared = CoreDataManager()
    var notes = [Note]()
    
    private init(){
        fetchAllNotes()
    }
    
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "NotesCD")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    
    //method to get all notes from database
    func fetchAllNotes(){
        let request = Note.fetchRequest()
        if let notes = try? persistentContainer.viewContext.fetch(request){
            self.notes = notes
        }
    }
    
    func addNewNote(text: String, title: String){
        let note = Note(context: persistentContainer.viewContext)
        note.id = UUID().uuidString
        note.title = title
        note.text = text
        note.date = Date()
        
        saveContext()
        fetchAllNotes()
    }
    
}
