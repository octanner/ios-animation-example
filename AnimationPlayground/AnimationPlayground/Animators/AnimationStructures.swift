//
//  TransitionalStructure.swift
//  transitionsPlayground
//
//  Created by Benjamin Patch on 10/29/18.
//  Copyright © 2018 OC Tanner. All rights reserved.
//

import UIKit

enum TransitioningElements: Int {
    case imageView
    case label
    case secondaryLabel
}

protocol Transitionable {
    var viewsToTransition: [TransitioningElements: UIView] { get }
}

extension Transitionable {
    var sortedViewsToTransition: [(key: TransitioningElements, value: UIView)] {
        return viewsToTransition.sorted(by: { $0.key.rawValue < $1.key.rawValue })
    }
}


