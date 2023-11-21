import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    var res = ""
    var left:(x:Int, y:Int) = (3,0)
    var right:(x:Int, y:Int) = (3,2)
    var position:[(x:Int, y:Int)] = [(3,1),(0,0),(0,1),(0,2),
                                     (1,0),(1,1),(1,2),
                                     (2,0),(2,1),(2,2),]
    
    for number in numbers{
        if number%3 == 1{
            res += "L"
            left = position[number]
        }else if number%3==0 && number>0{
            res += "R"
            right = position[number]
        }else{
            let target = position[number]
            let DL = abs(target.x-left.x) + abs(target.y-left.y)
            let DR = abs(target.x-right.x) + abs(target.y-right.y)

            if DL < DR{
                res += "L"
                left = target
            }else if DL == DR{
                res += hand=="left" ? "L":"R"
                left = hand=="left" ? target:left
                right = hand=="right" ? target:right
            }else{
                res += "R"
                right = target
            }
        }
    }
    
    return res
}