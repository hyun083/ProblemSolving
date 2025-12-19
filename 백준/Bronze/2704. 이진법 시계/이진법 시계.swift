import Foundation

let N = Int(readLine()!)!
for _ in 0..<N{
    var arr = Array(repeating: Array(repeating: "0", count: 6), count: 3)
    
    let time = readLine()!.split(separator: ":").map{Int(String(Int($0)!,radix: 2))!}
    let hour = time[0]
    let minuite = time[1]
    let second = time[2]
    
    arr[0] = String(format: "%06d", hour).map{String($0)}
    arr[1] = String(format: "%06d", minuite).map{String($0)}
    arr[2] = String(format: "%06d", second).map{String($0)}
    
    for i in 0..<6{
        for k in 0..<3{
            print(arr[k][i],terminator: "")
        }
    }
    print(" ",terminator: "")
    for i in 0..<3{
        for k in 0..<6{
            print(arr[i][k],terminator: "")
        }
    }
    print("\n",terminator: "")
}