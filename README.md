<div align="center">

Perseus Dark Mode
==

THE DARKNESS YOU CAN FORCE

[![Actions Status](https://github.com/perseusrealdeal/PerseusDarkMode/actions/workflows/main.yml/badge.svg)](https://github.com/perseusrealdeal/PerseusDarkMode/actions/workflows/main.yml)
[![Style](https://github.com/perseusrealdeal/PerseusDarkMode/actions/workflows/swiftlint.yml/badge.svg)](https://github.com/perseusrealdeal/PerseusDarkMode/actions/workflows/swiftlint.yml)
[![Version](https://img.shields.io/badge/Version-2.2.0-green.svg)](/CHANGELOG.md)
[![Platforms](https://img.shields.io/badge/Platforms-macOS%2010.13+_|_iOS%2011.0+-orange.svg)](https://en.wikipedia.org/wiki/List_of_Apple_products)
[![Xcode 14.2](https://img.shields.io/badge/Xcode-14.2+-red.svg)](https://en.wikipedia.org/wiki/Xcode)
[![Swift 5.7](https://img.shields.io/badge/Swift-5.7-red.svg)](https://www.swift.org)

[`A3 Environment`](/APPROBATION.md) • [`CHANGELOG`](/CHANGELOG.md) • [`MIT License`](/LICENSE)

</div>

---

Usages
==

> `1:` Build `Light/Dark/Auto` option.</br>
> `2:` Be awared of Dark Mode changes.

Integration
==

[![Standalone](https://img.shields.io/badge/Standalone-available-informational.svg)](/TheDarknessStar.swift)
[![Swift Package Manager compatible](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-4BC51D.svg)](/Package.swift)

Dependencies
==

[![ConsolePerseusLogger](http://img.shields.io/:ConsolePerseusLogger-1.7.1-green.svg)](https://github.com/perseusrealdeal/ConsolePerseusLogger.git)

Support Code
==

[![Standalone](https://img.shields.io/badge/Standalone-available-informational.svg)](/Sources/PerseusDarkMode/TheDarknessSupport.swift)
[![License](http://img.shields.io/:License-Unlicense-green.svg)](http://unlicense.org/)

> [`TheDarknessSupport.swift`](/Sources/PerseusDarkMode/TheDarknessSupport.swift) is a peace of code a widly helpful in accord with `PDM`.

PDM in Use
==

> `Approbation:` 

- [`Swift macOS app`](https://github.com/perseusrealdeal/Arkenstone) 
- [`Swift iOS app`](https://github.com/perseusrealdeal/TheOneRing)

> `Business:` 

- Swift macOS app [`The Dark Moon`](https://github.com/perseusrealdeal/TheDarkMoon) 
- Swift macOS app [`Convertor mov2gif`](https://github.com/PerseusRealDeal/mov2gif)

Contents
==

* [In brief](#In-brief)
* [Requirements](#Requirements)
* [First-party software](#First-party-software)
* [Third-party software](#Third-party-software)
* [Installation](#Installation)
    * [Cocoa macOS project](#Cocoa-macOS-project)
    * [UIKit iOS project](#UIKit-iOS-project)
* [Usage](#Usage)
    * [Force Dark Mode](#Force-Dark-Mode)
    * [Get awared of DarkMode changes](#Get-awared-of-DarkMode-changes)
    * [DarkMode change sample](#DarkMode-change-sample)
* [Account points](#Account-points)
* [License](#License)
    * [Other required licenses details](#Other-required-licenses-details)
* [Credits](#Credits)
* [Contributing](#Contributing)
* [Author](#Author)
    * [Contact](#Contact)

Our Terms
--

| Acronym | Stands for                                                                                                |
| :-----: | --------------------------------------------------------------------------------------------------------- |
| CPL     | [Console_Perseus_Logger](https://github.com/perseusrealdeal/ConsolePerseusLogger.git)                     |
| PDM     | [Perseus_Dark_Mode](https://github.com/perseusrealdeal/PerseusDarkMode.git)                               |
| PGK     | [Perseus_Geo_Kit](https://github.com/perseusrealdeal/PerseusGeoKit.git)                                   |
| A3      | [Apple_Apps_Approbation](https://docs.google.com/document/d/1K2jOeIknKRRpTEEIPKhxO2H_1eBTof5uTXxyOm5g6nQ) |
| T3      | [The_Technological_Tree](https://github.com/perseusrealdeal/TheTechnologicalTree)                         |
| P2P     | Person_to_Person                                                                                          |

In brief
==

The great home-made product to accomplish `Dark Mode switching` task. `PDM` is a single author and personale solution developed in `P2P` relationship paradigm.

<table>
  <tr>
    <th>macOS app</th>
    <th>iOS app</th>
    <th>iOS Settings bundle</th>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/50806453-a091-47df-8a9a-f7f7b9eef838" width="200" style="max-width: 100%; display: block; margin-left: auto; margin-right: auto;"/></td>
    <td><img src="https://github.com/user-attachments/assets/b05daa43-aa73-44ac-8479-735d0dcf7d33" width="200" style="max-width: 100%; display: block; margin-left: auto; margin-right: auto;"/></td>
    <td>
        <img src="https://github.com/user-attachments/assets/f72bf8e5-e663-49ba-847d-06858b12eb43" width="200" style="max-width: 100%; display: block; margin-left: auto; margin-right: auto;"/></br>
        <img src="https://github.com/user-attachments/assets/2b2f15ef-a1e9-433e-b568-bbdb47dcb9a6" width="200" style="max-width: 100%; display: block; margin-left: auto; margin-right: auto;"/>
    </td>
  </tr>
</table>

> [!IMPORTANT]
> [`The macOS App`](https://github.com/perseusrealdeal/Arkenstone) scenes taken from the motion picture `The Hobbit` based on the novel by J.R.R. Tolkien.</br>
> [`The iOS App`](https://github.com/perseusrealdeal/TheOneRing) scenes taken from the motion picture `The Lord of The Rings` based on the novel by J.R.R. Tolkien.

Requirements
==

`To build:`

- [macOS Monterey 12.7.6+](https://apps.apple.com/by/app/macos-monterey/id1576738294)
- [Xcode 14.2+](https://developer.apple.com/services-account/download?path=/Developer_Tools/Xcode_14.2/Xcode_14.2.xip)

> But as the single source code file [TheDarknessStar.swift](/TheDarknessStar.swift) `PDM` can be used even in Xcode 10.1.

First-party software
==

MIT
--

| Type   | Name                                                                                                                                                                  |
| ------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Star   | [ConsolePerseusLogger](https://github.com/perseusrealdeal/ConsolePerseusLogger) / [1.7.1](https://github.com/perseusrealdeal/ConsolePerseusLogger/releases/tag/1.7.1) |

Third-party software
==

MIT
--

| Type   | Name                                                                                                                              |
| ------ | --------------------------------------------------------------------------------------------------------------------------------- |
| Style  | [SwiftLint](https://github.com/realm/SwiftLint) / [v0.57.0 for Monterey+](https://github.com/realm/SwiftLint/releases/tag/0.57.0) |
| Script | [SwiftLint Shell Script](/SucceedsPostAction.sh) to run SwiftLint                                                                 |
| Action | [cirruslabs/swiftlint-action@v1](https://github.com/cirruslabs/swiftlint-action/)                                                 |

[Unlicense](https://unlicense.org)
--

| Type   | Name                                                                                                                              |
| ------ | --------------------------------------------------------------------------------------------------------------------------------- |
| Action | [mxcl/xcodebuild@v3](https://github.com/mxcl/xcodebuild)                                                                          |

Installation
==

`Step 1:` Import the Darkness either with SPM or standalone

> Standalone: the single source code file [TheDarknessStar.swift](/TheDarknessStar.swift)

> Swift Package Manager: `https://github.com/perseusrealdeal/PerseusDarkMode`

Cocoa macOS project
--

`Step 2:` In the AppDelegate when `applicationDidFinishLaunching` call `force`

```swift

import Cocoa
import PerseusDarkMode

class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        DarkModeAgent.force(DarkModeUserChoice)
    }
}

```

`Step 3:` Register the MainWindowController for Dark Mode changes

```swift

import Cocoa
import PerseusDarkMode

class MainWindowController: NSWindowController, NSWindowDelegate {

    override func windowDidLoad() {
        super.windowDidLoad()

        DarkModeAgent.register(stakeholder: self, selector: #selector(makeUp))
    }

    @objc private func makeUp() {
    
    // Runs every time if Dark Mode changes.
    // The current DarkMode value is reliable here.
    
    let isDark = DarkMode.style == .dark
    let _ = isDark ? "It's dark" : "No dark"
    
    }
}

```

UIKit iOS project
--

`Step 2:` In the AppDelegate when `didFinishLaunchingWithOptions` call `force`

```swift

import UIKit
import PerseusDarkMode

class AppDelegate: UIResponder { var window: UIWindow? }

extension AppDelegate: UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions
        launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        // Register Settings Bundle
        registerSettingsBundle()

        // Init the app's window
        window = UIWindow(frame: UIScreen.main.bounds)

        // Give it a root view for the first screen
        window!.rootViewController = MainViewController.storyboardInstance()
        window!.makeKeyAndVisible()
        
        DarkModeAgent.force(DarkModeUserChoice)
        
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {

        // Actualize Dark Mode style to Settings Bundle
        if let choice = DarkModeAgent.isDarkModeSettingsKeyChanged() {
            DarkModeAgent.force(choice)
        }
    }
}

```

`Step 3:` Register the MainViewController and process traitCollectionDidChange for DarkMode changes

```swift

import UIKit
import PerseusDarkMode

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        DarkModeAgent.register(stakeholder: self, selector: #selector(makeUp))
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        if #available(iOS 13.0, *) {
            DarkModeAgent.processTraitCollectionDidChange(previousTraitCollection)
        }
    }
    
    @objc private func makeUp() {
    
    // Runs every time if Dark Mode changes.
    // The current DarkMode value is reliable here, DarkModeAgent selector registered.
    
    let isDark = DarkMode.style == .dark
    let _ = isDark ? "It's dark" : "No dark"
    
    }
}

```

Usage
==

Force Dark Mode
--

> The Dark Mode of your app can be easely forced in `.on`, `.off` or `.auto` just call method `force` of DarkModeAgent like this. 

```swift

DarkModeAgent.force(.off) // It's a sunny day for the app.

```

The `force` will change the appearance of your app immediately including system components and will make run all custom DarkMode code `makeUp()`.

Get awared of DarkMode changes
--

> To declare custom DarkMode sensitive code that runs every time if DarkMode Changes register the object or create a DarkMode trigger:

`Use Case 1:` Register an object to be notified on changes

```swift

class DarkModeSensitiveObject {

    init() {
        DarkModeAgent.register(stakeholder: self, selector: #selector(makeUp))
    }

    @objc private func makeUp() {
        // Runs evary time if Dark Mode changes.
    }
}

```

`Use Case 2:` Create a DarkMode trigger and give it an action

```swift

class DarkModeSensitiveObject {

    private var theDarknessTrigger = DarkModeObserver()

    init() {
        theDarnessTrigger.action = { _ in
            self.makeUp()
        }
    }

    private func makeUp() {
        // Runs evary time if Dark Mode changes.
    }
}

```

DarkMode change sample
--

`Use Case:` Custom DarkMode sensitive color

```swift

import PerseusDarkMode

#if canImport(UIKit)
import UIKit
#elseif canImport(Cocoa)
import Cocoa
#endif

#if os(iOS)
public typealias Color = UIColor
#elseif os(macOS)
public typealias Color = NSColor
#endif

public func rgba255(_ red: CGFloat,
                    _ green: CGFloat,
                    _ blue: CGFloat,
                    _ alpha: CGFloat = 1.0) -> Color {
    return Color(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
}

extension Color {
    public static var customRed: Color {
        return DarkModeAgent.shared.style == .light ?
            rgba255(255, 59, 48) : rgba255(255, 69, 58)
    }
}

```

> And use custom DarkMode sensitive color:

```swift

// Runs every time if the DarkMode changes. 
// Use KVO (DarkModeObserver) or be registered with DarkModeAgent. 
@objc private func makeUp() {
    self.backgroundColor = .customRed
}

```

`Account points
==

- Preconfigured Swift Package manifest [Package.swift](/Package.swift)
- Preconfigured SwiftLint config [.swiftlint.yml](/.swiftlint.yml)
- Preconfigured SwiftLint CI [swiftlint.yml](/.github/workflows/swiftlint.yml)
- Preconfigured GitHub config [.gitignore](/.gitignore)
- Preconfigured GitHub CI [main.yml](/.github/workflows/main.yml)
- [Changelog](/CHANGELOG.md)
- [A3 environment specification](/APPROBATION.md)
- [SwiftLint shell script](/SucceedsPostAction.sh)

License
==

`MIT License`, see [LICENSE](/LICENSE) for details.

Copyright © 7530 - 7534 Mikhail A. Zhigulin of Novosibirsk<br/>
Copyright © 7533 - 7534 PerseusRealDeal

- The year starts from the creation of the world according to a Slavic calendar.
- September, the 1st of Slavic year. For instance, "Sep 01, 2025" is the beginning of 7534.

Other required licenses details
--

`© 2025 The SwiftLint Contributors` **for** SwiftLint</br>
`© GitHub` **for** GitHub Action cirruslabs/swiftlint-action@v1</br>
`© 2021 Alexandre Colucci, geteimy.com` **for** Shell Script SucceedsPostAction.sh</br>

Credits
==

<table>
  <tr>
      <td>Balance and Control</td>
      <td>Mikhail Zhigulin</td>
  </tr>
  <tr>
      <td>Source Code</td>
      <td>Mikhail Zhigulin</td>
  </tr>
  <tr>
      <td>Documentation</td>
      <td>Mikhail Zhigulin</td>
  </tr>
  <tr>
      <td>Approbation</td>
      <td>Mikhail Zhigulin</td>
  </tr>
  <tr>
      <td>English</td>
      <td>Mikhail Zhigulin</td>
  </tr>
</table>

- Language support: [Reverso](https://www.reverso.net/)
- Git clients: [SmartGit](https://syntevo.com/) and [GitHub Desktop](https://github.com/apps/desktop)

Contributing
==

> [!NOTE]
> The product is constructed in `P2P` relationship paradigm that means the only one single and the same face in the product team during all development process stages.

`Bug reports are welcome`, create an issue and give details.

Author
==

<div align="center">

`© Mikhail A. Zhigulin of Novosibirsk`

</div>

Contact
--

<div align="center">

[E-mail](mailto:mzhigulin@gmail.com) • [Telegram](https://t.me/velociraptor1985) • [GitHub](https://github.com/perseusrealdeal)

</div>`
