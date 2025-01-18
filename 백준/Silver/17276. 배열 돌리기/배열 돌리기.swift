import Foundation

let T = Int(readLine()!)!

for _ in 0..<T{
    let ND = readLine()!.split(separator: " ").map{Int($0)!}
    let N = ND[0]
    let D = ND[1]
    var arr = [[String]]()
    
    for _ in 0..<N{
        let info = readLine()!.split(separator: " ").map{String($0)}
        arr.append(info)
    }
    
    func clockWise(){
        var tmp = [[String]]()
        tmp = arr
        for i in 0..<N{
            //diagnal -> vertical
            tmp[i][N/2] = arr[i][i]
            
            //horizontal -> diagnal
            tmp[i][i] = arr[N/2][i]
            
            //diagnal -> horizontal
            tmp[N/2][N-1-i] = arr[i][N-1-i]
            
            //vertical -> diagnal
            tmp[i][N-1-i] = arr[i][N/2]
        }
        arr = tmp
    }
    
    func antiClockWise(){
        var tmp = [[String]]()
        tmp = arr
        for i in 0..<N{
            //diagnal <- vertical
            tmp[i][i] = arr[i][N/2]
            
            //horizontal <= diagnal
            tmp[N/2][i] = arr[i][i]
            
            //diagnal <- horizontal
            tmp[N-1-i][i] = arr[N/2][i]
            
            //vertical <- diagnal
            tmp[i][N/2] = arr[i][N-1-i]
        }
        arr = tmp
    }
    
    let cnt = D/45<0 ? -1*D/45:D/45
    for _ in 0..<cnt{
        if D<0 {
            antiClockWise()
        }else{
            clockWise()
        }
    }
     
    for ans in arr{
        print(ans.joined(separator: " "))
    }
}