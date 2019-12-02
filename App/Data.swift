// Copyright © 2019 SWDEC. All rights reserved.

import Foundation

// MARK: Strings
let firstPageTitle: String = "Willkommen in\nder paXan App!"

let firstPageSubtitle: String = "Cool, dass du da bist!\nIm Namen des SWDEC heißen wir dich herzlich Willkommen zu paXan 2020!"

let secondPageTitle: String = "Deine paXan App"

let secondPageSubtitle: String = "Damit wir dich in der App etwas persönlicher ansprechen können, gib bitte im unteren Textfeld deinen Vornamen ein. Den speichern wir natürlich nur auf deinem Gerät. 😉"

let secondPageTextFieldPlaceholder: String = "Vorname"

let setupContinueButtonTitle: String = "Weiter"

let thirdPageTitle: String = "Deine paXan Seminare"

let thirdPageSubtitle: String = "Trage hier unten bitte deine Seminare ein. Keine Angst, falsch du etwas falsch machst, kannst du es später natürlich nocheinmal ändern."

let thirdPageTextFieldPlaceholderOne: String = "Seminar 1"

let thirdPageTextFieldPlaceholderTwo: String = "Seminar 2"

let thirdPageTextFieldPlaceholderThree: String = "Seminar 3"

let finalPageTitle: String = "Und jetzt...\nViel Spaß bei paXan!"

let finalPageSubtitle: String = "In der App findest du alles, was du früher in deinem Kongressheft gefunden hast."

let setupFinishButtonTitle: String = "Fertig"

let meinPaXanCaption: String = "paXan startet bald!\nDann kannst du\ndie App benutzen."

// MARK: Seminars
let seminarBlockOneSeminars: [Seminar] = [
    Seminar(
        title: "Sind Schwaben richtige Christen?",
        referent: "Johannes Eisen",
        description: "Studien aus dem Badnerland",
        setPlace: Place(
            title: "Sind Schwaben richtige Christen?",
            roomname: "FSZ",
            lat: 48.796334,
            long: 8.503422
        )
    )!,
    Seminar(
        title: "Rettet Byzanz",
        referent: "Pabst Pius (?), Aaron Badior",
        description: "How to Kreuzzug, für Anfänger.",
        setPlace: Place(
            title: "Rettet Byzanz",
            roomname: "FSZ",
            lat: 48.796334,
            long: 8.503422
        )
    )!,
    Seminar(
        title: "Geschichten vom TMT",
        referent: "Johannes Eisen",
        description: "Geschichten die noch nie jemand in einer Andacht gehört hat ft. Eisen",
        setPlace: Place(
            title: "Geschichten vom TMT",
            roomname: "FSZ",
            lat: 48.796334,
            long: 8.503422
        )
    )!,
    Seminar(
        title: "Sind Herrgottsbscheiserle Gotteslästerung",
        referent: "Jan-Phillip Pfeiffer",
        description: "siehe Titel",
        setPlace: Place(
            title: "Sind Herrgottsbscheiserle Gotteslästerung",
            roomname: "FSZ",
            lat: 48.796334,
            long: 8.503422
        )
    )!,
    Seminar(
        title: "Flaggenworship für Anfänger",
        referent: "Anna Heck",
        description: "Worship anderer Art.",
        setPlace: Place(
            title: "Flaggenworship für Anfänger",
            roomname: "FSZ",
            lat: 48.796334,
            long: 8.503422
        )
    )!,
    Seminar(
        title: "Wie fühle ich mich bei Stromausfall? - Erleuchtet",
        referent: "Markus Mall",
        description: "Glaube auf Durststrecken",
        setPlace: Place(
            title: "Wie fühle ich mich bei Stromausfall? - Erleuchtet",
            roomname: "FSZ",
            lat: 48.796334,
            long: 8.503422
        )
    )!,
    Seminar(
        title: "Katholizismus im Altertum",
        referent: "Jost Schindler",
        description: "Frühes Christentum in Indogermanien",
        setPlace: Place(
            title: "Katholizismus im Altertum",
            roomname: "FSZ",
            lat: 48.796334,
            long: 8.503422
        )
    )!,
    Seminar(
        title: "Fisch auf dem Auto? - Absoluto Guto!",
        referent: "Tabea und Jan-Philipp Pfeiffer",
        description: "Wir brechen das Brot, trinken den Wein, doch zum Schnaxeln muss man verheiratet sein",
        setPlace: Place(
            title: "Fisch auf dem Auto? - Absoluto Guto!",
            roomname: "FSZ",
            lat: 48.796334,
            long: 8.503422
        )
    )!,
    Seminar(
        title: "How to dumme Seminarnamen erfinden",
        referent: "EC-Durmersheim",
        description: "Riggobert",
        setPlace: Place(
            title: "How to dumme Seminarnamen erfinden",
            roomname: "FSZ",
            lat: 48.796334,
            long: 8.503422
        )
    )!,
    Seminar(
        title: "Leitung durch Gemeinschaft in der Jugendarbeit",
        referent: "Erich Honecker",
        description: "Leitung nach Vorbild der DDR",
        setPlace: Place(
            title: "Leitung durch Gemeinschaft in der Jugendarbeit",
            roomname: "FSZ",
            lat: 48.796334,
            long: 8.503422
        )
    )!,
]

