import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var ans = 0
    let N = numbers.count
    
    
    func btk(from curr:Int, value:Int){
        if curr == N{
            ans += value==target ? 1:0
            return
        }
        
        let num = numbers[curr]
        btk(from: curr+1, value: value+num)
        btk(from: curr+1, value: value-num)
    }
    btk(from: 0, value: 0)
    
    return ans
}