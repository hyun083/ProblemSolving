import Foundation

let n = Int(readLine()!)!
var arr = [0]
arr += readLine()!.split(separator: " ").map{Int(String($0))!}

for _ in 0..<Int(readLine()!)!{
    let line = readLine()!.split(separator: " ").map{Int(String($0))!}
    let number = line[1]
    if line[0] == 1{
        for i in stride(from: number, through: n, by: number){
            if arr[i] == 0 {
                arr[i] = 1
            }else{
                arr[i] = 0
            }
        }
    }else{
        for i in 0...min(number-1, n-number){
            if arr[number-i] == arr[number+i]{
                if arr[number-i] == 0{
                    arr[number-i] = 1
                    arr[number+i] = 1
                }else{
                    arr[number-i] = 0
                    arr[number+i] = 0
                }
            }else{
                break
            }
        }
        
    }
}
for i in 1...n{
    if i % 20 == 0{
        print(arr[i])
    }else{
        print(arr[i],terminator: " ")
    }
}