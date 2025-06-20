import Foundation

let origin = readLine()!.map{String($0)}
let N = Int(readLine()!)!
var arr = [(str:String, value:Double)]()
for _ in 0..<N{
    let input = readLine()!.split(separator: " ").map{String($0)}
    let target = input[0].map{String($0)}
    let value = Double(input[1])!
    
    var oIdx = 0
    var tIdx = 0
    while oIdx<origin.count && tIdx<target.count{
        if origin[oIdx] == target[tIdx]{
            oIdx += 1
            tIdx += 1
        }else{
            tIdx += 1
        }
    }
    if oIdx == origin.count{
        arr.append((target.joined(), value/Double((target.count-origin.count))))
    }
}
arr.sort(by:{$0.value > $1.value})
print(arr.isEmpty ? "No Jam":arr[0].str)