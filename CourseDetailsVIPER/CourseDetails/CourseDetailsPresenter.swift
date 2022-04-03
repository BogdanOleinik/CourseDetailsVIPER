//
//  CourseDetailsPresenter.swift
//  CourseDetailsVIPER
//
//  Created by Олейник Богдан on 02.04.2022.
//

import Foundation

struct CourseDetailsData {
    let courseName: String
    let courseNumberOfLessons: Int
    let courseNumberOfTests: Int
    let imageData: Data?
}

class CourseDetailsPresenter: CourseDetailsViewOutputProtocol {
    unowned let view: CourseDetailsViewInputProtocol
    var interactor: CourseDetailsInteractorInputProtocol!
    
    required init(view: CourseDetailsViewInputProtocol) {
        self.view = view
    }
    
    func showDetails() {
        interactor.provideCourseDetails()
    }
}

// MARK: - CourseDetailsInteractorOutputProtocol
extension CourseDetailsPresenter: CourseDetailsInteractorOutputProtocol {
    func receiveCourseDetails(with courseData: CourseDetailsData) {
        let numberOfLessons = "Number of lessons: \(courseData.courseNumberOfLessons)"
        let numberOfTests = "Number of tests: \(courseData.courseNumberOfTests)"
        view.displayCourseName(with: courseData.courseName)
        view.displayNumberOfLessons(with: numberOfLessons)
        view.displayNumberOfTests(with: numberOfTests)
        
        guard let imageData = courseData.imageData else { return }
        view.displayImage(with: imageData)
    }
}
