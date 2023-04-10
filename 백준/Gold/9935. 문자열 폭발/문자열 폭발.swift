import Foundation

var text = readLine()!
var bomb = readLine()!
let bombLen = bomb.count
let triger = String(bomb.last!)
var temp = [String]()

for t in text.map({String($0)}){
    temp.append(t)
    if temp.count >= bombLen && temp.last! == triger{
        if temp[(temp.count-bombLen)...].joined() == bomb{
            for _ in 0..<bombLen{ temp.removeLast() }
        }
    }
}
print(temp.isEmpty ? "FRULA":temp.joined())