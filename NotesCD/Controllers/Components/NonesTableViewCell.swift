//
//  NonesTableViewCell.swift
//  NotesCD
//
//  Created by petar on 03.03.2024.
//

import UIKit

class NonesTableViewCell: UITableViewCell {

    
    var titleLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 10)
        view.textColor = .black
        return view
    }()
   
    var dateLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 17)
        view.textColor = .gray
        return view
    }()

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected == true{
            contentView.backgroundColor = .gray
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configCell()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configCell(){
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10.0
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 13),
            titleLabel.widthAnchor.constraint(equalToConstant: 40)
        
        ])
    }
    

}
