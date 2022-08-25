//
//  Extenions.swift
//  PullRequest
//
//  Created by heena thapar on 25/08/22.
//

import Foundation
import UIKit

extension String {
    func convertDate(inputFormat: String = "yyyy-MM-dd'T'HH:mm:ssZ", outputFormat: String = "dd MMM YYYY, HH:mm") -> String? {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = inputFormat

        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = outputFormat

        let date = inputFormatter.date(from: self)
        let dateString = outputFormatter.string(from: date ?? Date())
        
        return dateString
    }

}