let seminarBlockTwoSeminars: [Seminar] = [
    Seminar(
        title: "Sind Schwaben richtige Christen?",
        referent: "Johannes Eisen",
        description: "Studien aus dem Badnerland",
        setPlace: Place(
            title: "Sind Schwaben richtige Christen?",
            roomname: "FSZ",
            lat: 48.796334,
            long: 8.503422
        )
    )!,
    Seminar(
        title: "Rettet Byzanz",
        referent: "Pabst Pius (?), Aaron Badior",
        description: "How to Kreuzzug, für Anfänger.",
        setPlace: Place(
            title: "Rettet Byzanz",
            roomname: "FSZ",
            lat: 48.796334,
            long: 8.503422
        )
    )!,
    Seminar(
        title: "Geschichten vom TMT",
        referent: "Johannes Eisen",
        description: "Geschichten die noch nie jemand in einer Andacht gehört hat ft. Eisen",
        setPlace: Place(
            title: "Geschichten vom TMT",
            roomname: "FSZ",
            lat: 48.796334,
            long: 8.503422
        )
    )!,
    Seminar(
        title: "Sind Herrgottsbscheiserle Gotteslästerung",
        referent: "Jan-Phillip Pfeiffer",
        description: "siehe Titel",
        setPlace: Place(
            title: "Sind Herrgottsbscheiserle Gotteslästerung",
            roomname: "FSZ",
            lat: 48.796334,
            long: 8.503422
        )
    )!,
    Seminar(
        title: "Flaggenworship für Anfänger",
        referent: "Anna Heck",
        description: "Worship anderer Art.",
        setPlace: Place(
            title: "Flaggenworship für Anfänger",
            roomname: "FSZ",
            lat: 48.796334,
            long: 8.503422
        )
    )!,
    Seminar(
        title: "Wie fühle ich mich bei Stromausfall? - Erleuchtet",
        referent: "Markus Mall",
        description: "Glaube auf Durststrecken",
        setPlace: Place(
            title: "Wie fühle ich mich bei Stromausfall? - Erleuchtet",
            roomname: "FSZ",
            lat: 48.796334,
            long: 8.503422
        )
    )!,
    Seminar(
        title: "Katholizismus im Altertum",
        referent: "Jost Schindler",
        description: "Frühes Christentum in Indogermanien",
        setPlace: Place(
            title: "Katholizismus im Altertum",
            roomname: "FSZ",
            lat: 48.796334,
            long: 8.503422
        )
    )!,
    Seminar(
        title: "Fisch auf dem Auto? - Absoluto Guto!",
        referent: "Tabea und Jan-Philipp Pfeiffer",
        description: "Wir brechen das Brot, trinken den Wein, doch zum Schnaxeln muss man verheiratet sein",
        setPlace: Place(
            title: "Fisch auf dem Auto? - Absoluto Guto!",
            roomname: "FSZ",
            lat: 48.796334,
            long: 8.503422
        )
    )!,
    Seminar(
        title: "How to dumme Seminarnamen erfinden",
        referent: "EC-Durmersheim",
        description: "Riggobert",
        setPlace: Place(
            title: "How to dumme Seminarnamen erfinden",
            roomname: "FSZ",
            lat: 48.796334,
            long: 8.503422
        )
    )!,
    Seminar(
        title: "Leitung durch Gemeinschaft in der Jugendarbeit",
        referent: "Erich Honecker",
        description: "Leitung nach Vorbild der DDR",
        setPlace: Place(
            title: "Leitung durch Gemeinschaft in der Jugendarbeit",
            roomname: "FSZ",
            lat: 48.796334,
            long: 8.503422
        )
    )!,
]

