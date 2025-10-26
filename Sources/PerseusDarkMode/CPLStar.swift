//
//  CPLStar.swift
//  Version: 1.6.0
//
//  Standalone ConsolePerseusLogger.
//
//  For iOS and macOS. Use Stars to adopt for the specifics you need.
//
//  DESC: USE LOGGER LIKE A VARIABLE ANYWHERE YOU WANT.
//
//  [TYPE] [DATE] [TIME] [PID:TID] message, file: #, line: #
//
//  Created by Mikhail Zhigulin in 7531.
//
//  BASED_ON_LOGGER: https://gist.github.com/PerseusRealDeal/df456a9825fcface44eca738056eb6d5
//  BASED_ON_REPORT: https://gist.github.com/PerseusRealDeal/9a4118301b59d43969d8edf5ebc3a571
//
//  Copyright © 7531 - 7534 Mikhail A. Zhigulin of Novosibirsk
//  Copyright © 7531 - 7534 PerseusRealDeal
//
//  All rights reserved.
//
//
//  MIT License
//
//  Copyright © 7531 - 7534 Mikhail A. Zhigulin of Novosibirsk
//  Copyright © 7531 - 7534 PerseusRealDeal
//
//  The year starts from the creation of the world according to a Slavic calendar.
//  September, the 1st of Slavic year.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//
// swiftlint:disable file_length
//

import Foundation
import os

// swiftlint:disable type_name
typealias log = PerseusLogger // Not public in SPM package, except TheOne.
// swiftlint:enable type_name

// Not public in SPM package, except TheOne.
protocol PerseusDelegatedMessage: AnyObject {
    var message: String { get set }
}

public class PerseusLogger {

    // MARK: - Typealiases

    public typealias ConsoleObject = (subsystem: String, category: String)
    public typealias LocalTime = (date: String, time: String, timeUTC: TimeInterval)
    public typealias PIDandTID = (pid: String, tid: String) // PID and Thread ID.
    public typealias Directives = (fileName: String, line: UInt) // #file and #line.

    public typealias MessageDelegate = (
        (String, Level, LocalTime, PIDandTID, User, Directives) -> Void
    )

    // MARK: - Constants

    private static let SUBSYSTEM = "Perseus"
    private static let CATEGORY = "Lover"

    // MARK: - Specifics

    public enum Status: String, Decodable, CaseIterable {
        case on
        case off
    }

    public enum Output: String, Decodable, CaseIterable {
        case standard // In Use: Swift.print("").
        case consoleapp // In Use: Logger structure from iOS 14.0, macOS 11.0, NSLog otherwise.
        case custom // In Use: customActionOnMessage?(_:_:_:_:_:_:).
    }

    // log.message("Notification...", .notice, .custom, .enduser)
    public enum User: String, Decodable, CaseIterable {
        case enduser // Ignores status turned == .off; level == .notice is recommended.
        case operative
    }

    public enum Level: Int, CustomStringConvertible, Decodable, CaseIterable {

        public var description: String {
            switch self {
            case .debug:
                return "DEBUG"
            case .info:
                return "INFO"
            case .notice:
                return "NOTE"
            case .error:
                return "ERROR"
            case .fault:
                return "FAULT"
            }
        }

        public var tag: String {
            switch self {
            case .debug:
                return "[DEBUG]"
            case .info:
                return "[INFO ]"
            case .notice:
                return "[NOTE ]"
            case .error:
                return "[ERROR]"
            case .fault:
                return "[FAULT]"
            }
        }

        case debug  = 5
        case info   = 4
        case notice = 3
        case error  = 2
        case fault  = 1
    }

    public enum TimeMultiply: String, Decodable, CaseIterable {
        // case millisecond // -3.
        // case microsecond // -6.
        case nanosecond  // -9.
    }

    public enum TIDNumber: String, Decodable, CaseIterable {
        case hexadecimal
        case decimal
    }

    public enum MessageFormat: String, Decodable, CaseIterable {

