import Foundation

let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int($0)!}
var x = -1
var y = -1
if arr == arr.sorted(by: >) {
    print(-1)
}else{
    for i in 0..<N-1{
        if arr[i] < arr[i+1]{
            x = i
            y = i+1
        }
    }
    
    for i in stride(from: N-1, through: 0, by: -1){
        if arr[i] > arr[x]{
            arr.swapAt(i, x)
            break
        }
    }
    let ans = arr[0..<y]+arr[y..<N].sorted(by: <)
    for ans in ans{
        print(ans,terminator: " ")
    }
}