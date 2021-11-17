//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap { Locale(identifier: $0) } ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)

  /// Find first language and bundle for which the table exists
  fileprivate static func localeBundle(tableName: String, preferredLanguages: [String]) -> (Foundation.Locale, Foundation.Bundle)? {
    // Filter preferredLanguages to localizations, use first locale
    var languages = preferredLanguages
      .map { Locale(identifier: $0) }
      .prefix(1)
      .flatMap { locale -> [String] in
        if hostingBundle.localizations.contains(locale.identifier) {
          if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
            return [locale.identifier, language]
          } else {
            return [locale.identifier]
          }
        } else if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
          return [language]
        } else {
          return []
        }
      }

    // If there's no languages, use development language as backstop
    if languages.isEmpty {
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages = [developmentLocalization]
      }
    } else {
      // Insert Base as second item (between locale identifier and languageCode)
      languages.insert("Base", at: 1)

      // Add development language as backstop
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages.append(developmentLocalization)
      }
    }

    // Find first language for which table exists
    // Note: key might not exist in chosen language (in that case, key will be shown)
    for language in languages {
      if let lproj = hostingBundle.url(forResource: language, withExtension: "lproj"),
         let lbundle = Bundle(url: lproj)
      {
        let strings = lbundle.url(forResource: tableName, withExtension: "strings")
        let stringsdict = lbundle.url(forResource: tableName, withExtension: "stringsdict")

        if strings != nil || stringsdict != nil {
          return (Locale(identifier: language), lbundle)
        }
      }
    }

    // If table is available in main bundle, don't look for localized resources
    let strings = hostingBundle.url(forResource: tableName, withExtension: "strings", subdirectory: nil, localization: nil)
    let stringsdict = hostingBundle.url(forResource: tableName, withExtension: "stringsdict", subdirectory: nil, localization: nil)

    if strings != nil || stringsdict != nil {
      return (applicationLocale, hostingBundle)
    }

    // If table is not found for requested languages, key will be shown
    return nil
  }

  /// Load string from Info.plist file
  fileprivate static func infoPlistString(path: [String], key: String) -> String? {
    var dict = hostingBundle.infoDictionary
    for step in path {
      guard let obj = dict?[step] as? [String: Any] else { return nil }
      dict = obj
    }
    return dict?[key] as? String
  }

  static func validate() throws {
    try intern.validate()
  }

  #if os(iOS) || os(tvOS)
  /// This `R.storyboard` struct is generated, and contains static references to 2 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `MyPage`.
    static let myPage = _R.storyboard.myPage()

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "MyPage", bundle: ...)`
    static func myPage(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.myPage)
    }
    #endif

    fileprivate init() {}
  }
  #endif

  /// This `R.color` struct is generated, and contains static references to 5 colors.
  struct color {
    /// Color `AccentColor`.
    static let accentColor = Rswift.ColorResource(bundle: R.hostingBundle, name: "AccentColor")
    /// Color `background`.
    static let background = Rswift.ColorResource(bundle: R.hostingBundle, name: "background")
    /// Color `disabled`.
    static let disabled = Rswift.ColorResource(bundle: R.hostingBundle, name: "disabled")
    /// Color `point`.
    static let point = Rswift.ColorResource(bundle: R.hostingBundle, name: "point")
    /// Color `semiBlack`.
    static let semiBlack = Rswift.ColorResource(bundle: R.hostingBundle, name: "semiBlack")

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "AccentColor", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func accentColor(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.accentColor, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "background", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func background(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.background, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "disabled", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func disabled(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.disabled, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "point", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func point(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.point, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "semiBlack", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func semiBlack(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.semiBlack, compatibleWith: traitCollection)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "AccentColor", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func accentColor(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.accentColor.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "background", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func background(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.background.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "disabled", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func disabled(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.disabled.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "point", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func point(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.point.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "semiBlack", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func semiBlack(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.semiBlack.name)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.image` struct is generated, and contains static references to 0 images.
  struct image {
    /// This `R.image.map` struct is generated, and contains static references to 1 images.
    struct map {
      /// Image `defaultMarker`.
      static let defaultMarker = Rswift.ImageResource(bundle: R.hostingBundle, name: "map/defaultMarker")

      #if os(iOS) || os(tvOS)
      /// `UIImage(named: "defaultMarker", bundle: ..., traitCollection: ...)`
      static func defaultMarker(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
        return UIKit.UIImage(resource: R.image.map.defaultMarker, compatibleWith: traitCollection)
      }
      #endif

      /// This `R.image.map.marker` struct is generated, and contains static references to 2 images.
      struct marker {
        /// Image `defaultGhost`.
        static let defaultGhost = Rswift.ImageResource(bundle: R.hostingBundle, name: "map/marker/defaultGhost")
        /// Image `empty`.
        static let empty = Rswift.ImageResource(bundle: R.hostingBundle, name: "map/marker/empty")

        #if os(iOS) || os(tvOS)
        /// `UIImage(named: "defaultGhost", bundle: ..., traitCollection: ...)`
        static func defaultGhost(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
          return UIKit.UIImage(resource: R.image.map.marker.defaultGhost, compatibleWith: traitCollection)
        }
        #endif

        #if os(iOS) || os(tvOS)
        /// `UIImage(named: "empty", bundle: ..., traitCollection: ...)`
        static func empty(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
          return UIKit.UIImage(resource: R.image.map.marker.empty, compatibleWith: traitCollection)
        }
        #endif

        fileprivate init() {}
      }

      /// This `R.image.map.selected` struct is generated, and contains static references to 1 images.
      struct selected {
        /// Image `evil`.
        static let evil = Rswift.ImageResource(bundle: R.hostingBundle, name: "map/selected/evil")

        #if os(iOS) || os(tvOS)
        /// `UIImage(named: "evil", bundle: ..., traitCollection: ...)`
        static func evil(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
          return UIKit.UIImage(resource: R.image.map.selected.evil, compatibleWith: traitCollection)
        }
        #endif

        fileprivate init() {}
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }

    fileprivate init() {}
  }

  fileprivate class Class {}

  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    #if os(iOS) || os(tvOS)
    try storyboard.validate()
    #endif
  }

  #if os(iOS) || os(tvOS)
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      #if os(iOS) || os(tvOS)
      try launchScreen.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try myPage.validate()
      #endif
    }

    #if os(iOS) || os(tvOS)
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController

      let bundle = R.hostingBundle
      let name = "LaunchScreen"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct myPage: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = MyPageViewController

      let bundle = R.hostingBundle
      let myPageViewController = StoryboardViewControllerResource<MyPageViewController>(identifier: "MyPageViewController")
      let name = "MyPage"

      func myPageViewController(_: Void = ()) -> MyPageViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: myPageViewController)
      }

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
        if _R.storyboard.myPage().myPageViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'myPageViewController' could not be loaded from storyboard 'MyPage' as 'MyPageViewController'.") }
      }

      fileprivate init() {}
    }
    #endif

    fileprivate init() {}
  }
  #endif

  fileprivate init() {}
}
