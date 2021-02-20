# 🕵️‍♂️ Sherlog for Swift

[![](https://img.shields.io/badge/license-MIT-0f73b4.svg)](./LICENSE.md) [![](https://img.shields.io/badge/swift-5.3-0f73b4.svg)](https://swift.org/blog/swift-5-3-released/) 

💡 The idea of Sherlog (_name based on fictional private detective created by British author **Sir Arthur Conan Doyle**_) is to have a simple log mechanism for debug print, yes I know, we have `NSLog`, `print`, `dump`, etc...

🍭 I want something fun and cool, **[Sherlog.swift](./Sherlog.swift)** is just a small file with **70 lines of code**, use it, change it if you need.

## Instructions & Usage

```swift
import UIKit

let log = Sherlog.self

@main 
class AppDelegate: UIResponder, UIApplicationDelegate {
   
   func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      
      /* Here is where you set your configuration */ 
      log.dateFormat = "YYYY-MM-dd HH:mm:ss" //date format for the logs
      log.print = .min // You can use also .full to display more info, like file, function, line or .none 
      log.destination = .console //this is the only option for now, maybe in future have the option in .cloud
      log.level = [.info, .warning, .error] //print all 😎

      /* Let's print stuff */ 
      log.print("verbose", for: .info)
      log.print("warning", for: .warning)
      log.print("error", for: .error)
      
      return true
   }
}
```
This will print

```
🟢 [date: 2021-02-20 14:03:33][message: "verbose"]
🟡 [date: 2021-02-20 14:03:33][message: "warning"]
🔴 [date: 2021-02-20 14:03:33][message: "error"]
```
## My Use Case

So I want to add logs as I am coding, but I don't want it always shows in my console, so this is what I do

```swift
log.print = .min //.min format please (will turn later to .none)
log.destination = .console
log.level = [.warning, .error] //just warnings and errors please
```

---

I'm [Rui Aureliano](http://ruiaureliano.com), iOS and macOS Engineer at [Olá Brothers](https://theolabrothers.com). We make [Sip](https://sipapp.io) 🤓

[Linkedin](https://www.linkedin.com/in/ruiaureliano) | [AngelList](https://angel.co/ruiaureliano) | [Twitter](https://twitter.com/ruiaureliano) | [Github](https://github.com/ruiaureliano) | [Medium](https://medium.com/@ruiaureliano) | [Stackoverflow](https://stackoverflow.com/users/881095/ruiaureliano)

