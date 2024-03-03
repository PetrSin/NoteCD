//
//  ReadViewController.swift
//  NotesCD
//
//  Created by petar on 02.03.2024.
//

import UIKit

class ReadViewController: UIViewController {
    
    var note: Note?
    
    let titleLabel: UILabel = {
        var view = UILabel()
        view.text = "Missing title😔"
        view.textColor = .black
        view.textAlignment = .center
        view.font = .systemFont(ofSize: 23, weight: .bold)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.numberOfLines = 0
        view.backgroundColor = .clear
        return view
    }()
    
    let textView: UITextView = {
        var text = UITextView()
        text.text = "Missing text😔"
        text.font = .systemFont(ofSize: 19)
        text.isEditable = false
        text.textColor = .black
        text.backgroundColor = .clear
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    lazy var dateFormater: DateFormatter = {
        let formater = DateFormatter()
        formater.dateStyle = .short
        return formater
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configNaviationBar()
        setupUI()
        getTextForView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        getTextForView()
    }
    
    
    private func setupUI(){
        view.backgroundColor = UIColor(red: 242/255, green: 232/255, blue: 247/255, alpha: 1)
        view.addSubview(titleLabel)
        view.addSubview(textView)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 100),
        ])
        
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            textView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            textView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            textView.heightAnchor.constraint(equalToConstant: 700)
        ])
    }
    
    private func getTextForView(){
        titleLabel.text = note?.title
        textView.text = note?.text
    }
    
    private func configNaviationBar(){
        navigationController?.changeColorTitle(color: .gray)
        guard let noteDate = note?.date else { return self.title = "Your Note"}
        title = "\(dateFormater.string(from: noteDate))"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(systemItem: .close, primaryAction: UIAction(handler: { _ in
            self.navigationController?.popViewController(animated: true)
        }))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "pencil"), primaryAction: UIAction(handler: { _ in
            let vc = AddViewController()
            vc.note = self.note
            self.navigationController?.pushViewController(vc, animated: true)
        }))
        navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
}
