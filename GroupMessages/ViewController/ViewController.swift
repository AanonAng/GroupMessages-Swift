//
//  ViewController.swift
//  GroupMessages
//
//  Created by Aaron Ang on 05/11/2018.
//  Copyright © 2018 AaronAng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    fileprivate let cellId = "MessageCell"
    
    let messagesFromServer = [
        ChatMessage(text: "Here's my very first message", isIncoming: true, date: Date.dateFromCustomString(customString: "31/10/2018")),
        ChatMessage(text: "We want to procide a longer string taht is actually going to weap onto the nect line and maybe even a third line.", isIncoming: true, date: Date.dateFromCustomString(customString: "31/10/2018")),
        ChatMessage(text: "Here's my", isIncoming: false, date: Date.dateFromCustomString(customString: "31/10/2018")),
        ChatMessage(text: "We want to procide a longer string taht is actually going to weap onto the nect line and maybe even a third line.We want to procide a longer string taht is actually going to weap onto the nect line and maybe even a third line.", isIncoming: false, date: Date.dateFromCustomString(customString: "10/11/2018")),
        ChatMessage(text: "Here's my", isIncoming: false, date: Date.dateFromCustomString(customString: "10/11/2018")),
        ChatMessage(text: "third section is here", isIncoming: true, date: Date.dateFromCustomString(customString: "22/11/2018"))
    ]
    
    var chatMessages = [[ChatMessage]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.attemptToAssembleGroupMessage()
    }
    
    fileprivate func attemptToAssembleGroupMessage() {
        let groupMessages = Dictionary(grouping: messagesFromServer) { (element) -> Date in
            return element.date
        }
        
        let sortedKeys = groupMessages.keys.sorted()
        sortedKeys.forEach { (key) in
            let values = groupMessages[key]
            chatMessages.append(values ?? [])
        }
    }
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.chatMessages.count
    }
    
    private func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let firstMessageInSection = chatMessages[section].first {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            let dateString = dateFormatter.string(from: firstMessageInSection.date)
            
            let label = DateHeaderLabel()
            label.text = dateString
            
            let containerView = UIView()
            containerView.addSubview(label)
            label.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
            label.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
            
            return containerView
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.chatMessages[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MessageCell
        cell.chatMessage = self.chatMessages[indexPath.section][indexPath.row]
        
        return cell
    }
}

