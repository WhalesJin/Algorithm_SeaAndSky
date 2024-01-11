import Foundation

func result5397() {
    let count = Int(readLine()!)!

    for _ in 0..<count {
        let userInput = readLine()!
        var Ltext = ""
        var Rtext = ""

        for i in userInput {
            switch i {
            case "<":
                if Ltext.isEmpty == false {
                    Rtext.append(Ltext.popLast()!)
                }
            case ">":
                if Rtext.isEmpty == false {
                    Ltext.append(Rtext.popLast()!)
                }
            case "-":
                if Ltext.isEmpty == false {
                    Ltext.popLast()
                }

            default:
                Ltext.append(i)
            }
        }

        print(Ltext + Rtext.reversed())
    }
}
