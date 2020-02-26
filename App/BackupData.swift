// Copyright © 2019 SWDEC. All rights reserved.

import SwiftyUserDefaults
import UIKit.UIImage

let dateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    return dateFormatter
}()



// MARK: - Seminars
var backupSeminars: [Seminar] = [
    Seminar(title: "", subtitle: "", referent: "", roomname: "", lat: 0.0, long: 0.0, time: "2020-01-01 01:01:01")
]


// MARK: - Lexikon Entries
let backupLexikonEntries: [LexikonEntry] = [
    LexikonEntry(
        title: "BBistro",
        description: "Natürlich ist für deine Verpflegung bei den Hauptmahlzeiten bestens gesorgt. Es geht aber nichts über einen leckeren Snack zu später Stunde. Wenn dein Magen nach den Abendveranstaltungen wieder knurrt, dann laden wir dich herzlich in unser Bistro im kleinen Verpflegungszelt 1 ein. Den kleinen Abendsnack gibt es dort zwischen 21:30 Uhr und 23:30 Uhr: Crepes, Flammkuchen und andere Leckereien. Eis und kalte Getränke gibt es den ganzen Tag über im Foyer und abends auch im Bistro."
    ),
    LexikonEntry(
        title: "Bücher, Musik und Mehr",
        description: "In unserem Buchladen neben der Cafe-Lounge findest du unter anderem die Bücherm die von den Referenten empfohlen werden. Schau doch mal vorbei. Geöffnet haben wir täglich außerhalb der Veranstaltungen im Plenum zwischen 11:00Uhr und 22:00Uhr\n Beim Lesen müde geworden? Dann haben wir ein koffeinhaltiges Angebot für dich: wer in der Bücherstube für mehr als 20,- Euro einkauft, erhält einen Gutschein für einen Kaffee in der cafe-lounge."
    ),
    LexikonEntry(
        title: "Bustransfer",
        description: "Wir haben einen PEndelverkehr von/zu den Massenquatieren eingerichtet. Du kannst ihn über den unteren Button anzeigen lassen (noch nicht implementiert)\n Bitte beachte auhc entsprechende Ansagen im Programm!"
    ),
    LexikonEntry(
        title: "Cafe-Lounge",
        description: "Für alle die zwischen dem Frühstück und dem Schlafengehen nicht auf Koffein verzichten können, bieten wir im Bistrobereich des EC-FSZ eine große Auswahl an Kaffeespezialitäten und kleinen Snacks. Ein Schlaraffenland für alle Kaffee-kenner und -Genießer: Umgeben vom Duft der frisch gemahlenen Bohnen kannst du die Entstehung deines Kaffes live verfolgen. Was alles deinen Puls auf touren bringt und zum Verweilen einläd, findest du direkt an der Cafe-Lounge. Schau einfach mal auf einen Espresso vorbei."
    ),
    LexikonEntry(
        title: "Coffee-Time-Reflexionsrunde",
        description: "In gemütlicher Atmosphäre zusammen mit den anderen Leuten aus deiner Jugendarbeit die vielen Impulse und Anregungen innerhalb der eigenen Jugendarbeit reflektieren, wo du persönlich herausgefordert wurdest, was du zuhause beherzt angehen willst und wie die eigene Jugendarbeit/Gemeinde vorangebracht werden kann. Sucht euch zusammen ein lauschiges Plätzchen und genießt nebenher eine Runde Kaffee und Donuts. Diese könnt ihr in Kisten voher im großen Verpflegungszelt (bitte Beschilderung achten!) abholen und anschließend im Spülzelt abgeben.\n Die Gesprächsanregungen zu den jeweiligen Tagen und wie es nach paX an in deiner Jugendarbeit weitergehen kann findest du unter 'Info'."
    ),
    LexikonEntry(
        title: "Einlass",
        description: "Beim Check-In hast du aufgrund deiner Anmeldung ein Lanyard mit Namensschild bekommen. Bitte trage dieses während der gesamten Zeit sichtbar bei dir. Solltest du dein Namensschild verloren haben, melde dich im Kongressbüro."
    ),
    LexikonEntry(
        title: "Erste Hilfe",
        description: "Bei Verletzungen oder gesundheitlichen Problemen kannst du dich im Kongressbüro oder im Notfall unter 012345678 melden."
    ),
    LexikonEntry(
        title: "Fundsachen",
        description: "Falls du etwas gefunden oder verloren hast, kannst du es im Kongressbüro abgeben oder abholen."
    ),
    LexikonEntry(title: "Gepäck", description: ""),
    LexikonEntry(title: "Info-Stände", description: ""),
    LexikonEntry(title: "Kneipe", description: ""),
    LexikonEntry(title: "Kongressbüro", description: ""),
    LexikonEntry(title: "Massenquatiere", description: ""),
    LexikonEntry(title: "MP3", description: ""),
    LexikonEntry(title: "Opfer", description: ""),
    LexikonEntry(title: "Parken", description: ""),
    LexikonEntry(title: "Rauchen", description: ""),
    LexikonEntry(title: "Rückzugsmöglichkeit", description: ""),
    LexikonEntry(title: "Stille Zeit am Morgen", description: ""),
    LexikonEntry(title: "Toiletten", description: ""),
    LexikonEntry(title: "Verpflegung", description: ""),
    LexikonEntry(title: "Zeitraum", description: ""),
    LexikonEntry(title: "Zelten", description: ""),
]

// MARK: - Speakers

let backupSpeakers: [Referent] = [
    Referent(
        name: "Klaus Göttler",
        description: "",
        connection: "Johanneum",
        website: "johanneum.net",
        picture: "göttler"
    ),
    Referent(
        name: "Joachim Böker",
        description: "",
        connection: "Liebenzeller Mission",
        website: "liebenzell.org",
        picture: "böker"
    ),
    Referent(
        name: "Volker Gäckle",
        description: "",
        connection: "IHL",
        website: "ihl.de",
        picture: "gäckle"
    )
]
