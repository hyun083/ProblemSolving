import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    let N = genres.count
    var genreInfo = Dictionary<String,Int>()
    var songInfo = Dictionary<String,[(Int,Int)]>()
    var ans = [Int]()
    
    for i in 0..<N{
        let genre = genres[i]
        let play = plays[i]
        
        if genreInfo[genre] == nil{
            genreInfo[genre] = play
        }else{
            genreInfo[genre]! += play
        }
        
        if songInfo[genre] == nil{
            songInfo[genre] = [(i,play)]
        }else{
            songInfo[genre]!.append((i,play))
        }
    }
    
    for info in genreInfo.sorted(by: {$0.value > $1.value}){
        let genre = info.key
        let arr = songInfo[genre]!.sorted(by: {$0.1==$1.1 ? $0.0<$1.0:$0.1>$1.1})
        if arr.count == 1{
            ans.append(arr[0].0)
        }else{
            ans.append(arr[0].0)
            ans.append(arr[1].0)
        }
    }
    
    return ans
}