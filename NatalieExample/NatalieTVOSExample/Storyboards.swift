//
// Autogenerated by Natalie - Storyboard Generator
// by Marcin Krzyzanowski http://krzyzanowskim.com
//
import UIKit

//MARK: - Storyboards

extension UIStoryboard {
    func instantiateViewController<T: UIViewController>(ofType type: T.Type) -> T? where T: IdentifiableProtocol {
        let instance = type.init()
        if let identifier = instance.storyboardIdentifier {
            return self.instantiateViewController(withIdentifier: identifier) as? T
        }
        return nil
    }
    
}

protocol Storyboard {
    static var storyboard: UIStoryboard { get }
    static var identifier: String { get }
}

struct Storyboards {
    
    struct Main: Storyboard {
        
        static let identifier = "Main"
        
        static var storyboard: UIStoryboard {
            return UIStoryboard(name: self.identifier, bundle: nil)
        }
        
        static func instantiateInitialViewController() -> UINavigationController {
            return self.storyboard.instantiateInitialViewController() as! UINavigationController
        }
        
        static func instantiateViewController(withIdentifier: String) -> UIViewController {
            return self.storyboard.instantiateViewController(withIdentifier: identifier)
        }
        
        static func instantiateViewController<T: UIViewController>(ofType type: T.Type) -> T? where T: IdentifiableProtocol {
            return self.storyboard.instantiateViewController(ofType: type)
        }
    }
}

//MARK: - ReusableKind
enum ReusableKind: String, CustomStringConvertible {
    case TableViewCell = "tableViewCell"
    case CollectionViewCell = "collectionViewCell"
    
    var description: String { return self.rawValue }
}

//MARK: - SegueKind
enum SegueKind: String, CustomStringConvertible {
    case Relationship = "relationship"
    case Show = "show"
    case Presentation = "presentation"
    case Embed = "embed"
    case Unwind = "unwind"
    case Push = "push"
    case Modal = "modal"
    case Popover = "popover"
    case Replace = "replace"
    case Custom = "custom"
    
    var description: String { return self.rawValue }
}

//MARK: - IdentifiableProtocol

public protocol IdentifiableProtocol: Equatable {
    var storyboardIdentifier: String? { get }
}

//MARK: - SegueProtocol

public protocol SegueProtocol {
    var identifier: String? { get }
}

public func ==<T: SegueProtocol, U: SegueProtocol>(lhs: T, rhs: U) -> Bool {
    return lhs.identifier == rhs.identifier
}

public func ~=<T: SegueProtocol, U: SegueProtocol>(lhs: T, rhs: U) -> Bool {
    return lhs.identifier == rhs.identifier
}

public func ==<T: SegueProtocol>(lhs: T, rhs: String) -> Bool {
    return lhs.identifier == rhs
}

public func ~=<T: SegueProtocol>(lhs: T, rhs: String) -> Bool {
    return lhs.identifier == rhs
}

public func ==<T: SegueProtocol>(lhs: String, rhs: T) -> Bool {
    return lhs == rhs.identifier
}

public func ~=<T: SegueProtocol>(lhs: String, rhs: T) -> Bool {
    return lhs == rhs.identifier
}

//MARK: - ReusableViewProtocol
public protocol ReusableViewProtocol: IdentifiableProtocol {
    var viewType: UIView.Type? { get }
}

public func ==<T: ReusableViewProtocol, U: ReusableViewProtocol>(lhs: T, rhs: U) -> Bool {
    return lhs.storyboardIdentifier == rhs.storyboardIdentifier
}

//MARK: - Protocol Implementation
extension UIStoryboardSegue: SegueProtocol {
}

extension UICollectionReusableView: ReusableViewProtocol {
    public var viewType: UIView.Type? { return type(of: self) }
    public var storyboardIdentifier: String? { return self.reuseIdentifier }
}

extension UITableViewCell: ReusableViewProtocol {
    public var viewType: UIView.Type? { return type(of: self) }
    public var storyboardIdentifier: String? { return self.reuseIdentifier }
}

//MARK: - UIViewController extension
extension UIViewController {
    func perform<T: SegueProtocol>(segue: T, sender: Any?) {
        if let identifier = segue.identifier {
            performSegue(withIdentifier: identifier, sender: sender)
        }
    }
    
    func perform<T: SegueProtocol>(segue: T) {
        perform(segue: segue, sender: nil)
    }
}


//MARK: - MainViewController
extension UIStoryboardSegue {
    func selection() -> MainViewController.Segue? {
        if let identifier = self.identifier {
            return MainViewController.Segue(rawValue: identifier)
        }
        return nil
    }
}

extension MainViewController {
    
    enum Segue: String, CustomStringConvertible, SegueProtocol {
        case ScreenOneSegueButton = "Screen One Segue Button"
        case SceneOneGestureRecognizerSegue = "SceneOneGestureRecognizerSegue"
        case ScreenTwoSegue = "ScreenTwoSegue"
        case ScreenOneSegue = "ScreenOneSegue"
        
        var kind: SegueKind? {
            switch (self) {
            case .ScreenOneSegueButton:
                return SegueKind(rawValue: "show")
            case .SceneOneGestureRecognizerSegue:
                return SegueKind(rawValue: "show")
            case .ScreenTwoSegue:
                return SegueKind(rawValue: "show")
            case .ScreenOneSegue:
                return SegueKind(rawValue: "show")
            }
        }
        
        var destination: UIViewController.Type? {
            switch (self) {
            case .ScreenOneSegueButton:
                return ScreenOneViewController.self
            case .SceneOneGestureRecognizerSegue:
                return ScreenOneViewController.self
            case .ScreenTwoSegue:
                return ScreenTwoViewController.self
            case .ScreenOneSegue:
                return ScreenOneViewController.self
            }
        }
        
        var identifier: String? { return self.description }
        var description: String { return self.rawValue }
    }
    
}

//MARK: - ScreenTwoViewController

//MARK: - ScreenOneViewController
