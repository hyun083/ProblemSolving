import Foundation

let N = Int(readLine()!)!
print("Gnomes:")
for _ in 0..<N{
    let arr = readLine()!.split(separator: " ").map{Int($0)!}
    if arr == arr.sorted(by: >) || arr == arr.sorted(by: <){
        print("Ordered")
    }else{
        print("Unordered")
    }
}