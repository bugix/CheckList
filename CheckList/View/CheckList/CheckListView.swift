//
//  CheckListView.swift
//  CheckList
//
//  Created by Martin Imobersteg on 12.10.17.
//  Copyright © 2017 Martin Imobersteg. All rights reserved.
//

import UIKit
import Then
import ReactiveKit
import Bond

class CheckListView: UIViewController {
    let disposeBag = DisposeBag()

    var viewModel: CheckListViewModel!
    var navigator: Navigator!

    static func createWith(navigator: Navigator, storyboard: UIStoryboard, viewModel: CheckListViewModel) -> CheckListView {
        return storyboard.instantiateViewController(ofType: CheckListView.self).then { vc in
            vc.navigator = navigator
            vc.viewModel = viewModel
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Loading..."
        bindViewModel()
    }

    func bindViewModel() {

    }

}


