//
//  Person.swift
//  FamilyTree
//
//  Created by Дмитрий Мельников on 28.04.2022
//

import Foundation

struct Person: Identifiable, Equatable {
    let id: UUID
    var name: String
    var patronymic: String
    var surname: String
    var birthDate: Date
    var deathDate: Date
    var hometown: String
    var occupation: String
    var avatarLink: String
    var parents: [UUID]
    var children: [UUID]
}

// MARK: - Test Data
extension Person {
    static var empty: Person {
        .init(
            id: UUID(),
            name: String(),
            patronymic: String(),
            surname: String(),
            birthDate: Date.future,
            deathDate: Date.future,
            hometown: String(),
            occupation: String(),
            avatarLink: String(),
            parents: [],
            children: []
        )
    }
    
    static let testArray: [Person] = {
        [
            .init(
                id: ._1,
                name: "Анна",
                patronymic: "Константиновна",
                surname: "Лаврентьева",
                birthDate: .init(isoDate:"4/5/1926"),
                deathDate: .init(isoDate:"10/9/1965"),
                hometown: "Екатеринбург",
                occupation: "Визажист",
                avatarLink: "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                parents: [],
                children: [._9]
            ),
            .init(
                id: ._2,
                name: "Марк",
                patronymic: "Константинович",
                surname: "Владимиров",
                birthDate: .init(isoDate:"6/9/1915"),
                deathDate: .init(isoDate:"29/8/1926"),
                hometown: "Самара",
                occupation: "Археолог",
                avatarLink: "https://images.pexels.com/photos/1300402/pexels-photo-1300402.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                parents: [],
                children: [._10]
            ),
            .init(
                id: ._3,
                name: "Анастасия",
                patronymic: "Сергеевна",
                surname: "Давыдова",
                birthDate: .init(isoDate:"8/5/1957"),
                deathDate: .init(isoDate:"19/11/1968"),
                hometown: "Воронеж",
                occupation: "Дизайнер",
                avatarLink: "https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                parents: [],
                children: [._10]
            ),
            .init(
                id: ._4,
                name: "Мария",
                patronymic: "Дмитриевна",
                surname: "Рогова",
                birthDate: .init(isoDate:"16/11/1968"),
                deathDate: .init(isoDate:"13/9/2005"),
                hometown: "Казань",
                occupation: "Принстонский университет",
                avatarLink: "https://images.pexels.com/photos/775358/pexels-photo-775358.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                parents: [],
                children: [._11]
            ),
            .init(
                id: ._5,
                name: "Милана",
                patronymic: "Дмитриевна",
                surname: "Литвинова",
                birthDate: .init(isoDate:"4/3/2018"),
                deathDate: .init(isoDate:"14/4/2020"),
                hometown: "Ростов-на-Дону",
                occupation: "Программист",
                avatarLink: "https://images.pexels.com/photos/2379005/pexels-photo-2379005.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                parents: [],
                children: [._11]
            ),
            .init(
                id: ._6,
                name: "Георгий",
                patronymic: "Александрович",
                surname: "Высоцкий",
                birthDate: .init(isoDate:"28/3/1989"),
                deathDate: .init(isoDate:"6/11/1994"),
                hometown: "Воронеж",
                occupation: "Facebook",
                avatarLink: "https://images.pexels.com/photos/769745/pexels-photo-769745.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                parents: [],
                children: [._12]
            ),
            .init(
                id: ._7,
                name: "Иван",
                patronymic: "Дмитриевич",
                surname: "Киселев",
                birthDate: .init(isoDate:"27/4/1977"),
                deathDate: .init(isoDate:"27/10/1990"),
                hometown: "Новосибирск",
                occupation: "Гинеколог",
                avatarLink: "https://images.pexels.com/photos/2770600/pexels-photo-2770600.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                parents: [],
                children: [._12]
            ),
            .init(
                id: ._8,
                name: "Всеволод",
                patronymic: "Максимович",
                surname: "Андреев",
                birthDate: .init(isoDate:"21/8/1989"),
                deathDate: .init(isoDate:"1/3/2018"),
                hometown: "Волгоград",
                occupation: "Швея",
                avatarLink: "https://images.pexels.com/photos/1139743/pexels-photo-1139743.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                parents: [._2, ._1],
                children: [._13]
            ),
            .init(
                id: ._9,
                name: "Марсель",
                patronymic: "Иванович",
                surname: "Морозов",
                birthDate: .init(isoDate:"23/2/1925"),
                deathDate: .init(isoDate:"9/2/1925"),
                hometown: "Екатеринбург",
                occupation: "Хирург",
                avatarLink: "https://images.pexels.com/photos/3018993/pexels-photo-3018993.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                parents: [._4, ._3],
                children: [._13]
            ),
            .init(
                id: ._10,
                name: "Сафия",
                patronymic: "Владимировна",
                surname: "Никольская",
                birthDate: .init(isoDate:"24/8/1921"),
                deathDate: .init(isoDate:"28/2/2016"),
                hometown: "Новосибирск",
                occupation: "Технолог пищевого производства",
                avatarLink: "https://images.pexels.com/photos/236214/pexels-photo-236214.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                parents: [._6, ._5],
                children: [._14]
            ),
            .init(
                id: ._12,
                name: "Глеб",
                patronymic: "Артёмович",
                surname: "Рябов",
                birthDate: .init(isoDate:"26/9/1943"),
                deathDate: .init(isoDate:"26/9/2014"),
                hometown: "Новосибирск",
                occupation: "Психолог",
                avatarLink: "https://images.pexels.com/photos/3110392/pexels-photo-3110392.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                parents: [._8, ._7],
                children: [._14]
            ),
            .init(
                id: ._13,
                name: "Алина",
                patronymic: "Михайловна",
                surname: "Зайцева",
                birthDate: .init(isoDate:"8/11/1920"),
                deathDate: .init(isoDate:"8/1/1989"),
                hometown: "Воронеж",
                occupation: "Таможенник",
                avatarLink: "https://images.pexels.com/photos/3823495/pexels-photo-3823495.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                parents: [._10, ._9],
                children: [._15]
            ),
            .init(
                id: ._14,
                name: "Вероника",
                patronymic: "Матвеевна",
                surname: "Елисеева",
                birthDate: .init(isoDate:"19/1/1976"),
                deathDate: .init(isoDate:"17/2/2014"),
                hometown: "Нижний Новгород",
                occupation: "Агент рекламный",
                avatarLink: "https://images.pexels.com/photos/509236/pexels-photo-509236.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                parents: [._12, ._11],
                children: [._15]
            ),
            .init(
                id: ._15,
                name: "Софья",
                patronymic: "Артемьевна",
                surname: "Петрова",
                birthDate: .init(isoDate:"11/7/1931"),
                deathDate: .init(isoDate:"11/10/2020"),
                hometown: "Волгоград",
                occupation: "Facebook",
                avatarLink: "https://images.pexels.com/photos/40900/dependent-dementia-woman-old-40900.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                parents: [._14, ._13],
                children: [._16, ._17, ._18]
            ),
            .init(
                id: ._16,
                name: "Тимур",
                patronymic: "Константинович",
                surname: "Масленников",
                birthDate: .init(isoDate:"29/7/1983"),
                deathDate: .init(isoDate:"8/2/1985"),
                hometown: "Санкт-Петербург",
                occupation: "Олигофренопедагог",
                avatarLink: "https://images.pexels.com/photos/4057756/pexels-photo-4057756.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                parents: [._15],
                children: [._19, ._20]
            ),
            .init(
                id: ._17,
                name: "Артём",
                patronymic: "Ильич",
                surname: "Миронов",
                birthDate: .init(isoDate:"12/10/1993"),
                deathDate: .init(isoDate:"22/11/2019"),
                hometown: "Санкт-Петербург",
                occupation: "Уральский государственный архитектурно-художественный университет",
                avatarLink: "https://images.pexels.com/photos/8317651/pexels-photo-8317651.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                parents: [._15],
                children: [._31]
            ),
            .init(
                id: ._18,
                name: "Мирон",
                patronymic: "Демидович",
                surname: "Лебедев",
                birthDate: .init(isoDate:"2/11/1908"),
                deathDate: .init(isoDate:"6/9/2009"),
                hometown: "Воронеж",
                occupation: "Режиссер",
                avatarLink: "https://images.pexels.com/photos/3087878/pexels-photo-3087878.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                parents: [._15],
                children: [._21]
            ),
            .init(
                id: ._19,
                name: "Мадина",
                patronymic: "Алиевна",
                surname: "Константинова",
                birthDate: .init(isoDate:"27/2/1990"),
                deathDate: .init(isoDate:"14/7/2003"),
                hometown: "Екатеринбург",
                occupation: "Верстальщик",
                avatarLink: "https://images.pexels.com/photos/1642228/pexels-photo-1642228.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                parents: [._16],
                children: []
            ),
            .init(
                id: ._20,
                name: "Артём",
                patronymic: "Ильич",
                surname: "Титов",
                birthDate: .init(isoDate:"25/4/1988"),
                deathDate: .init(isoDate:"16/1/2017"),
                hometown: "Санкт-Петербург",
                occupation: "Библиотекарь (библиограф)",
                avatarLink: "https://images.pexels.com/photos/413959/pexels-photo-413959.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                parents: [._16],
                children: [._23, ._24, ._25]
            ),
            .init(
                id: ._21,
                name: "Ева",
                patronymic: "Кирилловна",
                surname: "Сизова",
                birthDate: .init(isoDate:"6/5/2012"),
                deathDate: .init(isoDate:"27/8/2013"),
                hometown: "Челябинск",
                occupation: "Менеджер по рекламе",
                avatarLink: "https://images.pexels.com/photos/301958/pexels-photo-301958.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                parents: [._17],
                children: [._26, ._27]
            ),
            .init(
                id: ._22,
                name: "Дмитрий",
                patronymic: "Сергеевич",
                surname: "Миронов",
                birthDate: .init(isoDate:"27/8/2005"),
                deathDate: .init(isoDate:"24/4/2011"),
                hometown: "Санкт-Петербург",
                occupation: "Риэлтор",
                avatarLink: "https://images.pexels.com/photos/388517/pexels-photo-388517.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                parents: [._18],
                children: [._28, ._29, ._30]
            ),
            .init(
                id: ._23,
                name: "Пётр",
                patronymic: "Егорович",
                surname: "Голованов",
                birthDate: .init(isoDate:"29/1/1905"),
                deathDate: .init(isoDate:"6/9/1959"),
                hometown: "Волгоград",
                occupation: "Токарь",
                avatarLink: "https://images.pexels.com/photos/227288/pexels-photo-227288.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                parents: [._20],
                children: []
            ),
            .init(
                id: ._24,
                name: "Ника",
                patronymic: "Дамировна",
                surname: "Лапина",
                birthDate: .init(isoDate:"21/9/1945"),
                deathDate: .init(isoDate:"23/6/1970"),
                hometown: "Омск",
                occupation: "Строитель",
                avatarLink: "https://images.pexels.com/photos/428321/pexels-photo-428321.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                parents: [._20],
                children: []
            ),
            .init(
                id: ._25,
                name: "Богдан",
                patronymic: "Артёмович",
                surname: "Ларионов",
                birthDate: .init(isoDate:"10/6/1950"),
                deathDate: .init(isoDate:"7/10/2018"),
                hometown: "Самара",
                occupation: "Врач",
                avatarLink: "https://images.pexels.com/photos/1181424/pexels-photo-1181424.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                parents: [._20],
                children: []
            ),
            .init(
                id: ._26,
                name: "Иван",
                patronymic: "Платонович",
                surname: "Калинин",
                birthDate: .init(isoDate:"8/3/1980"),
                deathDate: .init(isoDate:"14/6/2008"),
                hometown: "Новосибирск",
                occupation: "Гинеколог",
                avatarLink: "https://images.pexels.com/photos/1912868/pexels-photo-1912868.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                parents: [._21],
                children: []
            ),
            .init(
                id: ._27,
                name: "Антонина",
                patronymic: "Павловна",
                surname: "Климова",
                birthDate: .init(isoDate:"12/5/1911"),
                deathDate: .init(isoDate:"20/11/1912"),
                hometown: "Самара",
                occupation: "Корректор",
                avatarLink: "https://images.pexels.com/photos/1462636/pexels-photo-1462636.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                parents: [._21],
                children: []
            ),
            .init(
                id: ._28,
                name: "София",
                patronymic: "Филипповна",
                surname: "Иванова",
                birthDate: .init(isoDate:"16/9/2000"),
                deathDate: .init(isoDate:"15/6/2003"),
                hometown: "Пермь",
                occupation: " ",
                avatarLink: "https://images.pexels.com/photos/618669/pexels-photo-618669.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                parents: [._22],
                children: []
            ),
            .init(
                id: ._29,
                name: "Анна",
                patronymic: "Дмитриевна",
                surname: "Воронина",
                birthDate: .init(isoDate:"25/6/1985"),
                deathDate: .init(isoDate:"30/1/1986"),
                hometown: "Воронеж",
                occupation: "Искусствовед",
                avatarLink: "https://images.pexels.com/photos/1104007/pexels-photo-1104007.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                parents: [._22],
                children: []
            ),
            .init(
                id: ._30,
                name: "Кирилл",
                patronymic: "Николаевич",
                surname: "Мальцев",
                birthDate: .init(isoDate:"21/7/1948"),
                deathDate: .init(isoDate:"12/8/1981"),
                hometown: "Уфа",
                occupation: "Писатель",
                avatarLink: "https://images.pexels.com/photos/1620769/pexels-photo-1620769.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                parents: [._22],
                children: []
            ),
            .init(
                id: ._31,
                name: "Наталья",
                patronymic: "Ярославовна",
                surname: "Агеева",
                birthDate: .init(isoDate:"23/5/1965"),
                deathDate: .init(isoDate:"20/11/1968"),
                hometown: "Красноярск",
                occupation: "Маркетолог",
                avatarLink: "https://images.pexels.com/photos/1858063/pexels-photo-1858063.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                parents: [._17],
                children: []
            )
        ]
    }()
}

