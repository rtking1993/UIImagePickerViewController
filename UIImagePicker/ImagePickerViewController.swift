import UIKit

// MARK: ImagePickerViewController

class ImagePickerViewController: UIViewController {

    // MARK: Outlets

    @IBOutlet var cameraButton: UIButton!
    @IBOutlet var libraryButton: UIButton!
    @IBOutlet var mainImageView: UIImageView!

    // MARK: IBAction Methods
    
    @IBAction func camera(sender: Any?) {
        presentUIImagePicker(sourceType: .camera)
    }
    
    @IBAction func library(sender: Any?) {
        presentUIImagePicker(sourceType: .photoLibrary)
    }
    
    // MARK: Helper Methods

    private func presentUIImagePicker(sourceType: UIImagePickerControllerSourceType) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = sourceType
        present(picker, animated: true, completion: nil)
    }
}

// MARK: UIImagePickerControllerDelegate and UINavigationControllerDelegate

extension ImagePickerViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]) {
        guard let chosenImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            dismiss(animated: true, completion: nil)
            return
        }
        mainImageView.image = chosenImage
        dismiss(animated: true, completion: nil)
    }
    
    @objc func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}

