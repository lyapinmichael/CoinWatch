//
//  String+Localized.swift
//  CoinWatch
//
//  Created by Ляпин Михаил on 01.10.2023.
//

import Foundation

extension String {
    
    var localized: Self {
        return NSLocalizedString(self, comment: "")
    }
    
}
