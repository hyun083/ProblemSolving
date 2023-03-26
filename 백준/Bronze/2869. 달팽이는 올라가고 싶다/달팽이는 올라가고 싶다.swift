import Foundation

let inputs = readLine()!.split(separator: " ").map{Int(String($0))!}

let A = inputs[0]
let B = inputs[1]
let V = inputs[2]

let res = (V-B)/(A-B)

if((V-B)%(A-B) > 0){
    print(res+1)
}else{
    print(res)
}