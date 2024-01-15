import UIKit

extension ViewController: UITextFieldDelegate {

    // checks for text changes in the text field
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let resultText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? "" // calculate new text

        if string.rangeOfCharacter(from: CharacterSet.alphanumerics.inverted) != nil && !string.isEmpty { // alphanumeric characters only
            return false // non-alphanumeric input reject
        }

        updateRightIcon(for: textField, with: resultText) // update right icon based on text
        
        return true
    }
    
    // updates the right icon based on validation criteria
    private func updateRightIcon(for textField: UITextField, with text: String) {
        let usernameIsValid = textField == textFieldUsername && text.count >= 8 // validate username, min 8 char
        let passwordIsValid = textField == textFieldPassword && text.count >= 8 && text.contains(where: { $0.isNumber }) // validate password, min 8 char & 1 digit
        
        if usernameIsValid || passwordIsValid { // set or remove check icon
            setCheckmarkIcon(for: textField)
        } else {
            textField.rightView = nil
        }
    }

    // sets a check icon for the text field
    private func setCheckmarkIcon(for textField: UITextField) {
        let checkImage = UIImage(systemName: "checkmark.circle.fill")?.withTintColor(.systemGreen, renderingMode: .alwaysOriginal)
        textField.setRightIcon(checkImage!) // apply the check icon
    }

    // handles return key press in text field
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == textFieldUsername {
            textFieldPassword.becomeFirstResponder() // switch to password field
        } else if textField == textFieldPassword {
            textFieldPassword.resignFirstResponder() // dismiss keyboard, todo - login action
        }
        return true
    }
}
