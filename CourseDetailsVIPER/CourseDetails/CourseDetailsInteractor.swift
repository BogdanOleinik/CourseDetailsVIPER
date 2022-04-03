//
//  CourseDetailsInteractor.swift
//  CourseDetailsVIPER
//
//  Created by Олейник Богдан on 02.04.2022.
//

import Foundation

protocol CourseDetailsInteractorInputProtocol: AnyObject {
    init(presenter: CourseDetailsInteractorOutputProtocol, course: Course)
    func provideCourseDetails()
}

protocol CourseDetailsInteractorOutputProtocol: AnyObject {
    func receiveCourseDetails(with courseData: CourseDetailsData)
}

class CourseDetailsInteractor: CourseDetailsInteractorInputProtocol {
    unowned let presenter: CourseDetailsInteractorOutputProtocol
    private let course: Course
    
    required init(presenter: CourseDetailsInteractorOutputProtocol, course: Course) {
        self.presenter = presenter
        self.course = course
    }
    
    func provideCourseDetails() {
        let imageData = ImageManager.shared.fetchImageData(from: course.imageUrl)
        let courseDetailsData = CourseDetailsData(
            courseName: course.name,
            courseNumberOfLessons: course.numberOfLessons,
            courseNumberOfTests: course.numberOfTests,
            imageData: imageData
        )
        presenter.receiveCourseDetails(with: courseDetailsData)
    }
}
