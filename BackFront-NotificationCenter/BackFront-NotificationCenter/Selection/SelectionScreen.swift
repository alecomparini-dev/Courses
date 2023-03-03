//
//  SelectionScreen.swift
//  BackFront-NotificationCenter
//
//  Created by Alessandro Comparini on 02/03/23.
//

import UIKit

protocol SelectionScreenDelegate: AnyObject {
    func tappedNote(_ sender: UIButton)
    func tappedDeskTop(_ sender: UIButton)
}


class SelectionScreen: UIView {

    private weak var delegate: SelectionScreenDelegate?
    public func delegate(delegate: SelectionScreenDelegate) {
        self.delegate = delegate
    }
    
//  MARK: - INIT
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//  MARK: - ELEMENTS
    lazy var optionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Options"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textAlignment = .center
        return label
    }()
    
    
    lazy var stackView: UIStackView = {
        let sw = UIStackView()
        sw.translatesAutoresizingMaskIntoConstraints = false
        sw.distribution = .fillEqually
        sw.axis = .vertical
        sw.alignment = .center
        return sw
    }()
    
    
    lazy var viewNote: UIView = {
        let vw = UIView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.isUserInteractionEnabled = false
        return vw
    }()
    
    lazy var note: UIButton = {
        let bt = UIButton(type: .system)
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.tintColor = UIColor.white
        bt.setImage(UIImage(named: "Macbook")?.withRenderingMode(.alwaysOriginal), for: .normal)
        bt.addTarget(self, action: #selector(tappedNoteButton), for: .touchUpInside)
        return bt
    }()
    
    
    lazy var viewDesk: UIView = {
        let vw = UIView()
        vw.translatesAutoresizingMaskIntoConstraints = false
//        vw.isUserInteractionEnabled = false
        return vw
    }()
    
    lazy var desk: UIButton = {
        let bt = UIButton(type: .system)
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.tintColor = UIColor.white
        bt.setImage(UIImage(named: "Imac")?.withRenderingMode(.alwaysOriginal), for: .normal)
        bt.imageView?.isUserInteractionEnabled = false
        bt.isUserInteractionEnabled = true
        bt.isEnabled = true
        bt.addTarget(self, action: #selector(tappedDeskTopButton), for: .touchUpInside)
        
        return bt
    }()
    
    
//  MARK: - @OBJC FUNCTIONS
    @objc func tappedNoteButton(_ sender: UIButton) {
        delegate?.tappedNote(sender)
    }
    
    @objc func tappedDeskTopButton(_ sender: UIButton) {
        delegate?.tappedDeskTop(sender)
    }
    
    
//  MARK: - ADD ELEMENTS
    private func addElements() {
        addSubview(optionLabel)
        addSubview(stackView)
        stackView.addSubview(desk)
        stackView.addSubview(note)
        stackView.addArrangedSubview(viewDesk)
        stackView.addArrangedSubview(viewNote)
    }
    
    
    
// MARK: - ADD CONSTRAINSTS
    private func configConstraints() {
        
        NSLayoutConstraint.activate([
            optionLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 25),
            optionLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 25),
            optionLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -25),
            
            stackView.topAnchor.constraint(equalTo: optionLabel.bottomAnchor, constant: 30),
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 0),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,constant: 0),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor,constant: 0),
            
            desk.centerXAnchor.constraint(equalTo: viewDesk.centerXAnchor),
            desk.centerYAnchor.constraint(equalTo: viewDesk.centerYAnchor),
            desk.heightAnchor.constraint(equalToConstant: 130),
            desk.widthAnchor.constraint(equalToConstant: 220),

            note.centerXAnchor.constraint(equalTo: viewNote.centerXAnchor),
            note.centerYAnchor.constraint(equalTo: viewNote.centerYAnchor),
            note.heightAnchor.constraint(equalToConstant: 130),
            note.widthAnchor.constraint(equalToConstant: 250),

            
        ])

        
    }
    
    
    
}
