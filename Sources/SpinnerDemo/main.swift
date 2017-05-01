
import Spinner
import Foundation

let s = Spinner(source: SpinnerPattern.no19)
print("Start")
s.start()
sleep(3)
s.end()
print("end")
