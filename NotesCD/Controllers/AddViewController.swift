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
        title.textColor = .black
        title.text = note?.title ?? ""
        title.textAlignment = .center
        title.layer.cornerRadius = 20
        title.translatesAutoresizingMaskIntoConstraints = false
        title.heightAnchor.constraint(equalToConstant: 50).isActive = true
        title.backgroundColor = .white
        title.font = .systemFont(ofSize: 20)
        title.layer.borderColor = CGColor(red: 242/255, green: 200/255, blue: 247/255, alpha: 1)
        title.layer.borderWidth = 4.0
        return title
    }()
    
    lazy var textView: UITextView = {
        let text = UITextView()
        text.text = note?.text ?? ""
        text.translatesAutoresizingMaskIntoConstraints = false
        text.heightAnchor.constraint(equalToConstant: 450).isActive = true
        text.backgroundColor = .white
        text.textColor = .black
        text.layer.cornerRadius = 20
        text.font = UIFont.systemFont(ofSize: 19)
        text.layer.borderColor = CGColor(red: 242/255, green: 200/255, blue: 247/255, alpha: 1)
        text.layer.borderWidth = 4.0
        return text
    }()
    
    
    lazy var buttonSave: UIButton = {
        let btn = UIButton(type: .system, primaryAction: actionSaveNote)
        btn.setTitle("Save", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 15
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.borderColor = CGColor(red: 242/255, green: 200/255, blue: 247/255, alpha: 1)
        btn.layer.borderWidth = 4.0
        return btn
    }()
    
    
    lazy var actionSaveNote = UIAction { _ in
        if self.note != nil{
            self.note?.updateNote(newTitle: self.titleTextField.text ?? "", newText: self.textView.text)
        } else {
            self.manager.addNewNote(text: self.textView.text , title: self.titleTextField.text ?? "")
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationBar()
        setupUI()
    }
    
    
    private func setupUI(){
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
    
    private func configNavigationBar(){
        navigationController?.changeColorTitle(color: .black)
        title = "Edit Note"
        navigationItem.leftBarButtonItem = UIBarButtonItem(systemItem: .close, primaryAction: UIAction(handler: { _ in
            self.navigationController?.popViewController(animated: true)
        }))
        view.backgroundColor = UIColor(red: 242/255, green: 232/255, blue: 247/255, alpha: 1)
        
    }
    
    
}
