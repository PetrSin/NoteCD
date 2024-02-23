//
//  AddViewController.swift
//  NotesCD
//
//  Created by petar on 23.02.2024.
//

import UIKit

class AddViewController: UIViewController {

    private let manager = CoreDataManager.shared
    var note: Note?
    
    lazy var titleTextField: UITextField = {
        let title = UITextField()
        title.placeholder = "enter title"
        title.text = note?.title ?? ""
        title.textAlignment = .center
        title.layer.cornerRadius = 20
        title.translatesAutoresizingMaskIntoConstraints = false
        title.heightAnchor.constraint(equalToConstant: 50).isActive = true
        title.backgroundColor = .white
        return title
    }()
    
    lazy var textView: UITextView = {
        let text = UITextView()
        text.text = note?.text ?? ""
        text.translatesAutoresizingMaskIntoConstraints = false
        text.heightAnchor.constraint(equalToConstant: 450).isActive = true
        text.backgroundColor = .white
        text.layer.cornerRadius = 20
        text.font = UIFont.systemFont(ofSize: 16)
        return text
    }()
    
    
    lazy var buttonSave: UIButton = {
        let btn = UIButton(type: .system, primaryAction: actionSaveNote)
        btn.setTitle("Save", for: .normal)
        btn.setTitleColor(.gray, for: .normal)
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 15
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    
    lazy var actionSaveNote = UIAction { _ in
        if self.note == nil{
            self.manager.addNewNote(text: self.textView.text , title: self.titleTextField.text ?? "")
        } else {
            self.manager.addNewNote(text: self.textView.text , title: self.titleTextField.text ?? "")
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
        title = "Add Note"
        view.backgroundColor = .gray
        
        super.viewDidLoad()
        view.addSubview(titleTextField)
        view.addSubview(textView)
        view.addSubview(buttonSave)
        
        NSLayoutConstraint.activate([
            titleTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  20),
            titleTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -20),

            textView.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 20),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  20),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -20),
            
            buttonSave.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 10),
            buttonSave.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  20),
            buttonSave.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -20)
        ])
    }


}
