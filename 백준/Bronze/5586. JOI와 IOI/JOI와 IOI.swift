import Foundation

let str = readLine()!.map{String($0)}
var JOI = 0
var IOI = 0

for i in 0..<str.count-2{
    let res = str[i]+str[i+1]+str[i+2]
    JOI += res=="JOI" ? 1:0
    IOI += res=="IOI" ? 1:0
}
print(JOI)
print(IOI)