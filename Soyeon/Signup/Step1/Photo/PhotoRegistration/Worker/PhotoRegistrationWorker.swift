//
//  PhotoRegistrationWorker.swift
//  Soyeon
//
//  Created by 이재은 on 2021/02/07.
//  Copyright (c) 2021 ludus. All rights reserved.
//

import UIKit
import Photos

class PhotoRegistrationWorker {

    let imagePickerController = UIImagePickerController()
    // imagePickerController.delegate = self 
    // MARK: - Business Logic
    //    func requestPHPhotoLibraryAuthorization(completion: @escaping () -> Void) {
    //        if #available(iOS 14.0, *) {
    //            PHPhotoLibrary.requestAuthorization(for: .readWrite) { status in
    //                switch status {
    //                case .limited:
    //                    completion()
    //                default:
    //                    self.processAuthorization(status: status)
    //                }
    //            }
    //        } else {
    //            PHPhotoLibrary.requestAuthorization { [weak self] status in
    //                self?.processAuthorization(status: status)
    //            }
    //        }
    //    }

    func openCamera(_ completion: @escaping (_ isSuccess: Bool) -> Void) {
        switch PHPhotoLibrary.authorizationStatus() {
        case .authorized, .limited:
            completion(true)
        case .denied, .restricted:
            completion(false)
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization ({ state in
                if state == .authorized {
                    //                    UIImagePickerController.SourceType = .camera
                    //                    present(UIImagePickerController, animated: true, completion: nil)
                } else {
                    //                    dismiss(animated: true, completion: nil)
                }
            })
            //            PHPhotoLibrary.requestAuthorization { granted in
            //                if granted {
            //                    completion(true)
            //                } else {
            completion(false)
        //                }
        //            }
        default:
            completion(false)
        }
    }

    /// 갤러리 접근 권한 상태 확인
    func checkAuthorization() {
        if #available(iOS 14.0, *) {
            let status = PHPhotoLibrary.authorizationStatus(for: .readWrite)
            processAuthorization(status: status)
        } else {
            let status = PHPhotoLibrary.authorizationStatus()
            processAuthorization(status: status)
        }
    }

    /// 갤러리 접근 권한별 처리
    func processAuthorization(status: PHAuthorizationStatus) {
        switch status {
        case .notDetermined:
            requestPHPhotoLibraryAuthorization {
                self.showSelectPhotoVC()
            }
        case .restricted, .denied:
            handleDeniedAlbumsAuthorization()
        case .authorized, .limited:
            showSelectPhotoVC()
        @unknown default:
            break
        }
    }

    /// 갤러리 접근 권한 요청
    func requestPHPhotoLibraryAuthorization(completion: @escaping () -> Void) {
        if #available(iOS 14.0, *) {
            PHPhotoLibrary.requestAuthorization(for: .readWrite) { status in
                switch status {
                case .limited:
                    completion()
                default:
                    self.processAuthorization(status: status)
                }
            }
        } else {
            PHPhotoLibrary.requestAuthorization { [weak self] status in
                self?.processAuthorization(status: status)
            }
        }
    }

    /// 사진 선택 화면 띄움
    func showSelectPhotoVC() {
        //        DispatchQueue.main.async {
        //            if let selectPhotoVC = UIStoryboard(name: "Chatting", bundle: Bundle.main)
        //                .instantiateViewController(withIdentifier: "VGSelectPhotoViewController") as? VGSelectPhotoViewController {
        //                //                self.parent?.navigationController?.pushViewController(selectPhotoVC, animated: true)
        //                self.navigationController?.pushViewController(selectPhotoVC, animated: true)
        //                selectPhotoVC.delegate = self
        //            }
        //        }
    }

    /// 앨범 접근 권한 거부 상태시 처리
    func handleDeniedAlbumsAuthorization() {
        // 에러 팝업?
        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
    }
}