        case short // Depends on message details visibility flags.

// marks true, time false, owner false, directives false
// [DEBUG] message

// marks true, time true, owner false, directives false
// [DEBUG] [2025-04-17] [20:31:53:630594968] message

// marks true, time false, owner false, directives true
// [DEBUG] message, file: File.swift, line: 29

// marks true, time false, owner true, directives true
// [DEBUG] [6317:0x2519d] message, file: File.swift, line: 29

// marks true, time true, owner true, directives true
// [DEBUG] [2025-04-17] [20:31:53:630918979] [6317:0x2519d] message, file: File.swift, line: 29

// marks false, time false, owner false, directives true
// message, file: File.swift, line: 29

// marks false, time false, owner true, directives true
// [6317:0x2519d] message, file: File.swift, line: 29

// marks false, time false, owner true, directives false
// [6317:0x2519d] message

// marks false, time false, owner false, directives false
// message

        case full // Forcefully. No matter what message details visibility flags are.
// [DEBUG] [2025-04-17] [20:31:53:630918979] [6317:0x2519d] message, file: File.swift, line: 29

        case textonly // Forcefully. No matter what message details visibility flags are.
// message
    }

    // MARK: - Properties

    public static var customActionOnMessage: PerseusLogger.MessageDelegate?

#if DEBUG
    public static var turned = Status.on
    public static var level = Level.debug
    public static var output = Output.standard
#else
    public static var turned = Status.off
    public static var level = Level.notice
    public static var output = Output.consoleapp
#endif

    public static var subsecond = TimeMultiply.nanosecond
    public static var tidnumber = TIDNumber.hexadecimal

    // MARK: - Message Details Visibility Flags

    public static var format = MessageFormat.short

    // [TYPE] [DATE] [TIME] [PID:TID] message, file: #, line: #
    public static var marks = true // [TYPE]
    public static var time = false // [DATE] [TIME] Depends on format and marks
    public static var owner = false // [PID:TID] Depends on format
    public static var directives = false // file# and line# Depends on format

#if targetEnvironment(simulator)
    public static var debugIsInfo = true // Shows DEBUG message as INFO in macOS Console.
#endif

    // MARK: - Special Properties

