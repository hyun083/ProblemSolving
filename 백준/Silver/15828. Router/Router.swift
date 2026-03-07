import Foundation

let N = Int(readLine()!)!
var buff = [String]()

while let line = readLine() {
    let data = line
    if data == "-1"{
        break
    } else if data == "0" {
        buff.removeFirst()
    } else {
        if buff.count >= N {
            continue
        } else {
            buff.append(data)
        }
    }
}
print(buff.isEmpty ? "empty":buff.joined(separator: " "))