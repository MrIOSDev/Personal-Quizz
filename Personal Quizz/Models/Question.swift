
struct Question {
    let title: String
    let answers: [Answer]
    let type: ResponseType
    
    static func getQuestions() -> [Question] {
        [
        Question(
            title: "Какую пищю предпочитаете?",
            answers: [
                Answer(title: "Стейк",type: .dog),
                Answer(title: "Рыбу", type: .cat),
                Answer(title: "Помои", type: .rat),
                Answer(title: "Матчу на ослиной моче", type: .frog)
            ],
            type: .single
        ),
        
        Question(
            title: "Что вам нравится больше?",
            answers: [
                Answer(title: "Плавать", type: .dog),
                Answer(title: "Спать", type: .cat),
                Answer(title: "Быть стервой", type: .rat),
                Answer(title: "Проглатывать ежедневные унижения ", type: .frog)
            ],
            type: .multiple
        ),
        
        Question(
            title: "Любите ли вы поездки на машине?",
            answers: [
                Answer(title: "Да", type: .dog),
                Answer(title: "Нет", type: .cat),
                Answer(title: "Люблю, когда по полу за волосы меня таскают", type: .rat),
                Answer(title: "Трустха", type: .frog)
            ],
            type: .range)
        ]
    }
}

enum ResponseType {
    case single
    case multiple
    case range
}

struct Answer {
    let title: String
    let type: AnimalType
}

enum AnimalType: Character {
    case dog = "🐶"
    case cat = "🐱"
    case rat = "🐀"
    case frog = "🐸"
    
    var definition: String {
        switch self {
        case .dog:
            return("Вам нравится окружать себя людьми")
        case .cat:
            return("Вы у себя на уме")
        case .rat:
            return("Вы Назена, вы знаете о всех сплетнях мира до того, как они появляются. Вам нравится играть подругу, чтоб люди с вами делились спллетнями, которые в последствии вы распространяете между людьми.")
        case .frog:
            return("Вы Тима, раньше вас еще называли ТИМА УЧИХА, вы любите быть мерзкой, вас часто бьют тапками пациенты за вашу мерзость.")
        }
    }
    
  
}

