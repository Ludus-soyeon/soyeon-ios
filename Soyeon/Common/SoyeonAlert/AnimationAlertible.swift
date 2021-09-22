//
//  AnimationAlertible.swift
//  Soyeon
//
//  Created by 박은비 on 2021/09/22.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit
 
// MARK: - AnimationAlertible
protocol AnimationAlertible: Alertible {
  
  typealias ShowCompletionType = () -> Void
  typealias DismissCompletionType  = () -> Void
  
  func prepareAlertView()
  
  func show(to superview: UIView, with animation: AlertAnimationStyle, completion: ShowCompletionType?)
   
  func dismissAnimation(with animation: AlertAnimationStyle, completion: DismissCompletionType?)
}

extension AnimationAlertible where Self: XibLoadable {
  
  func prepareAlertView() {
      backgroundView.alpha = 0.0
      contentView.alpha = 0.0
  }
  
}

extension AnimationAlertible {
  
    func show(to superview: UIView, with animation: AlertAnimationStyle, completion: ShowCompletionType? = nil) {
        
        prepareAlertView()
        
        show(to: superview)
        
        animation.rawValue.showAnimation(target: (backgroundView, contentView)) {
            completion?()
        }
    }
    
  func dismissAnimation(with animation: AlertAnimationStyle, completion: DismissCompletionType? = nil) {
      
      animation.rawValue.hideAnimation(target: (backgroundView, contentView)) {
          
          completion?()
          
          self.dismiss()
          
      }
  }
}

extension AnimationAlertible where BackgroundViewType == TapDismissibleAlertView {
  
  func dismissAnimation(with animation: AlertAnimationStyle, completion: DismissCompletionType? = nil) {
      
      animation.rawValue.hideAnimation(target: (backgroundView, contentView)) {
          
          completion?()
          
          self.dismiss()
          
      }
  }
  
}
 
// MARK: - AnimationDefinable: Animation을 정의할때 지켜야할 규약
protocol AnimationDefinable {
  typealias AlertType = (background: UIView, content: UIView)
  static func showAnimation(target alert: AlertType, finish: @escaping () -> Void)
  static func hideAnimation(target alert: AlertType, finish: @escaping () -> Void)
}

struct AlphaAnimation: AnimationDefinable {
  static func showAnimation(target alert: AlertType, finish: @escaping () -> Void) {
      
      UIView.animate(withDuration: 0.3) {
          
          alert.background.alpha = 1.0
          alert.content.alpha = 1.0
          
      } completion: { _ in
          
          finish()
          
      }

  }
  
  static func hideAnimation(target alert: AlertType, finish: @escaping () -> Void) {
      UIView.animate(withDuration: 0.3) {
          
          alert.background.alpha = 0.0
          alert.content.alpha = 0.0
          
      } completion: { _ in
          
          finish()
          
      }
  }
}

// MARK: - AlertAnimationStyle: 정의된 Animation style 열거.
enum AlertAnimationStyle {
  case alpha
}

extension AlertAnimationStyle: RawRepresentable {
  
  typealias RawValue = AnimationDefinable.Type
  
  var rawValue: AnimationDefinable.Type {
      switch self {
      case .alpha: return AlphaAnimation.self
      }
  }
  
  init?(rawValue: RawValue) {
      switch rawValue {
      case is AlphaAnimation.Type:
          self = .alpha
      default:
          return nil
      }
  }
}
