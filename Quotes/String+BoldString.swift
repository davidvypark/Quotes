//
//  String+BoldString.swift
//  Wandr
//
//  Created by Matt Amerige on 7/25/16.
//  Copyright © 2016 David Park. All rights reserved.
//

import UIKit

extension String {
    
    var boldedAttributedString: NSMutableAttributedString {
        let boldedString = NSMutableAttributedString(string: self,
                                                     attributes: [NSFontAttributeName:UIFont.systemFontOfSize(UIFont.systemFontSize())])
        let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFontOfSize(UIFont.systemFontSize())]
        
        boldedString.addAttributes(boldFontAttribute, range: NSMakeRange(0, self.characters.count))
        
        return boldedString
	}
}