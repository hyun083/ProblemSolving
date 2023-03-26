import Foundation

let line = readLine()!.split(separator: " ").map{String($0)}
let line0 = line[0].map{$0}
let line1 = line[1].map{$0}
var king = [Int(line0[0].asciiValue!),Int(String(line0[1]))!]
var dol = [Int(line1[0].asciiValue!),Int(String(line1[1]))!]
let n = Int(line[2])!
let cmd = ["R":0,"L":1,"B":2,"T":3,"RT":4,"LT":5,"RB":6,"LB":7]
let dx = [1,-1,0,0,1,-1,1,-1]
let dy = [0,0,-1,1,1,1,-1,-1]

for _ in 0..<n{
    let line = readLine()!
    let idx = cmd[line]!
    
    var knx = king[0]+dx[idx]
    var kny = king[1]+dy[idx]
    
    if 65<=knx && knx<=72 && 1<=kny && kny<=8{
        if knx==dol[0] && kny==dol[1]{
            let dnx = dol[0]+dx[idx]
            let dny = dol[1]+dy[idx]
            if 65<=dnx && dnx<=72 && 1<=dny && dny<=8{
                dol[0] = dnx
                dol[1] = dny
            }else{
                knx = king[0]
                kny = king[1]
            }
        }
        king[0] = knx
        king[1] = kny
    }
}
print(Character(UnicodeScalar(king[0])!),terminator: String(king[1])+"\n")
print(Character(UnicodeScalar(dol[0])!),terminator: String(dol[1]))