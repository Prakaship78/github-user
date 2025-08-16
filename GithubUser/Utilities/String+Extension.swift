//
//  String+Extension.swift
//  GithubUser
//
//  Created by Prakash on 16/08/25.
//

import Foundation

extension String {
    /// format date from "2018-09-13T09:30:30Z" to "13 Sept 2018"
    var formatDate : String? {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let date = inputFormatter.date(from: self) else {return nil}
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "dd MMM yyyy"
        let dateStr = outputFormatter.string(from: date)
        return dateStr
    }
}
