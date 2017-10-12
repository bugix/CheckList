//
//  SelectStudentView.swift
//  CheckList
//
//  Created by Martin Imobersteg on 12.10.17.
//  Copyright © 2017 Martin Imobersteg. All rights reserved.
//

import UIKit
import Then
import ReactiveKit
import Bond

class ListStudentsView: UIViewController {
    let disposeBag = DisposeBag()

    @IBOutlet weak var tableView: UITableView!

    var viewModel: ListStudentsViewModel!
    var navigator: Navigator!

    static func createWith(navigator: Navigator, storyboard: UIStoryboard, viewModel: ListStudentsViewModel) -> ListStudentsView {
        return storyboard.instantiateViewController(ofType: ListStudentsView.self).then { vc in
            vc.navigator = navigator
            vc.viewModel = viewModel
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 90
        tableView.rowHeight = UITableViewAutomaticDimension
        title = "Loading..."
        bindViewModel()
    }

    func bindViewModel() {

        tableView.selectedRow.observeNext { row in
            print("Tapped row at index \(row).")
            self.navigator.show(segue: .checkList(), sender: self)
        }.dispose(in: disposeBag)

        tableView.reactive.delegate.forwardTo = self

        viewModel.students.bind(to: tableView) { students, indexPath, tableView in
            let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCellView", for: indexPath) as! StudentCellView
            cell.nameLabel.text = students[indexPath.row]
            return cell
        }

    }
}

extension UITableView {
    var selectedRow: Signal<Int, NoError> {
        return reactive.delegate.signal(for: #selector(UITableViewDelegate.tableView(_:didSelectRowAt:))) { (subject: SafePublishSubject<Int>, _: UITableView, indexPath: IndexPath) in
            subject.next(indexPath.row)
        }
    }
}
