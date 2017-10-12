//
//  ListStudentsViewModel.swift
//  CheckList
//
//  Created by Martin Imobersteg on 12.10.17.
//  Copyright © 2017 Martin Imobersteg. All rights reserved.
//

import Foundation
import ReactiveKit
import Bond

class ListStudentsViewModel {

    let students = SafeSignal.just(["Hans", "Klaus"])
    
}
