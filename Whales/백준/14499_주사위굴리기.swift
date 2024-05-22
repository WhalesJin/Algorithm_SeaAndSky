
func 주사위굴리기() {
    
    //     front
    // left top right
    //      back
    //     bottom

    struct Dice {
        var top: Int = 0 // 위
        var bottom: Int = 0 // 아래
        var front: Int = 0
        var back: Int = 0
        var left: Int = 0
        var right: Int = 0
        
        mutating func moveUp(){
            let oldBottom = bottom
            
            bottom = front
            front = top
            top = back
            back = oldBottom
        }
        
        mutating func moveDown() {
            let oldBottom = bottom
            
            bottom = back
            back = top
            top = front
            front = oldBottom
        }
        
        mutating func moveLeft() {
            let oldLeft = left
            
            left = top
            top = right
            right = bottom
            bottom = oldLeft
        }
        
        mutating func moveRight() {
            let oldRight = right
            
            right = top
            top = left
            left = bottom
            bottom = oldRight
        }
    }

    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let n = input[0], m = input[1], _ = input[4]
    var x = input[2], y = input[3]
    var map = [[Int]](repeating: [], count: n)
    var dice = Dice()
    
    for i in 0..<n {
        map[i] = readLine()!.split(separator: " ").compactMap { Int($0) }
    }
    
    let directions = readLine()!.split(separator: " ").compactMap { Int($0) }
    
    for direction in directions {
        roll(direction)
    }
    
    func roll(_ direction: Int) {
        switch direction {
        case 1:
            y += 1
            
            if isValid(x, y) {
                dice.moveRight()
            } else {
                y -= 1
                return
            }
        case 2:
            y -= 1
            
            if isValid(x, y) {
                dice.moveLeft()
            } else {
                y += 1
                return
            }
        case 3:
            x -= 1
            
            if isValid(x, y) {
                dice.moveUp()
            } else {
                x += 1
                return
            }
        case 4:
            x += 1
            
            if isValid(x, y) {
                dice.moveDown()
            } else {
                x -= 1
                return
            }
        default:
            return
        }
        
        checkFloor(x, y)
    }
    
    func isValid(_ x: Int, _ y: Int) -> Bool {
        return 0..<n ~= x && 0..<m ~= y
    }
    
    func checkFloor(_ x: Int, _ y: Int) {
        let floor = map[x][y]
        
        if floor == 0 {
            map[x][y] = dice.bottom
        } else {
            dice.bottom = floor
            map[x][y] = 0
        }
        
        print(dice.top)
    }
}
