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
    try font.validate()
    try intern.validate()
  }

  #if os(iOS) || os(tvOS)
  /// This `R.storyboard` struct is generated, and contains static references to 1 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    #endif

    fileprivate init() {}
  }
  #endif

  /// This `R.color` struct is generated, and contains static references to 9 colors.
  struct color {
    /// Color `AccentColor`.
    static let accentColor = Rswift.ColorResource(bundle: R.hostingBundle, name: "AccentColor")
    /// Color `background`.
    static let background = Rswift.ColorResource(bundle: R.hostingBundle, name: "background")
    /// Color `darkGreen`.
    static let darkGreen = Rswift.ColorResource(bundle: R.hostingBundle, name: "darkGreen")
    /// Color `darkGrey`.
    static let darkGrey = Rswift.ColorResource(bundle: R.hostingBundle, name: "darkGrey")
    /// Color `disabled`.
    static let disabled = Rswift.ColorResource(bundle: R.hostingBundle, name: "disabled")
    /// Color `placeholder`.
    static let placeholder = Rswift.ColorResource(bundle: R.hostingBundle, name: "placeholder")
    /// Color `point`.
    static let point = Rswift.ColorResource(bundle: R.hostingBundle, name: "point")
    /// Color `selected`.
    static let selected = Rswift.ColorResource(bundle: R.hostingBundle, name: "selected")
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
    /// `UIColor(named: "darkGreen", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func darkGreen(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.darkGreen, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "darkGrey", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func darkGrey(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.darkGrey, compatibleWith: traitCollection)
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
    /// `UIColor(named: "placeholder", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func placeholder(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.placeholder, compatibleWith: traitCollection)
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
    /// `UIColor(named: "selected", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func selected(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.selected, compatibleWith: traitCollection)
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
    /// `UIColor(named: "darkGreen", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func darkGreen(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.darkGreen.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "darkGrey", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func darkGrey(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.darkGrey.name)
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
    /// `UIColor(named: "placeholder", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func placeholder(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.placeholder.name)
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
    /// `UIColor(named: "selected", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func selected(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.selected.name)
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

  /// This `R.file` struct is generated, and contains static references to 3 files.
  struct file {
    /// Resource file `NotoSansKR-Bold.otf`.
    static let notoSansKRBoldOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "NotoSansKR-Bold", pathExtension: "otf")
    /// Resource file `NotoSansKR-Medium.otf`.
    static let notoSansKRMediumOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "NotoSansKR-Medium", pathExtension: "otf")
    /// Resource file `NotoSansKR-Regular.otf`.
    static let notoSansKRRegularOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "NotoSansKR-Regular", pathExtension: "otf")

    /// `bundle.url(forResource: "NotoSansKR-Bold", withExtension: "otf")`
    static func notoSansKRBoldOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.notoSansKRBoldOtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "NotoSansKR-Medium", withExtension: "otf")`
    static func notoSansKRMediumOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.notoSansKRMediumOtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "NotoSansKR-Regular", withExtension: "otf")`
    static func notoSansKRRegularOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.notoSansKRRegularOtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    fileprivate init() {}
  }

  /// This `R.font` struct is generated, and contains static references to 3 fonts.
  struct font: Rswift.Validatable {
    /// Font `NotoSansKR-Bold`.
    static let notoSansKRBold = Rswift.FontResource(fontName: "NotoSansKR-Bold")
    /// Font `NotoSansKR-Medium`.
    static let notoSansKRMedium = Rswift.FontResource(fontName: "NotoSansKR-Medium")
    /// Font `NotoSansKR-Regular`.
    static let notoSansKRRegular = Rswift.FontResource(fontName: "NotoSansKR-Regular")

    /// `UIFont(name: "NotoSansKR-Bold", size: ...)`
    static func notoSansKRBold(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: notoSansKRBold, size: size)
    }

    /// `UIFont(name: "NotoSansKR-Medium", size: ...)`
    static func notoSansKRMedium(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: notoSansKRMedium, size: size)
    }

    /// `UIFont(name: "NotoSansKR-Regular", size: ...)`
    static func notoSansKRRegular(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: notoSansKRRegular, size: size)
    }

    static func validate() throws {
      if R.font.notoSansKRBold(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'NotoSansKR-Bold' could not be loaded, is 'NotoSansKR-Bold.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.notoSansKRMedium(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'NotoSansKR-Medium' could not be loaded, is 'NotoSansKR-Medium.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.notoSansKRRegular(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'NotoSansKR-Regular' could not be loaded, is 'NotoSansKR-Regular.otf' added to the UIAppFonts array in this targets Info.plist?") }
    }

    fileprivate init() {}
  }

  /// This `R.image` struct is generated, and contains static references to 0 images.
  struct image {
    /// This `R.image.home` struct is generated, and contains static references to 3 images.
    struct home {
      /// Image `btnReview`.
      static let btnReview = Rswift.ImageResource(bundle: R.hostingBundle, name: "home/btnReview")
      /// Image `retrieveBackground`.
      static let retrieveBackground = Rswift.ImageResource(bundle: R.hostingBundle, name: "home/retrieveBackground")
      /// Image `retrieveButtonImage`.
      static let retrieveButtonImage = Rswift.ImageResource(bundle: R.hostingBundle, name: "home/retrieveButtonImage")

      #if os(iOS) || os(tvOS)
      /// `UIImage(named: "btnReview", bundle: ..., traitCollection: ...)`
      static func btnReview(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
        return UIKit.UIImage(resource: R.image.home.btnReview, compatibleWith: traitCollection)
      }
      #endif

      #if os(iOS) || os(tvOS)
      /// `UIImage(named: "retrieveBackground", bundle: ..., traitCollection: ...)`
      static func retrieveBackground(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
        return UIKit.UIImage(resource: R.image.home.retrieveBackground, compatibleWith: traitCollection)
      }
      #endif

      #if os(iOS) || os(tvOS)
      /// `UIImage(named: "retrieveButtonImage", bundle: ..., traitCollection: ...)`
      static func retrieveButtonImage(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
        return UIKit.UIImage(resource: R.image.home.retrieveButtonImage, compatibleWith: traitCollection)
      }
      #endif

      fileprivate init() {}
    }

    /// This `R.image.icon` struct is generated, and contains static references to 13 images.
    struct icon {
      /// Image `icBack`.
      static let icBack = Rswift.ImageResource(bundle: R.hostingBundle, name: "icon/icBack")
      /// Image `icGost`.
      static let icGost = Rswift.ImageResource(bundle: R.hostingBundle, name: "icon/icGost")
      /// Image `icHeart`.
      static let icHeart = Rswift.ImageResource(bundle: R.hostingBundle, name: "icon/icHeart")
      /// Image `icMoreF`.
      static let icMoreF = Rswift.ImageResource(bundle: R.hostingBundle, name: "icon/icMoreF")
      /// Image `icMore`.
      static let icMore = Rswift.ImageResource(bundle: R.hostingBundle, name: "icon/icMore")
      /// Image `icNonGost`.
      static let icNonGost = Rswift.ImageResource(bundle: R.hostingBundle, name: "icon/icNonGost")
      /// Image `icNonHeart`.
      static let icNonHeart = Rswift.ImageResource(bundle: R.hostingBundle, name: "icon/icNonHeart")
      /// Image `icNonProfile`.
      static let icNonProfile = Rswift.ImageResource(bundle: R.hostingBundle, name: "icon/icNonProfile")
      /// Image `icNonSearch`.
      static let icNonSearch = Rswift.ImageResource(bundle: R.hostingBundle, name: "icon/icNonSearch")
      /// Image `icPlus`.
      static let icPlus = Rswift.ImageResource(bundle: R.hostingBundle, name: "icon/icPlus")
      /// Image `icProfile`.
      static let icProfile = Rswift.ImageResource(bundle: R.hostingBundle, name: "icon/icProfile")
      /// Image `icSearch`.
      static let icSearch = Rswift.ImageResource(bundle: R.hostingBundle, name: "icon/icSearch")
      /// Image `icX`.
      static let icX = Rswift.ImageResource(bundle: R.hostingBundle, name: "icon/icX")

      #if os(iOS) || os(tvOS)
      /// `UIImage(named: "icBack", bundle: ..., traitCollection: ...)`
      static func icBack(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
        return UIKit.UIImage(resource: R.image.icon.icBack, compatibleWith: traitCollection)
      }
      #endif

      #if os(iOS) || os(tvOS)
      /// `UIImage(named: "icGost", bundle: ..., traitCollection: ...)`
      static func icGost(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
        return UIKit.UIImage(resource: R.image.icon.icGost, compatibleWith: traitCollection)
      }
      #endif

      #if os(iOS) || os(tvOS)
      /// `UIImage(named: "icHeart", bundle: ..., traitCollection: ...)`
      static func icHeart(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
        return UIKit.UIImage(resource: R.image.icon.icHeart, compatibleWith: traitCollection)
      }
      #endif

      #if os(iOS) || os(tvOS)
      /// `UIImage(named: "icMore", bundle: ..., traitCollection: ...)`
      static func icMore(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
        return UIKit.UIImage(resource: R.image.icon.icMore, compatibleWith: traitCollection)
      }
      #endif

      #if os(iOS) || os(tvOS)
      /// `UIImage(named: "icMoreF", bundle: ..., traitCollection: ...)`
      static func icMoreF(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
        return UIKit.UIImage(resource: R.image.icon.icMoreF, compatibleWith: traitCollection)
      }
      #endif

      #if os(iOS) || os(tvOS)
      /// `UIImage(named: "icNonGost", bundle: ..., traitCollection: ...)`
      static func icNonGost(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
        return UIKit.UIImage(resource: R.image.icon.icNonGost, compatibleWith: traitCollection)
      }
      #endif

      #if os(iOS) || os(tvOS)
      /// `UIImage(named: "icNonHeart", bundle: ..., traitCollection: ...)`
      static func icNonHeart(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
        return UIKit.UIImage(resource: R.image.icon.icNonHeart, compatibleWith: traitCollection)
      }
      #endif

      #if os(iOS) || os(tvOS)
      /// `UIImage(named: "icNonProfile", bundle: ..., traitCollection: ...)`
      static func icNonProfile(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
        return UIKit.UIImage(resource: R.image.icon.icNonProfile, compatibleWith: traitCollection)
      }
      #endif

      #if os(iOS) || os(tvOS)
      /// `UIImage(named: "icNonSearch", bundle: ..., traitCollection: ...)`
      static func icNonSearch(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
        return UIKit.UIImage(resource: R.image.icon.icNonSearch, compatibleWith: traitCollection)
      }
      #endif

      #if os(iOS) || os(tvOS)
      /// `UIImage(named: "icPlus", bundle: ..., traitCollection: ...)`
      static func icPlus(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
        return UIKit.UIImage(resource: R.image.icon.icPlus, compatibleWith: traitCollection)
      }
      #endif

      #if os(iOS) || os(tvOS)
      /// `UIImage(named: "icProfile", bundle: ..., traitCollection: ...)`
      static func icProfile(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
        return UIKit.UIImage(resource: R.image.icon.icProfile, compatibleWith: traitCollection)
      }
      #endif

      #if os(iOS) || os(tvOS)
      /// `UIImage(named: "icSearch", bundle: ..., traitCollection: ...)`
      static func icSearch(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
        return UIKit.UIImage(resource: R.image.icon.icSearch, compatibleWith: traitCollection)
      }
      #endif

      #if os(iOS) || os(tvOS)
      /// `UIImage(named: "icX", bundle: ..., traitCollection: ...)`
      static func icX(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
        return UIKit.UIImage(resource: R.image.icon.icX, compatibleWith: traitCollection)
      }
      #endif

      fileprivate init() {}
    }

    /// This `R.image.logo` struct is generated, and contains static references to 2 images.
    struct logo {
      /// Image `imgLogo`.
      static let imgLogo = Rswift.ImageResource(bundle: R.hostingBundle, name: "logo/imgLogo")
      /// Image `startImage`.
      static let startImage = Rswift.ImageResource(bundle: R.hostingBundle, name: "logo/startImage")

      #if os(iOS) || os(tvOS)
      /// `UIImage(named: "imgLogo", bundle: ..., traitCollection: ...)`
      static func imgLogo(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
        return UIKit.UIImage(resource: R.image.logo.imgLogo, compatibleWith: traitCollection)
      }
      #endif

      #if os(iOS) || os(tvOS)
      /// `UIImage(named: "startImage", bundle: ..., traitCollection: ...)`
      static func startImage(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
        return UIKit.UIImage(resource: R.image.logo.startImage, compatibleWith: traitCollection)
      }
      #endif

      fileprivate init() {}
    }

    /// This `R.image.map` struct is generated, and contains static references to 2 images.
    struct map {
      /// Image `currentLocation`.
      static let currentLocation = Rswift.ImageResource(bundle: R.hostingBundle, name: "map/currentLocation")
      /// Image `defaultMarker`.
      static let defaultMarker = Rswift.ImageResource(bundle: R.hostingBundle, name: "map/defaultMarker")

      #if os(iOS) || os(tvOS)
      /// `UIImage(named: "currentLocation", bundle: ..., traitCollection: ...)`
      static func currentLocation(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
        return UIKit.UIImage(resource: R.image.map.currentLocation, compatibleWith: traitCollection)
      }
      #endif

      #if os(iOS) || os(tvOS)
      /// `UIImage(named: "defaultMarker", bundle: ..., traitCollection: ...)`
      static func defaultMarker(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
        return UIKit.UIImage(resource: R.image.map.defaultMarker, compatibleWith: traitCollection)
      }
      #endif

      /// This `R.image.map.marker` struct is generated, and contains static references to 4 images.
      struct marker {
        /// Image `empty`.
        static let empty = Rswift.ImageResource(bundle: R.hostingBundle, name: "map/marker/empty")
        /// Image `imgGostMark`.
        static let imgGostMark = Rswift.ImageResource(bundle: R.hostingBundle, name: "map/marker/imgGostMark")
        /// Image `imgSelecGostMark`.
        static let imgSelecGostMark = Rswift.ImageResource(bundle: R.hostingBundle, name: "map/marker/imgSelecGostMark")
        /// Image `imgSpotGostMark`.
        static let imgSpotGostMark = Rswift.ImageResource(bundle: R.hostingBundle, name: "map/marker/imgSpotGostMark")

        #if os(iOS) || os(tvOS)
        /// `UIImage(named: "empty", bundle: ..., traitCollection: ...)`
        static func empty(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
          return UIKit.UIImage(resource: R.image.map.marker.empty, compatibleWith: traitCollection)
        }
        #endif

        #if os(iOS) || os(tvOS)
        /// `UIImage(named: "imgGostMark", bundle: ..., traitCollection: ...)`
        static func imgGostMark(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
          return UIKit.UIImage(resource: R.image.map.marker.imgGostMark, compatibleWith: traitCollection)
        }
        #endif

        #if os(iOS) || os(tvOS)
        /// `UIImage(named: "imgSelecGostMark", bundle: ..., traitCollection: ...)`
        static func imgSelecGostMark(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
          return UIKit.UIImage(resource: R.image.map.marker.imgSelecGostMark, compatibleWith: traitCollection)
        }
        #endif

        #if os(iOS) || os(tvOS)
        /// `UIImage(named: "imgSpotGostMark", bundle: ..., traitCollection: ...)`
        static func imgSpotGostMark(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
          return UIKit.UIImage(resource: R.image.map.marker.imgSpotGostMark, compatibleWith: traitCollection)
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

    /// This `R.image.report` struct is generated, and contains static references to 2 images.
    struct report {
      /// Image `btnMap`.
      static let btnMap = Rswift.ImageResource(bundle: R.hostingBundle, name: "report/btnMap")
      /// Image `btnReviewPlus`.
      static let btnReviewPlus = Rswift.ImageResource(bundle: R.hostingBundle, name: "report/btnReviewPlus")

      #if os(iOS) || os(tvOS)
      /// `UIImage(named: "btnMap", bundle: ..., traitCollection: ...)`
      static func btnMap(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
        return UIKit.UIImage(resource: R.image.report.btnMap, compatibleWith: traitCollection)
      }
      #endif

      #if os(iOS) || os(tvOS)
      /// `UIImage(named: "btnReviewPlus", bundle: ..., traitCollection: ...)`
      static func btnReviewPlus(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
        return UIKit.UIImage(resource: R.image.report.btnReviewPlus, compatibleWith: traitCollection)
      }
      #endif

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

    fileprivate init() {}
  }
  #endif

  fileprivate init() {}
}
