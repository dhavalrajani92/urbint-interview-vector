//
//  ViewController.swift
//  JokesApi
//
//  Created by Dhaval Rajani on 11/27/23.
//

import Foundation
import UIKit

final class ViewController: UIViewController {
  private let viewModel: ViewModel
  init(viewModel: ViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    return nil
  }
}
