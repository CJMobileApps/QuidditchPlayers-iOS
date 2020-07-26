//
//  QuidditchPlayersCell.swift
//  QuidditchPlayers
//
//  Created by Chris Jones on 7/24/20.
//  Copyright © 2020 cjmobileapps. All rights reserved.
//

import UIKit

class QuidditchPlayersCell: UITableViewCell {

    let playerImage = UIImageViewBlackBorder(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
    let playerName = LabelHeadline()
    let playerPosition = LabelBodyAlternateTextColor()
    let playerHouseView = HeaderAndTextView()
    let favoriteSubjectView = HeaderAndTextView()
    let yearsPlayedView = HeaderAndTextView()
    let statusView = HeaderAndTextView()

    static let tag = String(describing: QuidditchPlayersCell.self)

    override init(style: CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpPlayerImage(to: self)
        setUpPlayerName()
        setUpPosition()
        setupHouseView()
        setupFavoriteSubjectView()
        setupYearsPlayedView()
        setupStatusView()
    }

    required init?(coder: NSCoder) {
        fatalError(StringConstants.NOT_USING_STORYBOARDS)
    }

    func setPlayer(player: Player) {
        let imageUrl = URL(string: player.imageUrl)
        playerImage.kf.setImage(with: imageUrl)
        playerName.text = player.getFullName()
        playerPosition.text = player.positionName
        favoriteSubjectView.textLabel.text = player.favoriteSubject
        yearsPlayedView.textLabel.text = player.yearsPlayed.description
        statusView.textLabel.text = player.status
    }

    func setPlayerImageConstraints() {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }

    func setUpPlayerImage(to superView: UIView) {

        superView.addSubview(playerImage)
        playerImage.translatesAutoresizingMaskIntoConstraints = false
        playerImage.heightAnchor.constraint(equalToConstant: 60).isActive = true
        playerImage.widthAnchor.constraint(equalToConstant: 60).isActive = true
        playerImage.topAnchor.constraint(equalTo: superView.topAnchor, constant: 10).isActive = true
        playerImage.leadingAnchor.constraint(equalTo: super.leadingAnchor, constant: 10).isActive = true
    }

    func setUpPlayerName() {

        self.addSubview(playerName)
        playerName.translatesAutoresizingMaskIntoConstraints = false
        playerName.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        playerName.leadingAnchor.constraint(equalTo: playerImage.trailingAnchor, constant: 10).isActive = true
        playerName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
    }

    func setUpPosition() {

        self.addSubview(playerPosition)
        playerPosition.translatesAutoresizingMaskIntoConstraints = false
        playerPosition.topAnchor.constraint(equalTo: playerName.bottomAnchor, constant: 10).isActive = true
        playerPosition.leadingAnchor.constraint(equalTo: playerImage.trailingAnchor, constant: 10).isActive = true
        playerPosition.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
    }

    func setupHouseView() {

        playerHouseView.headerLabel.text = StringConstants.HOUSE
        playerHouseView.textLabel.text = StringConstants.GRYFFINDOR

        self.addSubview(playerHouseView)

        playerHouseView.translatesAutoresizingMaskIntoConstraints = false
        playerHouseView.topAnchor.constraint(equalTo: playerImage.bottomAnchor, constant: 10).isActive = true
        playerHouseView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        playerHouseView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    }

    func setupFavoriteSubjectView() {

        favoriteSubjectView.headerLabel.text = StringConstants.FAVORITE_SUBJECT
        self.addSubview(favoriteSubjectView)

        favoriteSubjectView.translatesAutoresizingMaskIntoConstraints = false
        favoriteSubjectView.topAnchor.constraint(equalTo: playerHouseView.bottomAnchor, constant: 10).isActive = true
        favoriteSubjectView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        favoriteSubjectView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    }

    func setupYearsPlayedView() {

        yearsPlayedView.headerLabel.text = StringConstants.YEARS_PLAYED
        self.addSubview(yearsPlayedView)

        yearsPlayedView.translatesAutoresizingMaskIntoConstraints = false
        yearsPlayedView.topAnchor.constraint(equalTo: favoriteSubjectView.bottomAnchor, constant: 10).isActive = true
        yearsPlayedView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        yearsPlayedView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    }

    func setupStatusView() {

        statusView.headerLabel.text = StringConstants.STATUS
        self.addSubview(statusView)

        statusView.translatesAutoresizingMaskIntoConstraints = false
        statusView.topAnchor.constraint(equalTo: yearsPlayedView.bottomAnchor, constant: 25).isActive = true
        statusView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        statusView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        statusView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
    }
}