    public static var logObject: ConsoleObject? {
        didSet {

            guard let obj = logObject else {

                if #available(iOS 14.0, macOS 11.0, *) {
                    consoleLogger = nil
                }

                consoleOSLog = nil

                return
            }

            if #available(iOS 14.0, macOS 11.0, *) {
                consoleLogger = Logger(subsystem: obj.subsystem, category: obj.category)
            } else {
                consoleOSLog = OSLog(subsystem: obj.subsystem, category: obj.category)
            }
        }
    }

    public static var localTime: LocalTime {
        return getLocalTime()
    }

    public static var pidAndTid: PIDandTID {
        return getPIDandTID()
    }

    // MARK: - Internals

    @available(iOS 14.0, macOS 11.0, *)
    private(set) static var consoleLogger: Logger?
    private(set) static var consoleOSLog: OSLog?

    // MARK: - Contract

    public static func message(_ text: @autoclosure () -> String,
                               _ type: Level = .debug,
                               _ oput: Output = PerseusLogger.output,
                               _ user: User = .operative,
                               _ file: StaticString = #file,
                               _ line: UInt = #line) {

        guard turned == .on || user == .enduser, type.rawValue <= level.rawValue
        else {
            return
        }

        var message = ""

        // Path.

        let withDirectives = (format == .full) ? true : directives && (format != .textonly)
        let fileName = (file.description as NSString).lastPathComponent

        if withDirectives {
            message = "\(text()), file: \(fileName), line: \(line)"
        } else {
            message = "\(text())"
        }

        // PID and TID.

        let withOwnerId = (format == .full) ? true : owner && (format != .textonly)
        let idTuple = getPIDandTID()

        if withOwnerId {
            message = "[\(idTuple.pid):\(idTuple.tid)] \(message)"
        }

        // Time.

        let isTimed = (format == .full) ? true : marks && time && (format != .textonly)
        let localTime = getLocalTime()

        if isTimed {
            message = "[\(localTime.date)] [\(localTime.time)] \(message)"
        }

        // Type.

        let isTyped = (format == .full) ? true : marks && (format != .textonly)
        message = isTyped ? "\(type.tag) \(message)" : message

        // Print.

        if oput == .custom {
            let directives: Directives = (fileName: fileName, line: line)
            customActionOnMessage?(message, type, localTime, idTuple, user, directives)
        } else {
            print(message, type, oput)
        }
    }

    public static func loadConfig(_ profile: ProfileCPL) -> Bool {
        if let data = profile.json.data(using: .utf8) {
            if let jsonConfig = decodeJsonProfile(data) {
                reloadOptions(jsonConfig)
                return true
            }
            log.message("Failed to decode CPL json config data!", .error)
            return false
        }
        log.message("Failed to load CPL config data!", .error)
        return false
    }

    public static func loadConfig(_ json: URL) -> Bool {
        if FileManager.default.fileExists(atPath: json.relativePath) {
            if let data = try? Data(contentsOf: json) {
                if let jsonConfig = decodeJsonProfile(data) {
                    reloadOptions(jsonConfig)
                    return true
                }
                log.message("Failed to decode CPL json config data!", .error)
                return false
            }
            log.message("Failed to load CPL config data!", .error)
            return false
        }
        log.message("CPL config file doesn't exist!", .error)
        return false
    }

    // MARK: - Implementation

    // swiftlint:disable:next cyclomatic_complexity
    private static func print(_ text: String, _ type: Level, _ output: Output) {

        let message = (text: text, type: type)

        if output == .standard {

            Swift.print(message.text) // DispatchQueue.main.async { print(message) }

        } else if output == .consoleapp {

            if #available(iOS 14.0, macOS 11.0, *) {

                let logger = consoleLogger ?? Logger(subsystem: SUBSYSTEM, category: CATEGORY)

                switch message.type {
                case .debug:
#if targetEnvironment(simulator)
                    if debugIsInfo {
                        logger.info("\(message.text, privacy: .public)")
                    } else {
                        logger.debug("\(message.text, privacy: .public)")
                    }
#else
                    logger.debug("\(message.text, privacy: .public)")
#endif
                case .info:
                    logger.info("\(message.text, privacy: .public)")
                case .notice:
                    logger.notice("\(message.text, privacy: .public)")
                case .error:
                    logger.error("\(message.text, privacy: .public)")
                case .fault:
                    logger.fault("\(message.text, privacy: .public)")
                }

                return
            }

            let consoleLog = consoleOSLog ?? OSLog(subsystem: SUBSYSTEM, category: CATEGORY)

            switch message.type {
            case .debug:
#if targetEnvironment(simulator)
                if debugIsInfo {
                    os_log("%{public}@", log: consoleLog, type: .info, message.text)
                } else {
                    os_log("%{public}@", log: consoleLog, type: .debug, message.text)
                }
#else
                os_log("%{public}@", log: consoleLog, type: .debug, message.text)
#endif
            case .info:
                os_log("%{public}@", log: consoleLog, type: .info, message.text)
            case .notice:
                os_log("%{public}@", log: consoleLog, type: .default, message.text)
            case .error:
                os_log("%{public}@", log: consoleLog, type: .error, message.text)
            case .fault:
                os_log("%{public}@", log: consoleLog, type: .fault, message.text)
            }
        }
    }

    private static func getLocalTime() -> LocalTime {

        guard
            let timezone = TimeZone(secondsFromGMT: 0)
        else {
            return ("TIME", "TIME", 0.0)
        }

        var calendar = Calendar.current

        calendar.timeZone = timezone
        calendar.locale = Locale(identifier: "en_US_POSIX")

        let UTC = Date().timeIntervalSince1970
        let current = Date(timeIntervalSince1970: (UTC +
                                                   Double(TimeZone.current.secondsFromGMT())))

        let details: Set<Calendar.Component> =
        [
            .year, .month, .day, .hour, .minute, .second, .nanosecond
        ]

        let components = calendar.dateComponents(details, from: current)

        // Parse date.

        guard
            let year = components.year,
            let month = components.month?.toPrint,
            let day = components.day?.toPrint
        else {
            return ("TIME", "TIME", 0.0)
        }

        let date = "\(year)-\(month)-\(day)"

        // Parse time.

        guard
            let hour = components.hour?.toPrint, // Always in 24-hour.
            let minute = components.minute?.toPrint,
            let second = components.second?.toPrint,
            let subsecond = components.nanosecond?.multiply
        else {
            return ("TIME", "TIME", 0.0)
        }

        let time = "\(hour):\(minute):\(second):\(subsecond)"

        return (date: date, time: time, timeUTC: UTC)
    }

    private static func getPIDandTID() -> PIDandTID {

        var tid: UInt64 = 0
        pthread_threadid_np(nil, &tid)

        return (pid: "\(ProcessInfo.processInfo.processIdentifier)",
                tid: "\(tidnumber == .hexadecimal ? tid.hex : tid.description)")
    }

    private static func decodeJsonProfile(_ data: Data) -> JsonOptionsCPL? {
        if let json = try? JSONDecoder().decode(JsonOptionsCPL.self, from: data) {
            return json
        }
        return nil
    }

    private static func reloadOptions(_ newValue: JsonOptionsCPL) {
        logObject = (newValue.subsystem, newValue.category)
        // turned = newValue.turned // Only manually!
        level = newValue.level
        output = newValue.output
        subsecond = newValue.subsecond
        tidnumber = newValue.tidnumber
        format = newValue.format
        marks = newValue.marks
        time = newValue.time
        owner = newValue.owner
        directives = newValue.directives
#if targetEnvironment(simulator)
        debugIsInfo = newValue.debugIsInfo
#endif
    }
}

