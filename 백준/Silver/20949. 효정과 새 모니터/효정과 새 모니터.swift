import Foundation

let N = Int(readLine()!)!
var arr = [(num:Int, res:Int)]()
for num in 1...N{
    let WH = readLine()!.split(separator: " ").map{Int($0)!}
    let W = WH[0]*WH[0]
    let H = WH[1]*WH[1]
    let res = W+H
    arr.append((num,res))
}
arr.sort(by: {
    $0.res == $1.res ? $0.num<$1.num : $0.res>$1.res
})

for monitor in arr{
    print(monitor.num)
}