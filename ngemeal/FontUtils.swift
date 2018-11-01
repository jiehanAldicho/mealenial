//
//  FontUtils.swift
//  StyleTheory
//
//  Created by dennis farandy on 8/22/16.
//  Copyright © 2016 StyleTheoryTechnologies. All rights reserved.
//

import Foundation
import UIKit

let fontUtils = FontUtils()

@objc class FontType: NSObject {
    let size: CGFloat

    init(size: CGFloat) {
        self.size = size
    }

    private(set) lazy var heavyBold: UIFont = {
        guard let font = UIFont(name: "TTNorms-Bold", size: self.size) else {
            return UIFont.systemFont(ofSize: self.size)
        }
        return font
    }()
    
    private(set) lazy var bold: UIFont = {
        guard let font = UIFont(name: "TTNorms-Medium", size: self.size) else {
            return UIFont.systemFont(ofSize: self.size)
        }
        return font
    }()

    private(set) lazy var regular: UIFont = {
        guard let font = UIFont(name: "TTNorms-Regular", size: self.size) else {
            return UIFont.systemFont(ofSize: self.size)
        }
        return font
    }()

    private(set) lazy var light: UIFont = {
        guard let font = UIFont(name: "TTNorms-Light", size: self.size) else {
            return UIFont.systemFont(ofSize: self.size)
        }
        return font
    }()

    private(set) lazy var extraLight: UIFont = {
        guard let font = UIFont(name: "TTNorms-ExtraLight", size: self.size) else {
            return UIFont.systemFont(ofSize: self.size)
        }
        return font
    }()

    private(set) lazy var italic: UIFont = {
        guard let font = UIFont(name: "TTNorms-Italic", size: self.size) else {
            return UIFont.systemFont(ofSize: self.size)
        }
        return font
    }()
}

@objc class FontUtils: NSObject {
    fileprivate override init() {
        super.init()
    }

    // support objc
    @objc class func sharedInstance() -> FontUtils {
        return fontUtils
    }

    private(set) lazy var size32: FontType = {
        return FontType(size: 32)
    }()

    private(set) lazy var size24: FontType = {
        return FontType(size: 24)
    }()

    private(set) lazy var size22: FontType = {
        return FontType(size: 22)
    }()

    private(set) lazy var size20: FontType = {
        return FontType(size: 20)
    }()

    private(set) lazy var size18: FontType = {
        return FontType(size: 18)
    }()
    
    private(set) lazy var size16: FontType = {
        return FontType(size: 16)
    }()

    private(set) lazy var size14: FontType = {
        return FontType(size: 14)
    }()

    private(set) lazy var size12: FontType = {
        return FontType(size: 12)
    }()

    private(set) lazy var size11: FontType = {
        return FontType(size: 11)
    }()

    private(set) lazy var size10: FontType = {
        return FontType(size: 10)
    }()

    private(set) lazy var size8: FontType = {
        return FontType(size: 8)
    }()
}
