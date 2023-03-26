import Foundation

while let line = readLine(){
    if line == "#"{
        break
    }else{
        let input = line.map{String($0)}
        var cnt = 0
        for input in input {
            switch input{
            case "a","e","i","o","u","A","E","I","O","U":
                cnt += 1
            default:
                continue
            }
        }
        print(cnt)
    }
}