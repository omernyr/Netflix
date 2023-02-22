//
//  Extensions.swift
//  Netflix Clone
//
//  Created by macbook pro on 22.02.2023.
//

import UIKit

extension String {  
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
