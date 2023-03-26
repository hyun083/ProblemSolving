import Foundation

var cnt = Set<Int>()
for _ in 0..<10{
    cnt.insert(Int(readLine()!)!%42)
}
print(cnt.count)