let seminarBlockThreeSeminars: [Seminar] = [
    Seminar(
        title: "Sind Schwaben richtige Christen?",
        referent: "Johannes Eisen",
        description: "Studien aus dem Badnerland",
        setPlace: Place(
            title: "Sind Schwaben richtige Christen?",
            roomname: "FSZ",
            lat: 48.796334,
            long: 8.503422
        )
    )!,
    Seminar(
        title: "Rettet Byzanz",
        referent: "Pabst Pius (?), Aaron Badior",
        description: "How to Kreuzzug, für Anfänger.",
        setPlace: Place(
            title: "Rettet Byzanz",
            roomname: "FSZ",
            lat: 48.796334,
            long: 8.503422
        )
    )!,
    Seminar(
        title: "Geschichten vom TMT",
        referent: "Johannes Eisen",
        description: "Geschichten die noch nie jemand in einer Andacht gehört hat ft. Eisen",
        setPlace: Place(
            title: "Geschichten vom TMT",
            roomname: "FSZ",
            lat: 48.796334,
            long: 8.503422
        )
    )!,
    Seminar(
        title: "Sind Mauldäschle Gotteslästerung",
        referent: "Jan-Phillip Pfeiffer",
        description: "siehe Titel",
        setPlace: Place(
            title: "Sind Mauldäschle Gotteslästerung",
            roomname: "FSZ",
            lat: 48.796334,
            long: 8.503422
        )
    )!,
    Seminar(
        title: "Flaggenworship für Anfänger",
        referent: "Anna Heck",
        description: "Worship anderer Art.",
        setPlace: Place(
            title: "Flaggenworship für Anfänger",
            roomname: "FSZ",
            lat: 48.796334,
            long: 8.503422
        )
    )!,
    Seminar(
        title: "Wie fühle ich mich bei Stromausfall? - Erleuchtet",
        referent: "Markus Mall",
        description: "Glaube auf Durststrecken",
        setPlace: Place(
            title: "Wie fühle ich mich bei Stromausfall? - Erleuchtet",
            roomname: "FSZ",
            lat: 48.796334,
            long: 8.503422
        )
    )!,
    Seminar(
        title: "Katholizismus im Altertum",
        referent: "Jost Schindler",
        description: "Frühes Christentum in Indogermanien",
        setPlace: Place(
            title: "Katholizismus im Altertum",
            roomname: "FSZ",
            lat: 48.796334,
            long: 8.503422
        )
    )!,
    Seminar(
        title: "Fisch auf dem Auto? - Absoluto Guto!",
        referent: "Tabea und Jan-Philipp Pfeiffer",
        description: "Wir brechen das Brot, trinken den Wein, doch zum Schnaxeln muss man verheiratet sein",
        setPlace: Place(
            title: "Fisch auf dem Auto? - Absoluto Guto!",
            roomname: "FSZ",
            lat: 48.796334,
            long: 8.503422
        )
    )!,
    Seminar(
        title: "How to dumme Seminarnamen erfinden",
        referent: "EC-Durmersheim",
        description: "Riggobert",
        setPlace: Place(
            title: "How to dumme Seminarnamen erfinden",
            roomname: "FSZ",
            lat: 48.796334,
            long: 8.503422
        )
    )!,
    Seminar(
        title: "Leitung durch Gemeinschaft in der Jugendarbeit",
        referent: "Erich Honecker",
        description: "Leitung nach Vorbild der DDR",
        setPlace: Place(
            title: "Leitung durch Gemeinschaft in der Jugendarbeit",
            roomname: "FSZ",
            lat: 48.796334,
            long: 8.503422
        )
    )!,
]

// MARK: Lexikon Entries
let lexikonEntries: [LexikonEntry?] = [
    LexikonEntry(
        title: "FSZ-Dobel",
        description: "Das Freizeitzentrum des SWDEC im schönen Ort Dobel, ist das Haupt-Schulungszentrum des SWDEC-Jugendverbandes.",
        roomname: "FSZ",
        lat: 48.796334,
        long: 8.503422
    ),
    LexikonEntry(
        title: "SWDEC",
        description: "Der SWDEC ist ein Unterverband der Weltweiten EC-Bewegung.\nEs is ein Verband christlicher Jugendarbeiten, bei denen Jesus Christus im Mittelpunkt des Lebens der Mitglieder und der Gemeinden steht.\nDer SWDEC arbeitet ebenfalls eng mit den Liebenzeller Gemeinschaften und der Evangelischen Landeskirche zusammen.",
        roomname: "",
        lat: 48.796334,
        long: 8.503422
    )
]
