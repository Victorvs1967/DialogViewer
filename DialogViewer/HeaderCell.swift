//
//  HeaderCell.swift
//  DialogViewer
//
//  Created by Victor Smirnov on 06/12/2017.
//  Copyright © 2017 Victor Smirnov. All rights reserved.
//

import UIKit

class HeaderCell: ContentCell {
  
  override class func defaultFont() -> UIFont {
    return UIFont.preferredFont(forTextStyle: .headline)
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    label.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.8, alpha: 1.0)
    label.textColor = .black
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
