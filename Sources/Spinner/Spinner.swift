import Foundation

public final class Spinner {
  
  private let queue = DispatchQueue(label: "me.muukii.spinner")
  private var willContinue = true
  
  public let characters: [String]
  
  public init(source: String) {
    self.characters = source.characters.map { String($0) }
  }
  
  public func start() {
    setCusor(hidden: true)
    willContinue = true
    queue.async { [weak self] in
      
      guard let `self` = self else { return }
      var index: Int = 0

      while self.willContinue {
        // output("\u{001B}[2K")
        // output("\u{001B}[0K")
        self.output(self.characters[index])
        index += 1
        if self.characters.indices.contains(index) == false {
          index = 0
        }
        self.wait(seconds: 0.05)
        self.output("\u{001B}[1A\n")
      }
     
      self.output("\u{001B}[1A\n")      
    }
  }
  
  public func end() {
    self.willContinue = false
    setCusor(hidden: false)
  }
  
  private func output(_ v: String) {
    print(v, terminator: "")
    fflush(stdout)
  }
  
  private func setCusor(hidden: Bool) {
    if hidden {
      output("\u{001B}[?25l")
    } else {
      output("\u{001B}[?25h")
    }
  }
  
  private func wait(seconds: Double) {
    let factor = 1000 * 1000
    let microseconds = seconds * Double(factor)
    usleep(useconds_t(microseconds))
  }
}

