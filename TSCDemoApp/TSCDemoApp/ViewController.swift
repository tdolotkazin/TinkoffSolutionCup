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
    let card = Card(headerConfiguration: HeaderConfiguration(headerText: "Header", subheaderText: "Subheader", accessory: .avatar(nil)))
    let paleCard = Card(headerConfiguration: HeaderConfiguration(headerText: "Header", subheaderText: "Subheader", accessory: .avatar(nil)), style: .pale)
    let noSubheaderCard = Card(headerConfiguration: HeaderConfiguration(headerText: "Header", accessory: .avatar(nil)))
    let noSubheaderPaleCard = Card(headerConfiguration: HeaderConfiguration(headerText: "Header", accessory: .avatar(nil)), style: .pale)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.background
        view.addSubview(card)
        card.frame = CGRect(origin: CGPoint(x: 32, y: 100), size: card.sizeThatFits(CGSize(width: 343, height: view.frame.size.height)))
        view.addSubview(paleCard)
        paleCard.frame = CGRect(origin: CGPoint(x: 32, y: 200), size: paleCard.sizeThatFits(CGSize(width: 343, height: view.frame.size.height)))
        view.addSubview(noSubheaderCard)
        noSubheaderCard.frame = CGRect(origin: CGPoint(x: 32, y: 300), size: noSubheaderCard.sizeThatFits(CGSize(width: 343, height: view.frame.size.height)))
        view.addSubview(noSubheaderPaleCard)
        noSubheaderPaleCard.frame = CGRect(origin: CGPoint(x: 32, y: 400), size: noSubheaderPaleCard.sizeThatFits(CGSize(width: 343, height: view.frame.size.height)))
    }
}

