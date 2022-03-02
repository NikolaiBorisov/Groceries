//
//  AddToBagViewModel.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 03.02.2022.
//

import Foundation

struct CartValueViewModel {
    
    let id: String
    let title: String
    let stepValue: Int
    let showStepper: Bool
    
    init(id: String, stepValue: Int) {
        self.id = id
        self.title = "ADD TO BAG"
        self.stepValue = stepValue
        self.showStepper = stepValue > 0
    }
    
}

// MARK: - AddToBagViewModelExtension

extension CartValueViewModel {
    
    func onAddToBag() -> CartValueViewModel {
        CartValueViewModel(id: id, stepValue: 1)
    }
    
    func onIncrement() -> CartValueViewModel {
        guard stepValue < 10 else { return self }
        return CartValueViewModel(id: id, stepValue: stepValue + 1)
    }
    
    func onDecrement() -> CartValueViewModel {
        guard stepValue > 0 else { return self }
        return CartValueViewModel(id: id, stepValue: stepValue - 1)
    }
    
}

