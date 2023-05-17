import Foundation

let K = Int(readLine()!)!
var num = [Int]()

var largeLong = 0
var largeShort = 500

var smallLong = 0
var smallShort = 500

var largeLongIdx = -1
var largeShortIdx = -1
var tmpIdx = -1

for curr in 0..<6{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    num.append(info[1])
    if info[1] > largeLong{
        largeLong = info[1]
        largeLongIdx = curr
    }
}

if num[largeLongIdx-1<0 ? 5:largeLongIdx-1] < num[(largeLongIdx+1)%6]{
    largeShortIdx = (largeLongIdx+1)%6
    tmpIdx = largeLongIdx-1<0 ? 5:largeLongIdx-1
}else{
    largeShortIdx = largeLongIdx-1<0 ? 5:largeLongIdx-1
    tmpIdx = (largeLongIdx+1)%6
}
largeShort = num[largeShortIdx]

smallShort = largeShort - num[tmpIdx]
smallLong = largeLong - num[(tmpIdx+3)%6]

let largeSqr = largeLong*largeShort
let smallSqr = smallLong*smallShort
print((largeSqr - smallSqr)*K)