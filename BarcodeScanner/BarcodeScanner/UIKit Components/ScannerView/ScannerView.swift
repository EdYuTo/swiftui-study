//
//  ScannerView.swift
//  barcodeScanner
//
//  Created by Edson Yudi Toma on 23/01/23.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    
    @Binding
    var scannedCode: String
    
    @Binding
    var scannerAlert: AlertItem?
    
    func makeUIViewController(context: Context) -> ScannerViewController {
        ScannerViewController(delegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: ScannerViewController, context: Context) {
        /* Empty */
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}

struct ScannerView_Previews: PreviewProvider {
    static var previews: some View {
        ScannerView(scannedCode: .constant(String()), scannerAlert: .constant(nil))
    }
}

// MARK: - Coordinator
extension ScannerView {
    final class Coordinator: NSObject, ScannerDelegate {
        private var view: ScannerView
        
        init(_ view: ScannerView) {
            self.view = view
        }
        
        func didFind(barcode: String) {
            view.scannedCode = barcode
        }
        
        func didFind(error: ScannerError) {
            view.scannerAlert = AlertItem(error: error)
        }
    }
}
