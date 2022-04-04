//
//  CourseCell.swift
//  CourseDetailsVIPER
//
//  Created by Олейник Богдан on 04.04.2022.
//

import UIKit

protocol CellModelRepresentable {
    var viewModel: CellIdentifiable? { get set }
}

class CourseTableViewCell: UITableViewCell, CellModelRepresentable {
    var viewModel: CellIdentifiable? {
        didSet {
            updateView()
        }
    }
    
    private func updateView() {
        guard let viewModel = viewModel as? CourseCellViewModel else { return }
        var content = defaultContentConfiguration()
        content.text = viewModel.courseName
        if let imageData = ImageManager.shared.fetchImageData(from: viewModel.imageURL) {
            content.image = UIImage(data: imageData)
        }
        contentConfiguration = content
    }
}
