//
//  ContentView.swift
//  barcodeScanner
//
//  Created by Edson Yudi Toma on 23/01/23.
//

import SwiftUI

struct BarcodeScannerView: View {
    
    @StateObject
    var viewModel = BarcodeScannerViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                ScannerView(
                    scannedCode: $viewModel.scannedCode,
                    scannerAlert: $viewModel.scannerAlert
                )
                .frame(
                    maxWidth: .infinity,
                    maxHeight: 300
                )
                Spacer()
                    .frame(height: 60)
                Label(
                    "Scanned barcode:",
                    systemImage: "barcode.viewfinder"
                )
                    .font(.title)
                Text(viewModel.scannedText)
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(viewModel.scannedTextColor)
                    .padding()
            }
            .navigationTitle("Barcode scanner")
            .alert(
                viewModel.alertTitle,
                isPresented: $viewModel.isShowingAlert,
                presenting: viewModel.scannerAlert,
                actions: { alert in
                    Button(alert.dismissButtonTitle) {
                        viewModel.scannerAlert = nil
                    }
                },
                message: { alert in
                    Text(alert.message)
                }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BarcodeScannerView()
    }
}
