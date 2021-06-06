//
//  PhotoRegistrationViewController.swift
//  Soyeon
//
//  Created by 이재은 on 2021/02/07.
//  Copyright (c) 2021 ludus. All rights reserved.
//

import UIKit
import Photos

//protocol PhotoRegistrationViewControllerInput: PhotoRegistrationPresenterOutput {
//
//}
//
//protocol PhotoRegistrationViewControllerOutput {
//
//    func doSomething()
//}

final class PhotoRegistrationViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet private weak var guidanceButton: UIButton!
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var mainProfileView: UIView!
    @IBOutlet private weak var mainProfileImageView: UIImageView!
    @IBOutlet private weak var completeButton: UIButton!

    private enum ViewMetrics {
        static let cellCornerRadius: CGFloat = 4
        static let buttonCornerRadius: CGFloat = 23
        static let cellBorderWidth: CGFloat = 1
    }

    // MARK: - Property

    //    var output: PhotoRegistrationViewControllerOutput!
    var router: PhotoRegistrationRouterProtocol!

    let imagePickerController = UIImagePickerController()
    var userImages = [UIImage]() {
        didSet {
            //            collectionView.reloadData()
            if userImages.count == 1 {
                mainProfileImageView.image = userImages.first
                mainProfileView.isHidden = false
            }
        }
    }
    var maxImageCount: Int = 10

    // MARK: - Initializers

    init(configurator: PhotoRegistrationConfigurator = PhotoRegistrationConfigurator.shared) {
        super.init(nibName: nil, bundle: nil)

        configure()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        configure()
    }

    // MARK: - Configurator

    private func configure(configurator: PhotoRegistrationConfigurator = PhotoRegistrationConfigurator.shared) {

        configurator.configure(viewController: self)
    }

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(UINib(nibName: String(describing: ProfileCollectionViewCell.self), bundle: .main),
                                forCellWithReuseIdentifier: String(describing: ProfileCollectionViewCell.self))

        //        doSomethingOnLoad()
        setupLayout()
        imagePickerController.delegate = self
    }

    // MARK: - IBAction

    @IBAction private func guidanceButtonDidTap(_ sender: UIButton) {
        router.navigationToGuidance()
    }

    @IBAction private func completeButtonDidTap(_ sender: UIButton) {
        // 이미지 저장
        router.navigationToIdealType()
    }

    @IBAction private func mainProfileImageDidTap(_ sender: UIControl) {
        presentSelectView()
    }

    // MARK: - Load data

    //    func doSomethingOnLoad() {
    //
    //        output.doSomething()
    //    }

    private func setupLayout() {
        mainProfileView.layer.borderWidth = ViewMetrics.cellBorderWidth
        mainProfileView.layer.borderColor = Colors.soyeonBlue.cgColor()
        mainProfileView.setRadius(ViewMetrics.cellCornerRadius)
        completeButton.setRadius(ViewMetrics.buttonCornerRadius)
        completeButton.clipsToBounds = true
        completeButton.setTitleColor(.white, for: .normal)
        completeButton.setTitleColor(UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1.0), for: .disabled)
        completeButton.setBackgroundColor(UIColor(named: "soyeonBlue")!, for: .normal)
        completeButton.setBackgroundColor(UIColor(named: "buttonDisabled")!, for: .disabled)
    }

    /// 카메라/앨범 선택 뷰 띄움
    private func presentSelectView() {
        if let selectView = storyboard?
            .instantiateViewController(withIdentifier: "ImagePickerSelectViewController") as? ImagePickerSelectViewController {
            selectView.modalPresentationStyle = .overCurrentContext
            selectView.delegate = self
            present(selectView, animated: false, completion: nil)
        }
    }

    /// PHPhotoLibrary 접근 권한 상태 확인
    private func checkPHPhotoLibraryAuthorization(_ sourceType: UIImagePickerController.SourceType) {
        if #available(iOS 14.0, *) {
            let status = PHPhotoLibrary.authorizationStatus(for: .readWrite)
            processAuthorization(status, sourceType)
        } else {
            let status = PHPhotoLibrary.authorizationStatus()
            processAuthorization(status, sourceType)
        }
    }

    /// PHPhotoLibrary 접근 권한별 처리
    private func processAuthorization(_ status: PHAuthorizationStatus,
                                      _ sourceType: UIImagePickerController.SourceType) {
        switch status {
        case .notDetermined:
            requestPHPhotoLibraryAuthorization(sourceType) {
                self.presentImagePicker(sourceType)
            }
        case .restricted, .denied:
            handleDeniedAlbumsAuthorization()
        case .authorized, .limited:
            presentImagePicker(sourceType)
        @unknown default:
            break
        }
    }

    /// PHPhotoLibrary 접근 권한 요청
    private func requestPHPhotoLibraryAuthorization(_ sourceType: UIImagePickerController.SourceType,
                                                    completion: @escaping () -> Void) {
        if #available(iOS 14.0, *) {
            PHPhotoLibrary.requestAuthorization(for: .readWrite) { status in
                switch status {
                case .limited:
                    completion()
                default:
                    self.processAuthorization(status, sourceType)
                }
            }
        } else {
            PHPhotoLibrary.requestAuthorization { [weak self] status in
                self?.processAuthorization(status, sourceType)
            }
        }
    }

    // 카메라나 사진 선택 화면을 띄움
    private func presentImagePicker(_ sourceType: UIImagePickerController.SourceType) {
        imagePickerController.allowsEditing = true
        DispatchQueue.main.async {
            if sourceType == .camera {
                self.imagePickerController.sourceType = .camera
            } else if sourceType == .photoLibrary {
                self.imagePickerController.sourceType = .savedPhotosAlbum
            }
            self.present(self.imagePickerController, animated: true, completion: nil)
        }
    }

    /// 앨범 접근 권한 거부 상태시 처리
    private func handleDeniedAlbumsAuthorization() {
        // 에러 팝업?
        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
    }
}

