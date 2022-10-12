
import UIKit
import PhotosUI
import MobileCoreServices

class FilePicker:NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imageSelected: ((UIImage?) ->())? = nil
    var filesSelected: (([URL]?) ->())? = nil
    
    func openImagePicker(from parent: UIViewController, callBack imageSelected: @escaping ((UIImage?) ->()))
    {
        let alert = UIAlertController(title: "Choose Image", message: "Please select an image source", preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { (action) in
            self.openImagePicker(from: parent, sourceType: .camera)
        }
        let photosAction = UIAlertAction(title: "Photos", style: .default) { (action) in
            self.openImagePicker(from: parent, sourceType: .photoLibrary)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            alert.addAction(cameraAction)
        }
        alert.addAction(photosAction)
        alert.addAction(cancelAction)
        self.imageSelected = imageSelected
        parent.present(alert, animated: true, completion: nil)
    }
    
    func openImageUrlPicker(from parent: UIViewController, callBack filesSelected: @escaping (([URL]?) ->()))
    {
        let alert = UIAlertController(title: "Choose Image", message: "Please select an image source", preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { (action) in
            self.openImagePicker(from: parent, sourceType: .camera)
        }
        let photosAction = UIAlertAction(title: "Photos", style: .default) { (action) in
            self.openImagePicker(from: parent, sourceType: .photoLibrary)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            alert.addAction(cameraAction)
        }
        alert.addAction(photosAction)
        alert.addAction(cancelAction)
        self.filesSelected = filesSelected
        parent.present(alert, animated: true, completion: nil)
    }
    
    func openImageAndFilePicker(from parent: UIViewController, callBack filesSelected: @escaping (([URL]?) ->()))
    {
        let alert = UIAlertController(title: "Choose File", message: "Please select a file source", preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { (action) in
            self.openImagePicker(from: parent, sourceType: .camera)
        }
        let photosAction = UIAlertAction(title: "Photos", style: .default) { (action) in
            self.openImagePicker(from: parent, sourceType: .photoLibrary)
        }
        let pdfAction = UIAlertAction(title: "PDF", style: .default) { (action) in
            self.attachDocument(from: parent, callBack: filesSelected)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            alert.addAction(cameraAction)
        }
        alert.addAction(photosAction)
        alert.addAction(pdfAction)
        alert.addAction(cancelAction)
        self.filesSelected = filesSelected
        parent.present(alert, animated: true, completion: nil)
    }
    
    func openFilePicker(from parent: UIViewController, callBack filesSelected: @escaping (([URL]?) ->()))
    {
        let alert = UIAlertController(title: "Choose File", message: "Please select a file source", preferredStyle: .actionSheet)
        let pdfAction = UIAlertAction(title: "PDF", style: .default) { (action) in
            self.attachDocument(from: parent, callBack: filesSelected)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(pdfAction)
        alert.addAction(cancelAction)
        self.filesSelected = filesSelected
        parent.present(alert, animated: true, completion: nil)
    }
    
    private func openImagePicker(from parent: UIViewController, sourceType: UIImagePickerController.SourceType)
    {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = sourceType
        imagePickerController.allowsEditing = false
        parent.present(imagePickerController, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage{
            imageSelected?(image)
        } else {
            imageSelected?(nil)
            picker.dismiss(animated: true)
            return
        }
       
        if let url = info[.imageURL] as? URL{
            filesSelected?([url])
        } else {
            filesSelected?(nil)
            picker.dismiss(animated: true)
            return
        }
       
        picker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        imageSelected?(nil)
        filesSelected?(nil)
        print("cancel pressed")
        picker.dismiss(animated: true, completion: nil)
    }
}

extension FilePicker: UIDocumentPickerDelegate {
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        self.filesSelected?(urls)
    }

     func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    private func attachDocument(from parent: UIViewController, callBack filesSelected: @escaping (([URL]?) ->())) {
        if #available(iOS 14.0, *) {
            let types = [UTType.pdf]
            let importMenu = UIDocumentPickerViewController(forOpeningContentTypes: types)

            importMenu.allowsMultipleSelection = false

            importMenu.delegate = self
            importMenu.modalPresentationStyle = .formSheet
            self.filesSelected = filesSelected
            parent.present(importMenu, animated: true)
        } else {
            let types = [kUTTypePDF]
            let importMenu = UIDocumentPickerViewController(documentTypes: types as [String], in: .import)

            importMenu.allowsMultipleSelection = false

            importMenu.delegate = self
            importMenu.modalPresentationStyle = .formSheet
            self.filesSelected = filesSelected
            parent.present(importMenu, animated: true)
        }
    }
}
