//
//  AlertItem.swift
//  barcodeScanner
//
//  Created by Edson Yudi Toma on 25/01/23.
//

struct AlertItem {
    var title: String
    var message: String
    var dismissButtonTitle: String
}

extension AlertItem {
    init() {
        title = String()
        message = String()
        dismissButtonTitle = String()
    }
}
