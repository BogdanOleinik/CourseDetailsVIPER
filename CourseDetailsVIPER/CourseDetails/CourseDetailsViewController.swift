//
//  CourseDetailsViewController.swift
//  CourseDetailsVIPER
//
//  Created by Олейник Богдан on 02.04.2022.
//

import UIKit

protocol CourseDetailsViewInputProtocol: AnyObject {
    func displayCourseName(with title: String)
    func displayNumberOfLessons(with title: String)
    func displayNumberOfTests(with title: String)
    func displayImage(with imageData: Data)
    func displayImageForFavoriteButton(with status: Bool)
}

protocol CourseDetailsViewOutputProtocol: AnyObject {
    init(view: CourseDetailsViewInputProtocol)
    func showDetails()
    func favoriteButtonPressed()
}

class CourseDetailsViewController: UIViewController {
    
    @IBOutlet private weak var courseNameLabel: UILabel!
    @IBOutlet private weak var numberOfLessonsLabel: UILabel!
    @IBOutlet private weak var numberOfTestsLabel: UILabel!
    @IBOutlet private weak var courseImage: UIImageView!
    @IBOutlet private weak var favoriteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.showDetails()
    }
    
    var presenter: CourseDetailsViewOutputProtocol!
    
    @IBAction func toggleFavorite(_ sender: UIButton) {
        presenter.favoriteButtonPressed()
    }
}

// MARK: - CourseDetailsViewInputProtocol
extension CourseDetailsViewController: CourseDetailsViewInputProtocol {
    func displayCourseName(with title: String) {
        courseNameLabel.text = title
    }
    
    func displayNumberOfLessons(with title: String) {
        numberOfLessonsLabel.text = title
    }
    
    func displayNumberOfTests(with title: String) {
        numberOfTestsLabel.text = title
    }
    
    func displayImage(with imageData: Data) {
        courseImage.image = UIImage(data: imageData)
    }
    
    func displayImageForFavoriteButton(with status: Bool) {
        favoriteButton.tintColor = status ? .red : .gray
    }
}
