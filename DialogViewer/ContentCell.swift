//
//  ContetntCell.swift
//  DialogViewer
//
//  Created by Victor Smirnov on 05/12/2017.
//  Copyright © 2017 Victor Smirnov. All rights reserved.
//

import UIKit

class ContentCell: UICollectionViewCell {
  
  var label: UILabel!
  var text: String! {
    get {
      return label.text
    }
    set(newText) {
      label.text = newText
      var newLabelFrame = label.frame
      var newContentFrame = contentView.frame
      let textSize = type(of: self).sizeForContentString(s: newText, forMafWidth: maxWidth)
      newLabelFrame.size = textSize
      newContentFrame.size = textSize
      label.frame = newLabelFrame
      contentView.frame = newContentFrame
    }
  }
  var maxWidth: CGFloat!
  
  class func sizeForContentString(s: String, forMafWidth maxWidth: CGFloat) -> CGSize {
    let maxSize = CGSize(width: maxWidth, height: 1000.0)
    let ops = NSStringDrawingOptions.usesLineFragmentOrigin
    let style = NSMutableParagraphStyle()
    style.lineBreakMode = .byCharWrapping
    let attributes = [NSAttributedStringKey.font: defaultFont(), NSAttributedStringKey.paragraphStyle: style]
    let string = s as NSString
    let rect = string.boundingRect(with: maxSize, options: ops, attributes: attributes, context: nil)
    return rect.size
  }
  
  class func defaultFont() -> UIFont {
    return UIFont.preferredFont(forTextStyle: .body)
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    label = UILabel(frame: self.contentView.bounds)
    label.isOpaque = false
    label.backgroundColor = UIColor(red: 0.8, green: 0.9, blue: 1.0, alpha: 1.0)
    label.textColor = .black
    label.textAlignment = .center
    label.font = type(of: self).defaultFont()
    contentView.addSubview(label)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
