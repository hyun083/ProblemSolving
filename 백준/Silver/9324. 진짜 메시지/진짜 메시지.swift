import Foundation

for _ in 0..<Int(readLine()!)!{
    var dic = [String:Int]()
    let message = readLine()!.map{String($0)}
    var ans = "OK"
    var idx = 0
    
    while idx < message.count{
        let ch = message[idx]
        
        if dic[ch] == nil{
            dic[ch] = 1
        }else {
            dic[ch]! += 1
        }
        
        if dic[ch]! == 3{
            if idx == message.count-1{
                ans = "FAKE"
                break
            }else{
                if message[idx] == message[idx+1]{
                    dic[ch]! = 0
                    idx += 2
                    continue
                }else{
                    ans = "FAKE"
                    break
                }
            }
        }
        
        idx += 1
    }
    print(ans)
}