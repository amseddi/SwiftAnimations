//
//  ShareButton.swift
//  Animations
//
//  Created by Octo-RCO on 17/03/2017.
//  Copyright © 2017 Octo-RCO. All rights reserved.
//

import Foundation
import UIKit

protocol ShareButtonDelegate: class {
  
}

class ShareButton: UIView, Animatable {
  // *********************************************************************
  // MARK: - Constants
  private let shareLabel = "Share"
  private let openningEase = CAMediaTimingFunction(controlPoints: 0.8, 0, 0.7, 1)
  
  // *********************************************************************
  // MARK: - IBOutlet
  @IBOutlet weak var whiteButton: UIButton! {
    didSet {
      whiteButton.titleLabel?.font = UIFont.systemFont(ofSize: 17.0, weight: UIFontWeightThin)
      whiteButton.setTitle(shareLabel, for: .normal)
      whiteButton.setTitleColor(UIColor(red: 193.0/255.0, green: 193.0/255.0, blue: 193.0/255.0, alpha: 1.0), for: .normal)
      whiteButton.layer.cornerRadius = whiteButton.layer.bounds.height * 0.5
    }
  }
  
  // *********************************************************************
  // MARK: - Properties
  weak var delegate: ShareButtonDelegate?
  
  // *********************************************************************
  // MARK: - Lifecycle
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    configure()
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    configure()
  }
  
  // *********************************************************************
  // MARK: - Private func
  private func configure() {
    layer.cornerRadius = layer.bounds.height * 0.5
  }
  
  private func openBox() {
    whiteButton.layer.anchorPoint = CGPoint(x: 0.5, y: 0)
    whiteButton.layer.position = CGPoint(x: whiteButton.layer.position.x,
                                         y: 0)
    let open = buildKeyFrameAnimation(keyPath: "transform.rotation.x",
                                      values: [0.0, M_PI_2],
                                      keyTimes: [0.0, 1.0],
                                      duration: 0.5,
                                      delegate: self,
                                      timingFunctions: [openningEase])
    whiteButton.layer.add(open, forKey: "open")
    whiteButton.layer.transform = CATransform3DRotate(CATransform3DIdentity, CGFloat(M_PI_2), 1.0, 0.0, 0.0)
  }
  
  // *********************************************************************
  // MARK: - IBAction
  @IBAction func whiteButtonDidTap(_ sender: UIButton) {
    openBox()
  }
}
