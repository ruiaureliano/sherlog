import Foundation

open class Sherlog: NSObject {

	static var print: SherlogPrint = .min
	static var level: SherlogLevel = .info
	static var destination: SherlogDestination = .console
	static var dateFormat = "YYYY-MM-dd HH:mm:ss"

	public enum SherlogPrint: Int {
		case none
		case min
		case full
	}

	public struct SherlogDestination: OptionSet {
		public var rawValue: Int
		public init(rawValue: Int) {
			self.rawValue = rawValue
		}

		static let console = SherlogDestination(rawValue: 1 << 1)
	}

	public struct SherlogLevel: OptionSet {
		public var rawValue: Int
		public init(rawValue: Int) {
			self.rawValue = rawValue
		}

		static let info = SherlogLevel(rawValue: 1 << 0)
		static let warning = SherlogLevel(rawValue: 1 << 1)
		static let error = SherlogLevel(rawValue: 1 << 2)
	}

	open class func print(_ message: Any, for aLevel: SherlogLevel, file: String = #file, function: String = #function, line: Int = #line) {
		var color = "🟢"
		switch aLevel {
		case .info:
			color = "🟢"
		case .warning:
			color = "🟡"
		case .error:
			color = "🔴"
		default:
			color = "❓"
		}
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = dateFormat
		let dataString = dateFormatter.string(from: Date())
		switch print {
		case .none:
			break
		case .min:
			if destination.contains(.console) {
				if level.contains(aLevel) {
					debugPrint("\(color) [date: \(dataString)][message: \"\(message)\"]" as AnyObject)
				}
			}
		case .full:
			if destination.contains(.console) {
				if level.contains(aLevel) {
					debugPrint("\(color) [date: \(dataString)][file: \(file)][function: \(function)][line: \(line)][message: \"\(message)\"]" as AnyObject)
				}
			}
		}
	}
}
