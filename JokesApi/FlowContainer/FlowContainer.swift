//
//  FlowContainer.swift
//  JokesApi
//
//  Created by Dhaval Rajani on 11/27/23.
//

import Foundation
import UIKit

final class FlowContainer {
  private let navController: UINavigationController
  private let flowViewModel: FlowViewmodel
  init(navController: UINavigationController, flowViewModel: FlowViewmodel) {
    self.navController = navController
    self.flowViewModel = flowViewModel
    // my APi got sucess


    flowViewModel.fetchData {
      self.resetRootViewController()
    }
    
  }

  private func resetRootViewController() {
    guard let model = flowViewModel.viewModel else { return }
    let viewController = ViewController(viewModel: model)
    navController.viewControllers = [viewController]
  }
}
