//
//  CourseDetailsViewController.swift
//  CourseDetailsVIPER
//
//  Created by Олейник Богдан on 02.04.2022.
//

import UIKit

protocol CourseDetailsViewInputProtocol: AnyObject {
    
}

protocol CourseDetailsViewOutputProtocol: AnyObject {
    init(view: CourseDetailsViewInputProtocol)
    func showDetails()
}

class CourseDetailsViewController: UIViewController {
    
    @IBOutlet private weak var courseNameLabel: UILabel!
    @IBOutlet private weak var numberOfLessonsLabel: UILabel!
    @IBOutlet private weak var numberOfTestsLabel: UILabel!
    @IBOutlet private weak var courseImage: UIImageView!
    @IBOutlet private weak var favoriteButton: UIButton!

    private let configurator: CourseDetailsConfiguratorInputProtocol = CourseDetailsConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self, and: course)
        presenter.showDetails()
    }
    
    var course: Course!
    var presenter: CourseDetailsViewOutputProtocol!
    
    @IBAction func toggleFavorite(_ sender: UIButton) {
    }
}

// MARK: - CourseDetailsViewInputProtocol
extension CourseDetailsViewController: CourseDetailsViewInputProtocol {
    
}
