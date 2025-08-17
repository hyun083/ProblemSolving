import Foundation

while let line = readLine(){
    let X = Double(line)!
    if X < 0 {break}
    let Y = X*0.167
    print("Objects weighing \(String(format:"%.2f", X)) on Earth will weigh \(String(format:"%.2f", Y)) on the moon.")
}