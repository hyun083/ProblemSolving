import Foundation

var str = readLine()!
let arr = ["c=","c-","dz=","d-","lj","nj","s=","z="]
for a in arr{
    str = str.replacingOccurrences(of: a, with: "@")
}
print(str.count)
