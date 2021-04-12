import Foundation

public final class Fonts {
  
  public static let large = loadFont(name: fontName, size: 30.0)
  public static let medium = loadFont(name: fontName, size: 25.0)
  public static let small = loadFont(name: fontName, size: 18.0)

  private static let fontName = "coolstory-regular"
  
  private static func loadFont(name: String, size: CGFloat) -> UIFont {
    if let font = UIFont(name: name, size: size) {
      return font
    }
    let bundle = Bundle(for: Fonts.self)
    
    guard let url = bundle.url(forResource: name, withExtension: "ttf"),
          let fontData = NSData(contentsOf: url),
          let provider = CGDataProvider(data: fontData),
          let cgFont = CGFont(provider),
          let fontName = cgFont.postScriptName as String? else {
      preconditionFailure("Unable to load font name : \(name)")
    }
    CTFontManagerRegisterGraphicsFont(cgFont, nil)
    return UIFont(name: fontName, size: size)!
  }
}
