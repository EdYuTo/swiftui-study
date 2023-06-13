//
//  ScannerAlertItem.swift
//  barcodeScanner
//
//  Created by Edson Yudi Toma on 25/01/23.
//

extension AlertItem {
    init(error: ScannerError) {
        self.init()
        title = title(error)
        message = message(error)
        dismissButtonTitle = dismissButtonTitle(error)
    }
    
    func title(_ error: ScannerError) -> String {
        switch error {
        case .invalidDeviceInput: return "Your camera is fucked up."
        case .invalidScannedValue: return "Sorry, I don't speak shit."
        }
    }
    
    func message(_ error: ScannerError) -> String {
        switch error {
        case .invalidDeviceInput: return "Something is wrong with your camera. Buy a new phone"
        case .invalidScannedValue: return "Invalid value scanned. This app only supports EAN-8 and EAN-13 barcodes (google it, you dipshit)"
        }
    }
    
    func dismissButtonTitle(_ error: ScannerError) -> String {
        switch error {
        default: return "ok"
        }
    }
}
