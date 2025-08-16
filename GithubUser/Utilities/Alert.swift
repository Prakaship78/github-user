//
//  Alert.swift
//  GithubUser
//
//  Created by Prakash on 14/08/25.
//

import SwiftUI

struct AlertItem : Identifiable {
    let id = UUID()
    let title : Text
    let message : Text
    let dismissButton : Alert.Button
}

struct AlertContext{
    //MARK: Network Alert
    static let invalidData = AlertItem(title: Text("Server Error"), message: Text("The data received from server was invalid. Please contact support."), dismissButton: .default(Text("OK")))
    
    static let invalidResponse = AlertItem(title: Text("Server Error"), message: Text("Invalid response from the server. Please try again later or contact support."), dismissButton: .default(Text("OK")))
                                      
     static let unableToComplete = AlertItem(title: Text("Server Error"), message: Text("Unable to complete the request at this time. Please check your internet connection and try again later."), dismissButton: .default(Text("OK")))
    
    //MARK: User errors
    static let invalidUser = AlertItem(title: Text("Error"), message: Text("User name is invalid. Please try again."), dismissButton: .default(Text("OK")))
    
    //MARK: Generic error
    static let generic = AlertItem(title: Text("Error"), message: Text("Something went wrong. Please try again later"), dismissButton: .default(Text("OK")))
}
