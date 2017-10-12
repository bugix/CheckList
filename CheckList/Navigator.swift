//
//  Navigator.swift
//  CheckList
//
//  Created by Martin Imobersteg on 12.10.17.
//  Copyright © 2017 Martin Imobersteg. All rights reserved.
//

import UIKit

class Navigator {

    let listStudentsStoryboard = UIStoryboard(name: "ListStudentsView", bundle: nil)
    let checkListStoryboard = UIStoryboard(name: "CheckListView", bundle: nil)

    enum Segue {
        case listStudents()
        case checkList()
    }

    func show(segue: Segue, sender: UIViewController) {
        switch segue {
        case .listStudents():
            let vm = ListStudentsViewModel()
            show(target: ListStudentsView.createWith(navigator: self, storyboard: listStudentsStoryboard, viewModel: vm), sender: sender)
        case .checkList():
            let vm = CheckListViewModel()
            show(target: CheckListView.createWith(navigator: self, storyboard: checkListStoryboard, viewModel: vm), sender: sender)
        }
    }

    func show(target: UIViewController, sender: UIViewController) {

        if let nav = sender as? UINavigationController {
            //push root controller on navigation stack
            nav.pushViewController(target, animated: false)
            return
        }

        if let nav = sender.navigationController {
            //add controller to navigation stack
            nav.pushViewController(target, animated: true)
        } else {
            //present modally
            sender.present(target, animated: true, completion: nil)
        }

    }
    
}