fileprivate extension UUID {
    static let _1 = UUID(uuidString: "67D9C799-29AD-4F01-9F70-0ACE351CCF01")!
    static let _2 = UUID(uuidString: "67D9C799-29AD-4F01-9F70-0ACE351CCF02")!
    static let _3 = UUID(uuidString: "67D9C799-29AD-4F01-9F70-0ACE351CCF03")!
    static let _4 = UUID(uuidString: "67D9C799-29AD-4F01-9F70-0ACE351CCF04")!
    static let _5 = UUID(uuidString: "67D9C799-29AD-4F01-9F70-0ACE351CCF05")!
    static let _6 = UUID(uuidString: "67D9C799-29AD-4F01-9F70-0ACE351CCF06")!
    static let _7 = UUID(uuidString: "67D9C799-29AD-4F01-9F70-0ACE351CCF07")!
    static let _8 = UUID(uuidString: "67D9C799-29AD-4F01-9F70-0ACE351CCF08")!
    static let _9 = UUID(uuidString: "67D9C799-29AD-4F01-9F70-0ACE351CCF09")!
    static let _10 = UUID(uuidString: "67D9C799-29AD-4F01-9F70-0ACE351CCF10")!
    static let _11 = UUID(uuidString: "67D9C799-29AD-4F01-9F70-0ACE351CCF11")!
    static let _12 = UUID(uuidString: "67D9C799-29AD-4F01-9F70-0ACE351CCF12")!
    static let _13 = UUID(uuidString: "67D9C799-29AD-4F01-9F70-0ACE351CCF13")!
    static let _14 = UUID(uuidString: "67D9C799-29AD-4F01-9F70-0ACE351CCF14")!
    static let _15 = UUID(uuidString: "67D9C799-29AD-4F01-9F70-0ACE351CCF15")!
    static let _16 = UUID(uuidString: "67D9C799-29AD-4F01-9F70-0ACE351CCF16")!
    static let _17 = UUID(uuidString: "67D9C799-29AD-4F01-9F70-0ACE351CCF17")!
    static let _18 = UUID(uuidString: "67D9C799-29AD-4F01-9F70-0ACE351CCF18")!
    static let _19 = UUID(uuidString: "67D9C799-29AD-4F01-9F70-0ACE351CCF19")!
    static let _20 = UUID(uuidString: "67D9C799-29AD-4F01-9F70-0ACE351CCF20")!
    static let _21 = UUID(uuidString: "67D9C799-29AD-4F01-9F70-0ACE351CCF21")!
    static let _22 = UUID(uuidString: "67D9C799-29AD-4F01-9F70-0ACE351CCF22")!
    static let _23 = UUID(uuidString: "67D9C799-29AD-4F01-9F70-0ACE351CCF23")!
    static let _24 = UUID(uuidString: "67D9C799-29AD-4F01-9F70-0ACE351CCF24")!
    static let _25 = UUID(uuidString: "67D9C799-29AD-4F01-9F70-0ACE351CCF25")!
    static let _26 = UUID(uuidString: "67D9C799-29AD-4F01-9F70-0ACE351CCF26")!
    static let _27 = UUID(uuidString: "67D9C799-29AD-4F01-9F70-0ACE351CCF27")!
    static let _28 = UUID(uuidString: "67D9C799-29AD-4F01-9F70-0ACE351CCF28")!
    static let _29 = UUID(uuidString: "67D9C799-29AD-4F01-9F70-0ACE351CCF29")!
    static let _30 = UUID(uuidString: "67D9C799-29AD-4F01-9F70-0ACE351CCF30")!
    static let _31 = UUID(uuidString: "67D9C799-29AD-4F01-9F70-0ACE351CCF31")!
}
