import Foundation

let N = Int(readLine()!)!
var arr = Dictionary<String,Bool>()
for _ in 0..<N{
    let info = readLine()!.split(separator: " ").map{String($0)}
    let emp = info[0]
    let stat = info[1]
    
    if stat == "enter"{
        arr[emp] = true
    }else{
        arr[emp] = false
    }
}
print(arr.filter({$0.value == true}).keys.sorted(by: >).joined(separator: "\n"))