//
//  ScannerViewController.swift
//  barcodeScanner
//
//  Created by Edson Yudi Toma on 23/01/23.
//

import AVFoundation
import UIKit

// MARK: - ScannerDelegate
protocol ScannerDelegate: AnyObject {
    func didFind(barcode: String)
    func didFind(error: ScannerError)
}

// MARK: - ScannerViewController
final class ScannerViewController: UIViewController {
    
    // MARK: - Properties
    private var captureSession: AVCaptureSession?
    private var previewLayer: AVCaptureVideoPreviewLayer?
    
    weak var delegate: ScannerDelegate?
    
    // MARK: - Life cycle
    init(delegate: ScannerDelegate) {
        super.init(nibName: nil, bundle: nil)
        self.delegate = delegate
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCaptureSession()
        setupPreviewLayer()
        captureSession?.startRunning()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        previewLayer?.frame = view.layer.bounds
    }
}

// MARK: - Setups
extension ScannerViewController {
    private func setupCaptureSession() {
        let captureSession = AVCaptureSession()
        let metadataOutput = AVCaptureMetadataOutput()
        
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video),
              let videoInput = try? AVCaptureDeviceInput(device: videoCaptureDevice),
              captureSession.canAddInput(videoInput),
              captureSession.canAddOutput(metadataOutput) else {
            delegate?.didFind(error: .invalidDeviceInput)
            return
        }
        
        captureSession.addInput(videoInput)
        captureSession.addOutput(metadataOutput)
        
        metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        metadataOutput.metadataObjectTypes = [
            .ean8,
            .ean13
        ]
        
        self.captureSession = captureSession
    }
    
    private func setupPreviewLayer() {
        guard let captureSession = captureSession else { return }
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.videoGravity = .resizeAspectFill
        
        view.layer.addSublayer(previewLayer)
        
        self.previewLayer = previewLayer
    }
}

// MARK: - AVCaptureMetadataOutputObjectsDelegate
extension ScannerViewController: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        guard let object = metadataObjects.first as? AVMetadataMachineReadableCodeObject,
              let barcode = object.stringValue else {
            delegate?.didFind(error: .invalidScannedValue)
            return
        }
        
        delegate?.didFind(barcode: barcode)
    }
}
