//
//  BarcodeScannerViewModel.swift
//  barcodeScanner
//
//  Created by Edson Yudi Toma on 25/01/23.
//

import SwiftUI

final class BarcodeScannerViewModel: ObservableObject {
    @Published
    var scannedCode = String()
    
    @Published
    var isShowingAlert = false

    var scannerAlert: AlertItem? {
        didSet {
            isShowingAlert = scannerAlert != nil
        }
    }
}

// MARK: - functionality
extension BarcodeScannerViewModel {
    var scannedText: String {
        scannedCode.isEmpty ? "Not yet scanned" : scannedCode
    }
    
    var scannedTextColor: Color {
        scannedCode.isEmpty || isShowingAlert ? .red : .green
    }
    
    var alertTitle: String {
        scannerAlert?.title ?? String()
    }
}
