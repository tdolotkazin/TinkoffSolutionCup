//
//  ViewController.swift
//  TSCDemoApp
//
//  Created by tmdolotkazin on 22.04.2023.
//

import UIKit
import TSCDesignSystem

class ViewController: UIViewController {

    let header = Label(style: .header, text: "Header")
    let subHeader = Label(style: .subheader, text: "Subheader")
    let titleLabel = Label(style: .title, text: "Title")
    let descriptionLabel = Label(style: .description, text: "Description")
    let avatar = Avatar()
    let card = Card(header: "Header", subheader: "Subheader", avatar: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "#FAFAFAFF")
        header.sizeThatFits(view.frame.size)
        view.addSubview(header)
        header.frame = CGRect(origin: CGPoint(x: 100, y: 100), size: header.sizeThatFits(view.frame.size))
        view.addSubview(subHeader)
        subHeader.frame = CGRect(origin: CGPoint(x: 100, y: 150), size: subHeader.sizeThatFits(view.frame.size))
        view.addSubview(titleLabel)
        titleLabel.frame = CGRect(origin: CGPoint(x: 100, y: 200), size: titleLabel.sizeThatFits(view.frame.size))
        view.addSubview(descriptionLabel)
        descriptionLabel.frame = CGRect(origin: CGPoint(x: 100, y: 250), size: descriptionLabel.sizeThatFits(view.frame.size))
        view.addSubview(avatar)
        avatar.frame = CGRect(origin: CGPoint(x: 100, y: 300), size: avatar.sizeThatFits(view.frame.size))
        view.addSubview(card)
        card.frame = CGRect(origin: CGPoint(x: 32, y: 350), size: card.sizeThatFits(CGSize(width: 343, height: view.frame.size.height)))
    }
}

