import Foundation

let N = Int(readLine()!)!
var total = 0

for _ in 1...N {
    let input = readLine()!.map{String($0)}
    var num = ""
    
    for data in input {
        if data == "0" || data=="6" || data=="9"{
            num.append("9")
        }else{
            num.append(data)
        }
    }
    total += Int(num)!>100 ? 100:Int(num)!
}
print(Int(round(Double(total)/Double(N))))