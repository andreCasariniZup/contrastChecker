//
//  ContrastTestes.swift
//  ConstrastCheckerTesteTests
//
//  Created by Andre Casarini on 30/01/23.
//

import Foundation
@testable import ConstrastCheckerTeste
import XCTest

class ContrastCheckerTests: XCTestCase {
    
    func testConstrastCheckerView() {
        let constrastCheckerView = ButtonContrastCheckerView()
        checkContrastOfElements(in: constrastCheckerView)
    }
    
    func testContrastOfTableView() {
        let contrastCheck = ElementsTableViewController()
        checkContrastOfElements(in: contrastCheck.view)
    }
    
    func checkContrastOfElements(in view: UIView) {
        for subview in view.subviews {
            if let button = subview as? UIButton,
               let backgroundColor = button.backgroundColor?.toHex,
               let titleColor = button.titleColor(for: .normal)?.toHex {
                checkContrast(element: button, backgroundColor: backgroundColor, foregroundColor: titleColor)
            } else if let label = subview as? UILabel,
                      let backgroundColor = view.backgroundColor?.toHex
                       {
                let textColor = label.textColor.toHex
                checkContrast(element: label, backgroundColor: backgroundColor, foregroundColor: textColor)
            } else if let tableView = subview as? UITableView,
                      let backgroundColor = tableView.backgroundColor?.toHex,
                      let cellBackgroundColor = tableView.backgroundColor?.toHex {
                checkContrast(element: tableView, backgroundColor: backgroundColor, foregroundColor: cellBackgroundColor)
            } else {
                checkContrastOfElements(in: subview)
            }
        }
    }
    
    func checkContrast(element: Any, backgroundColor: String, foregroundColor: String) {
        let url = URL(string: "https://webaim.org/resources/contrastchecker/?fcolor=\(foregroundColor)&bcolor=\(backgroundColor)&api")!
        let semaphore = DispatchSemaphore(value: 0)
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                XCTFail("Error fetching data from API: \(error.localizedDescription)")
                return
            }
            guard let data = data else {
                XCTFail("No data returned from API")
                return
            }
            do {
                let contrastChecker = try JSONDecoder().decode(ContrastChecker.self, from: data)
                print("Contrast ratio for text: \(contrastChecker.ratio)")
                print("AA: \(contrastChecker.aa)")
                print("AALarge: \(contrastChecker.aaLarge)")
                print("AAA: \(contrastChecker.aaa)")
                print("AAALarge: \(contrastChecker.aaaLarge)")
                XCTAssertTrue(contrastChecker.aa == "pass", "Constraste falhou para elemento \(element)")
                XCTAssertTrue(contrastChecker.aaLarge == "pass", "Constraste falhou para elemento \(element)")
                XCTAssertTrue(contrastChecker.aaa == "pass", "Constraste falhou para elemento \(element)")
                XCTAssertTrue(contrastChecker.aaaLarge == "pass", "Constraste falhou para elemento \(element)")
            } catch {
                XCTFail("Error decoding data: \(error.localizedDescription)")
            }
            semaphore.signal()
        }.resume()
        semaphore.wait()
    }
    
}