// MARK: - Helpers

private extension Int {

    var toPrint: String {
        guard self >= 0, self <= 9 else { return String(self) }
        return "0\(self)"
    }

    var multiply: String {
        return String(self)
    }
}

private extension UInt64 {
    var hex: String {

        let value = self
        let valueFormated = String(format: "%02x", value)

        return valueFormated
    }
}

// MARK: - JSON Profiles

private struct JsonOptionsCPL: CustomStringConvertible, Decodable {
    let subsystem: String
    let category: String
    let turned: PerseusLogger.Status
    let level: PerseusLogger.Level
    let output: PerseusLogger.Output
    let subsecond: PerseusLogger.TimeMultiply
    let tidnumber: PerseusLogger.TIDNumber
    let format: PerseusLogger.MessageFormat
    let marks: Bool
    let time: Bool
    let owner: Bool
    let directives: Bool
    let debugIsInfo: Bool

    public var description: String {
        return
"""
\nCPL Configuration Profile values\n
subsystem   : \(subsystem)
category    : \(category)
turned      : \(turned)
level       : \(level)
output      : \(output)
subsecond   : \(subsecond)
tidnumber   : \(tidnumber)
format      : \(format)
marks       : \(marks)
time        : \(time)
owner       : \(owner)
directives  : \(directives)
debugIsInfo : \(debugIsInfo)
\n
"""
    }
}

public enum ProfileCPL: String {

    case debugRoutine
    case debugConcurrency
    case defaultDebug

    public var json: String {
        switch self {
        case .debugRoutine:
            return debugRoutineProfile
        case .debugConcurrency:
            return debugConcurrencyProfile
        case .defaultDebug:
            return defaultDebugProfile
        }
    }
}

private let debugRoutineProfile =
"""
{
    "subsystem"   : "Perseus",
    "category"    : "Lover",
    "turned"      : "on",
    "level"       : 5,
    "output"      : "standard",
    "subsecond"   : "nanosecond",
    "tidnumber"   : "hexadecimal",
    "format"      : "short",
    "marks"       : true,
    "time"        : true,
    "owner"       : false,
    "directives"  : false,
    "debugIsInfo" : true
}
"""

