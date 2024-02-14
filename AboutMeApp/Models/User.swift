//
//  User.swift
//  AboutMeApp
//
//  Created by Vladimir Dmitriev on 12.02.24.
//

import Foundation

struct User {
    let userName: String
    let password: String
    let person: Person
    
    static func getUser() -> User {
        User(
            userName: "User",
            password: "11",
            person: Person(
                photo: "TimCook",
                firstName: "Tim",
                lastName: "Cook",
                company: "Apple",
                department: "Management",
                position: "CEO",
                bio: "Тим Кук родился в 1960 году в городе Мобил, штат Алабама, но детство провел в городке Робертсдейл. Мать будущего предпринимателя была фармацевтом, а отец — рабочим верфи. Кук мало рассказывал о своем детстве. Известна история о том, как он увидел расправу Ку-клукс-клана над негритянской семьей. Испугавшись, Тим крикнул, чтобы они остановились, но, приглядевшись, узнал в одном из участников действа местного священника и сбежал. Эта история, по словам предпринимателя, серьезно повлияла на его взгляды"
            )
        )
    }
}

struct Person {
    let photo: String
    let firstName: String
    let lastName: String
    
    var fullName: String {
        firstName + " " + lastName
    }
    
    let company: String
    let department: String
    let position: String
    
    let bio: String
}
