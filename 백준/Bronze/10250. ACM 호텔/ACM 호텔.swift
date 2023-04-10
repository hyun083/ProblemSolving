import Foundation

var T = Int(readLine()!)!

for _ in 1...T{
    let inputs = readLine()!.split(separator: " ").map{Int(String($0))!}
    let H = inputs[0]; let W = inputs[1]; let N = inputs[2]
    var room = String()
    var flag = false; var cnt = 0;
    
    for i in 1...W{
        if flag {break}
        for k in 1...H{
            cnt += 1
            if(cnt == N){
                flag = true
                room = i < 10 ? String(k) + "0" + String(i) : String(k) + String(i)
                break
            }
        }
    }
    print(room)
}