private let debugConcurrencyProfile =
"""
{
    "subsystem"   : "Perseus",
    "category"    : "Lover",
    "turned"      : "on",
    "level"       : 5,
    "output"      : "standard",
    "subsecond"   : "nanosecond",
    "tidnumber"   : "hexadecimal",
    "format"      : "short",
    "marks"       : false,
    "time"        : false,
    "owner"       : true,
    "directives"  : false,
    "debugIsInfo" : true
}
"""

private let defaultDebugProfile =
"""
{
    "subsystem"   : "Perseus",
    "category"    : "Lover",
    "turned"      : "on",
    "level"       : 5,
    "output"      : "standard",
    "subsecond"   : "nanosecond",
    "tidnumber"   : "hexadecimal",
    "format"      : "short",
    "marks"       : true,
    "time"        : false,
    "owner"       : false,
    "directives"  : false,
    "debugIsInfo" : true
}
"""

// MARK: - Log Report

extension PerseusLogger {

    public class Report: NSObject {

        // MARK: - Internals

        private var delegate: PerseusDelegatedMessage? // Delegate for end-user messages.
        private var report = "" // Last messages.

        // MARK: - Properties

        @objc public dynamic var lastMessage: String = "" {
            didSet {
                resizeReportIfNeeded()
                appendLastMessageToReport()
            }
        }

        public var messageDelegate: AnyObject? {
            didSet {
                delegate = messageDelegate as? PerseusDelegatedMessage
            }
        }

        public var text: String { report }

        // MARK: - Constants

        public let limit: Int
        public let newLine: String

#if os(iOS)
        public static let limitDefault = 1000
#elseif os(macOS)
        public static let limitDefault = 3000
#endif

        // MARK: - Initializer

        public init(limited: Int = Report.limitDefault, _ newLine: String = "\r\n--\r\n") {
            self.limit = limited
            self.newLine = newLine
        }

        // MARK: - Contract

        // swiftlint:disable:next function_parameter_count
        public func report(_ text: String,
                           _ type: Level,
                           _ localTime: LocalTime,
                           _ owner: PIDandTID,
                           _ user: User,
                           _ dirs: Directives) {

            let text = text.replacingOccurrences(of: "\(type.tag) ", with: "")
            lastMessage = "[\(localTime.date)] [\(localTime.time)] \(type.tag)\r\n\(text)"

            if user == .enduser {
                delegate?.message = text
            }
        }

        public func clear() {
            report = ""
        }

        // MARK: - Realization

        private func resizeReportIfNeeded() {

            let lmCount = lastMessage.count
            let nlCount = newLine.count

            // Can the last message be reported?
            guard lmCount != 0, lmCount < limit else {
                return
            }

            // Should the report be resized?
            let length = lmCount + report.count + (report.isEmpty ? 0 : nlCount)
            guard limit - length < 0 else {
                return
            }

            // What length to remove?
            let messages = report.components(separatedBy: newLine)
            let messagesCount = messages.count - 1

            var lengthToRemove = 0
            var itemCount = 0

            for item in messages {

                itemCount += 1
                let newLineLength = messagesCount == 0 ? 0 : nlCount

                lengthToRemove += (item.count + newLineLength)

                if itemCount == messagesCount, messagesCount > 2 {
                    lengthToRemove -= nlCount // There's no new line in the report end
                }

                // Is it enough?
                let reportAfter = report.count - lengthToRemove
                let lastMessageAfter = reportAfter != 0 ? nlCount + lmCount : lmCount

                if limit - (reportAfter + lastMessageAfter) >= 0 {
                    break
                }
            }

            // Final check
            guard report.count >= lengthToRemove else {
                return
            }

            // Free space
            report.removeFirst(lengthToRemove)
        }

        private func appendLastMessageToReport() {

            guard lastMessage.isEmpty == false, lastMessage.count < limit else {
                return
            }

            let newLinelength = report.isEmpty ? 0 : newLine.count
            let length = (lastMessage.count + report.count + newLinelength)

            guard limit - length >= 0 else {
                return
            }

            report.append(report.isEmpty ? lastMessage : newLine + lastMessage)
        }
    }
}
