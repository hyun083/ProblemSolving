import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    let A = a.sorted(by: >)
    let B = b.sorted(by: >)
    
    var k = 0
    var ans = 0
    
    for i in 0..<A.count{
        if A[i] < B[k]{
            ans += 1
            k += 1
        }
        if k>=A.count{break}
    }
                                        
    return ans
}