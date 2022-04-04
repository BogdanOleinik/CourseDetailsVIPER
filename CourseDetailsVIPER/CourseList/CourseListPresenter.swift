//
//  CourseListPresenter.swift
//  CourseDetailsVIPER
//
//  Created by Олейник Богдан on 04.04.2022.
//

import Foundation

class CourseListPresenter: CourseListViewOutputProtocol {
    unowned let view: CourseListViewInputProtocol
    var interactor: CourseListInteractorInputProtocol!
    var router: CourseListRouterInputProtocol!
    
    required init(view: CourseListViewInputProtocol) {
        self.view = view
    }
    
    func viewDidLoad() {
        interactor.fetchCourses()
    }
    
    func didTapCell(at indexPath: IndexPath) {
        interactor.getCourse(at: indexPath)
    }
}

// MARK: - CourseListInteractorOutputProtocol
extension CourseListPresenter: CourseListInteractorOutputProtocol {
    func coursesDidReceive(_ courses: [Course]) {
        let section = CourseSectionViewModel()
        courses.forEach { section.rows.append(CourseCellViewModel(course: $0)) }
        view.reloadData(for: section)
    }
    
    func courseDidReceive(_ course: Course) {
        router.openCourseDetailsViewController(with: course)
    }
}