// MARK: - PhotoRegistrationPresenterOutput

//extension PhotoRegistrationViewController: PhotoRegistrationViewControllerInput {
//
//    // MARK: - Display logic
//
//    func displaySomething(response viewModel: PhotoRegistrationViewModel) {
//
//    }
//}

// MARK: - UICollectionViewDataSource
extension PhotoRegistrationViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        if userImages.count < 4 {
            return 3
        } else if userImages.count == maxImageCount {
            return maxImageCount - 1
        } else {
            return userImages.count
        }
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let profileCell = collectionView
                .dequeueReusableCell(withReuseIdentifier: ProfileCollectionViewCell.reuseIdentifier,
                                     for: indexPath) as? ProfileCollectionViewCell else {
            return UICollectionViewCell()
        }

        if !completeButton.isEnabled && userImages.count > 1 {
            completeButton.isEnabled = true
        }

        let index = indexPath.row
        let image = userImages[safe: index + 1]
        profileCell.setProperties(index: index, profileImage: image)

        return profileCell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension PhotoRegistrationViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        let cellSize = (view.bounds.width - 86) / 3
        return CGSize(width: cellSize, height: cellSize)
    }
}

// MARK: - UICollectionViewDelegate
extension PhotoRegistrationViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        presentSelectView()
    }
}

// MARK: - UIImagePickerControllerDelegate
extension PhotoRegistrationViewController: ImagePickerSelectDelegate {
    func selectSourceType(_ sourceType: UIImagePickerController.SourceType) {
        checkPHPhotoLibraryAuthorization(sourceType)
    }
}

// MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate
extension PhotoRegistrationViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let image = info[.originalImage] as? UIImage {
            userImages.append(image.resize(targetWidth: UIScreen.main.bounds.width))
        } else if let image = info[.editedImage] as? UIImage {
            userImages.append(image.resize(targetWidth: UIScreen.main.bounds.width))
        }
        collectionView.reloadData()
        dismiss(animated: true, completion: nil)
    }
}

// 뷰 애드타겟 -> 갤러리/카메라 알럿 -> 사진 가져오기 -> 크롭 -> 이미지 뿌리기
// 셀디드셀렉트 -> 같음
// 필수 체크 -> 필수 두개 넣으면 완료 버튼 enabled
// 3번째 셀까지 들어가면 셀하나씩 늘리기
// 9개까지만 제한
// 이미지 저장

// cell count
// 3 3 3 3 3 4 5 6 7 8 9
// images
// 0 1 2 3 4 5 6 7 8 9 10

// 셀 크기
// 사진등록 가이드보기 버튼 오토레이아웃
