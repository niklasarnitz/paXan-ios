// Copyright © 2019 SWDEC. All rights reserved.

import SwiftyUserDefaults
import UIKit.UIImage

// MARK: Strings
let firstPageTitle: String = "Willkommen in\nder paXan App!"

let firstPageSubtitle: String = "Cool, dass du da bist!\nIm Namen des SWDEC heißen wir dich herzlich Willkommen zu paXan 2020!"

let secondPageTitle: String = "Deine paXan App"

let secondPageSubtitle: String = "Damit wir dich in der App etwas persönlicher ansprechen können, gib bitte im unteren Textfeld deinen Vornamen ein. Den speichern wir natürlich nur auf deinem Gerät. 😉"

let secondPageTextFieldPlaceholder: String = "Vorname"

let setupContinueButtonTitle: String = "Weiter"

let thirdPageTitle: String = "Deine paXan Seminare"

let thirdPageSubtitle: String = "Trage hier unten bitte deine Seminare ein, für die du dich online angemeldet hast. Keine Angst, falls du etwas falsch machst, kannst du es später natürlich nocheinmal ändern."

let thirdPageTextFieldPlaceholderOne: String = "Seminar 1"

let thirdPageTextFieldPlaceholderTwo: String = "Seminar 2"

let thirdPageTextFieldPlaceholderThree: String = "Seminar 3"

let finalPageTitle: String = "Und jetzt...\nViel Spaß bei paXan!"

let finalPageSubtitle: String = "In der App findest du alles, was du früher in deinem Kongressheft gefunden hast."

let setupFinishButtonTitle: String = "Fertig"

let meinPaXanCaption: String = "paXan startet bald!\nDann kannst du\ndie App benutzen."

// MARK: Seminars
var backupSeminars: [Seminar] = [
    Seminar(
        title: "Born to be wild - Wie gründe ich einen EC vor Ort?",
        referent: "",
        description: "",
        roomname: "",
        lat: 0,
        long: 0,
        time: Date()
    ),
    Seminar(
        title: "Läuft – die geistliche Begleitung der Kinder und Jugendlichen",
        referent: "",
        description: "",
        roomname: "",
        lat: 0,
        long: 0,
        time: Date()
    ),
    Seminar(
        title: "EC to go",
        referent: "",
        description: "Mein Leben nach der Jugendarbeit",
        roomname: "",
        lat: 0,
        long: 0,
        time: Date()
    ),
    Seminar(
        title: "Jugendarbeit goes VIRAL",
        referent: "",
        description: "Social Media Relations in der Jugendarbeit",
        roomname: "",
        lat: 0,
        long: 0,
        time: Date()
    ),
    Seminar(
        title: "Einladend gestalten",
        referent: "",
        description: "Deine Flyer für die Jugendarbeit",
        roomname: "",
        lat: 0,
        long: 0,
        time: Date()
    ),
    Seminar(
        title: "Digital Natives & Co.",
        referent: "",
        description: "Strömungen in der Jugendarbeit begegnen und verstehen",
        roomname: "",
        lat: 0,
        long: 0,
        time: Date()
    ),
    Seminar(
        title: "Born to be wild - Wie gründe ich einen EC vor Ort?",
        referent: "",
        description: "",
        roomname: "",
        lat: 0,
        long: 0,
        time: Date()
    ),
    Seminar(
        title: "Born to be wild - Wie gründe ich einen EC vor Ort?",
        referent: "",
        description: "",
        roomname: "",
        lat: 0,
        long: 0,
        time: Date()
    ),
    Seminar(
        title: "Born to be wild - Wie gründe ich einen EC vor Ort?",
        referent: "",
        description: "",
        roomname: "",
        lat: 0,
        long: 0,
        time: Date()
    ),
    Seminar(
        title: "Born to be wild - Wie gründe ich einen EC vor Ort?",
        referent: "",
        description: "",
        roomname: "",
        lat: 0,
        long: 0,
        time: Date()
    ),
    Seminar(
        title: "Born to be wild - Wie gründe ich einen EC vor Ort?",
        referent: "",
        description: "",
        roomname: "",
        lat: 0,
        long: 0,
        time: Date()
    ),
    Seminar(
        title: "Born to be wild - Wie gründe ich einen EC vor Ort?",
        referent: "",
        description: "",
        roomname: "",
        lat: 0,
        long: 0,
        time: Date()
    ),
    Seminar(
        title: "Born to be wild - Wie gründe ich einen EC vor Ort?",
        referent: "",
        description: "",
        roomname: "",
        lat: 0,
        long: 0,
        time: Date()
    ),
    Seminar(
        title: "Born to be wild - Wie gründe ich einen EC vor Ort?",
        referent: "",
        description: "",
        roomname: "",
        lat: 0,
        long: 0,
        time: Date()
    ),

    ] {
    didSet {

    }
}

// MARK: Lexikon Entries
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
        description: "In gemütlicher Atmosphäre zusammen mit den anderen Leuten aus deiner Jugendarbeit die vielen Impulse und Anregungen innerhalb der eigenen Jugendarbeit reflektieren, wo du persönlich herausgefordert wurdest, was du zuhause beherzt angehen willst und wie die eigene Jugendarbeit/Gemeinde vorangebracht werden kann. Sucht euch zusammen ein lauschiges Plätzchen und genießt nebenher eine Runde Kaffee und Donuts. Diese könnt ihr in Kisten voher im großen Verpflegungszelt (bitte Beschilderung achten!) abholen und anschließend im Spülzelt abgeben.\n Die Gesprächsanregungen zu den jeweiligen Tagen und wie es nach paXan in deiner Jugendarbeit weitergehen kann findest du unter 'Info'."
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

// MARK: Referents

let backupReferents: [Referent] = [
    Referent(
        name: "Klaus Göttler",
        connection: "Johanneum",
        website: "johanneum.net",
        picture: "göttler"
    ),
    Referent(
        name: "Joachim Böker",
        connection: "Liebenzeller Mission",
        website: "liebenzell.org",
        picture: "böker"
    ),
    Referent(
        name: "Volker Gäckle",
        connection: "IHL",
        website: "ihl.de",
        picture: "gäckle"
    )
]
