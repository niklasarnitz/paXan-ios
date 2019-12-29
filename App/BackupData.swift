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
    Seminar(title: "Allah gut!?", subtitle: "Glauben wir alle an den gleichen Gott?", referent: "Ralf Albrecht", description: "Alle reden vom gleichen Gott. Der Absolutheitsanspruch Jesu. Geht das heute Ÿberhaupt noch?", roomname: "EC-FSZ", lat: 0.0, long: 0.0, time: "2020-04-10 15:00:00"),
    Seminar(title: "Allah vs. JHWH ", subtitle: "Das Wesen Gottes", referent: "Adnan Al-Masoud", description: "Gottesbild(-er) und HintergrŸnde/Lehre\nAllah oder JHWH\nIslam: wie kann ich als Christ fŸr gute Begegnungen arbeiten?\n", roomname: "EC-FSZ\r", lat: 0.0, long: 0.0, time: "2020-04-10 15:00:00"),
    Seminar(title: "Arsch hoch und raus ", subtitle: "Wie Jugendarbeit zu den Menschen kommt", referent: "Tobias Becker", description: "Struktur von Komm zu Geh\nWie sieht das konkret fŸr Jugendarbeiten aus? \nJungschar auf Spielplatz?\nMissionarische EinsŠtze\nFŸr Jugendarbeiten\nNatŸrlich auf Menschen zugehen", roomname: "EC-FSZ\r", lat: 0.0, long: 0.0, time: "2020-04-10 15:00:00"),
    Seminar(title: "Radikal", subtitle: "Kompromisslose Nachfolge", referent: "Patrick Berger", description: "Jesus nachfolgen: Was muss man aufgeben?\nRisikobereitschaft im Leben mit Jesus. Bereitschaft etwas zu riskieren um mehr zu gewinnen.\n", roomname: "EC-FSZ\r", lat: 0.0, long: 0.0, time: "2020-04-10 15:00:00"),
    Seminar(title: "Berlin, Berlin, wir fahren nach Berlin ", subtitle: "Wie politisch darf/muss mein Glaube sein?", referent: "Steffen Bilger", description: "", roomname: "EC-FSZ\r", lat: 0.0, long: 0.0, time: "2020-04-10 15:00:00"),
    Seminar(title: "Himmel + Hšlle", subtitle: "†berholtes Konzept oder RealitŠt?", referent: "Benjamin Binder", description: "", roomname: "EC-FSZ\r", lat: 0.0, long: 0.0, time: "2020-04-10 15:00:00"),
    Seminar(title: "(Un-)FAIR & (Un-)SOCIAL", subtitle: "Wenn andere durch meinen Konsum leiden", referent: "Ulrike Bruinings", description: "", roomname: "EC-FSZ\r", lat: 0.0, long: 0.0, time: "2020-04-10 15:00:00"),
    Seminar(title: "Holy spirit, you are welcome hereÉ?!", subtitle: "Leben aus der Kraft des Heiligen Geistes", referent: "Frank Claus", description: "", roomname: "EC-FSZ\r", lat: 0.0, long: 0.0, time: "2020-04-10 15:00:00"),
    Seminar(title: "Verfolgt fŸr Jesus", subtitle: "Was verfolgte Christen wirklich brauchen", referent: "Eugen Clehr (Open Doors)", description: "Christenverfolgung \nOpen Doors\nSecret church\n", roomname: "EC-FSZ\r", lat: 0.0, long: 0.0, time: "2020-04-10 15:00:00"),
    Seminar(title: "Influencer werden", subtitle: "Wie kšnnen wir unsere Teens mit Social Media erreichen?", referent: "Markus Deuschle", description: "", roomname: "EC-FSZ\r", lat: 0.0, long: 0.0, time: "2020-04-10 15:00:00"),
    Seminar(title: "Cojones!", subtitle: "MŠnnerarbeit in der Jugendarbeit entdecken", referent: "Niklas Ebert", description: "Echte MŠnner (Mann sein in der Jugendarbeit)\nwie MŠnner ihren Glauben leben und Verantwortung Ÿbernehmen", roomname: "EC-FSZ\r", lat: 0.0, long: 0.0, time: "2020-04-10 15:00:00"),
    Seminar(title: "Gemeinde, biblisches Auslaufmodell ", subtitle: "Welche Bedeutung hat Gemeinde in einer postmodernen Welt?", referent: "Hans-Joachim Eckstein", description: "1\n", roomname: "EC-FSZ\r", lat: 0.0, long: 0.0, time: "2020-04-10 15:00:00"),
    Seminar(title: "Neuer Wein in alte SchlŠuche?! ", subtitle: "Kann Jugendarbeit alteingesessene Gemeinden noch verŠndern oder sprengt es den Schlauch?", referent: "Klaus Ehrenfeuchter", description: "Sterbende Gemeinde (wie kann ich Jugend in den Godi integrieren?) Ð †beralterung \nGemeinde gestalten: was ist gut? Was kann besser sein? Wie kann ãichÒ es umsetzen?\n", roomname: "EC-FSZ\r", lat: 0.0, long: 0.0, time: "2020-04-10 15:00:00"),
    Seminar(title: "Sand im Getriebe ", subtitle: "Wie lšse ich Konflikte?", referent: "1 Fischer", description: "Mediation 1zu1 (in Konflikten vermitteln)\nSchwierige GesprŠche fŸhren\nKonflikte in der Gemeinde/in Teams\nVergebung Ð Konflikte bewŠltigen \n", roomname: "EC-FSZ\r", lat: 0.0, long: 0.0, time: "2020-04-10 15:00:00"),
    Seminar(title: "Uns gibtÕs auch! ", subtitle: "Als EC-Jugendarbeit in Rathaus, Schule, Zeitung und Co. wahrgenommen werden", referent: "Eberhard Fuhr", description: "Pressearbeit / …-Arbeit\nWie kommt mein EC in die Zeitung? Wie wird die Jugendarbeit im Ort wahrgenommen?\n", roomname: "EC-FSZ\r", lat: 0.0, long: 0.0, time: "2020-04-10 15:00:00"),
    Seminar(title: "Fake News or Good News ", subtitle: "Wahrheitsanspruch der Bibel", referent: "Volker GŠckle", description: "Wahrheit\nJesus sagt: ich bin die Wahrheit. Wie passt das mit westl. WahrheitsverstŠndnis zusammen?\n", roomname: "EC-FSZ\r", lat: 0.0, long: 0.0, time: "2020-04-10 15:00:00"),
    Seminar(title: "Smartphonejunkie", subtitle: "Vom Umgang mit suchtgefŠhrdeten Teens ", referent: "Ulrich Giesekus", description: "Guter Umgang im Teenkreis. Wie thematisiere ich das im TK gut...\nTheorie und ganz praktische Ideen:\n- alle Handys vor TK einsammeln?\n- wŠhrend Andacht off?", roomname: "EC-FSZ\r", lat: 0.0, long: 0.0, time: "2020-04-10 15:00:00"),
    Seminar(title: "Hartz IV und der Tag gehšrt dir ", subtitle: "Umgang mit Armen bei uns", referent: "Daniel Ginader", description: "Jesus geht zu den Armen, wo sind die bei uns? \nsoziales Engagement\n", roomname: "EC-FSZ\r", lat: 0.0, long: 0.0, time: "2020-04-10 15:00:00"),
    Seminar(title: "HaltÔs Maul und glaub?! ", subtitle: "Guter Umgang mit Zweifeln ", referent: "Josia Haupt", description: "Zweifel erlaubt?\nUmgang mit Zweifeln\n", roomname: "EC-FSZ\r", lat: 0.0, long: 0.0, time: "2020-04-10 15:00:00"),
    Seminar(title: "WARUM?", subtitle: "Gott und mein Leid", referent: "Rolf Hille", description: "", roomname: "EC-FSZ\r", lat: 0.0, long: 0.0, time: "2020-04-10 15:00:00"),
    Seminar(title: "Super Talent ", subtitle: "Geistesgaben entdecken und fŸr Jugendarbeit anwenden", referent: "Damaris Hoppe", description: "Geistesgaben (spektakulŠre etc.)", roomname: "EC-FSZ\r", lat: 0.0, long: 0.0, time: "2020-04-10 15:00:00"),
    Seminar(title: "Was?! DŠmonen auch bei uns? ", subtitle: "Okkultismus next door", referent: "Andreas KŠser", description: "Okkultismus\nPraktiken in unserem Kulturkreis\n", roomname: "EC-FSZ\r", lat: 0.0, long: 0.0, time: "2020-04-10 15:00:00"),
    Seminar(title: "Gemeinde-Speed-Dating", subtitle: "Chancen und Risiken des Gemeindehoppings", referent: "Daniel Koch", description: "", roomname: "EC-FSZ\r", lat: 0.0, long: 0.0, time: "2020-04-10 15:00:00"),
    Seminar(title: "KABOOM", subtitle: "Umgang mit verhaltensauffŠlligen Kindern", referent: "JŸrgen Kraft", description: "", roomname: "EC-FSZ\r", lat: 0.0, long: 0.0, time: "2020-04-10 15:00:00"),
    Seminar(title: "1+1+1 = 1 ", subtitle: "Was ist die Dreieinigkeit?", referent: "Cornelius Kuttler", description: "Dreieinigkeit Ð Wie stehen Vater, Sohn & Heiliger Geist in Beziehung und was bedeutet das fŸr meine Beziehung zu Gott? TrinitŠt Ð was ist das?", roomname: "EC-FSZ\r", lat: 0.0, long: 0.0, time: "2020-04-10 15:00:00"),
    Seminar(title: "The person you have called is temporarily not avil", subtitle: "Wenn Gott schweigt", referent: "Otto Lang", description: "", roomname: "EC-FSZ\r", lat: 0.0, long: 0.0, time: "2020-04-10 15:00:00"),
    Seminar(title: "Nicht nur alles fŸr die Birne ", subtitle: "Wie kann ich einen guten JK gestalten, ohne nur die Gymnasiasten auf Touren zu bringen?", referent: "Mario Lefebre", description: "Wie bekomme ich die Nicht-Gymniasiasten/RealschŸler in den Jugendbund/Teenkreis? Wo so viel kognitiv lŠuft!", roomname: "EC-FSZ\r", lat: 0.0, long: 0.0, time: "2020-04-10 15:00:00"),
    Seminar(title: "HŸh oder Hot", subtitle: "Wie treffe ich als Christ gute Entscheidungen?", referent: "Johannes Luithle", description: "", roomname: "EC-FSZ\r", lat: 0.0, long: 0.0, time: "2020-04-10 15:00:00"),
    Seminar(title: "Tu das, Judas!", subtitle: "PrŠdestination in der Bibel", referent: "Edgar Luz", description: "", roomname: "EC-FSZ\r", lat: 0.0, long: 0.0, time: "2020-04-10 15:00:00"),
    Seminar(title: "Interkulturelle Herausforderung durch FlŸchtlinge ", subtitle: "Wie integrieren wir Menschen aus anderen Kulturen?", referent: "Hermann Maier", description: "Kontakt mit FlŸchtlingen/Einbindung in die Kreise\n(Willkommenskultur in Kreisen)", roomname: "EC-FSZ\r", lat: 0.0, long: 0.0, time: "2020-04-10 15:00:00"),
    Seminar(title: "Can(«t) touch this?! ", subtitle: "Sexualethik im 21. Jahrhundert", referent: "Markus Mall", description: "Beziehungen, SexualitŠt Ð was sagt Gottes Wort? \nSex vor der Ehe; Wie gehen wir damit um?\n", roomname: "EC-FSZ\r", lat: 0.0, long: 0.0, time: "2020-04-10 15:00:00"),
    Seminar(title: "Back to nature", subtitle: "Wie eine Jungschar in der Natur aussehen kann", referent: "Klaus Mann", description: "Jungscharler motivieren, in die Natur zu gehen (coole Aktionen drau§en)\nGelŠndespiele\nPfadfinder muss dabei sein\n", roomname: "EC-FSZ\r", lat: 0.0, long: 0.0, time: "2020-04-10 15:00:00"),
    Seminar(title: "Delight in prayer ", subtitle: "Die Freude am Gebet", referent: "Hans-Georg Meier", description: "Was bewirkt Gebet? Delight in prayer\nGebet aus Sicht d. charismatischen/pfingstlichen Theologie und was man lernen kannÉ\nPassionsgeschichte nach Lukas\nKraft und Notwendigkeit des Gebets \nPower of Prayer (Notwendigkeit) \n", roomname: "EC-FSZ\r", lat: 0.0, long: 0.0, time: "2020-04-10 15:00:00"),
    Seminar(title: "Born to be wild", subtitle: "Wie grŸnde ich einen EC vor Ort?", referent: "Andreas MŸller", description: "EC-NeugrŸndung / Wiederbelebung\nCheckliste, wie geh ich es an?\nWarum EC? Struktur? Was macht uns aus?\nFokus liegt auf NeugrŸndung! \nDa gehšrt Vermittlung von Struktur dazu. \n", roomname: "EC-FSZ\r", lat: 0.0, long: 0.0, time: "2020-04-10 15:00:00"),
    Seminar(title: "Das Schšne und das Biest ", subtitle: "€sthetisierung und Professionalisierung von Jugendarbeit", referent: "Jonas Pštz", description: "€sthetisierung + Professionalisierung v. Jugendarbeit Ð Chance oder Zeitverschwendung", roomname: "EC-FSZ\r", lat: 0.0, long: 0.0, time: "2020-04-10 15:00:00"),
    Seminar(title: "Phantom-Vibrations-Syndrom", subtitle: "Von der Angst, (nicht) stŠndig erreichbar zu sein", referent: "Jeppe Rasmussen", description: "", roomname: "EC-FSZ\r", lat: 0.0, long: 0.0, time: "2020-04-10 15:00:00"),
    Seminar(title: "Willkommen im Himmel", subtitle: "Was kommt nach dem Tod?", referent: "Uwe Rechberger", description: "", roomname: "EC-FSZ\r", lat: 0.0, long: 0.0, time: "2020-04-10 15:00:00"),
    Seminar(title: "Schšpfung", subtitle: "Wie hat Gott da seine Finger im Spiel?", referent: "Thomas Schimmel", description: "Schšpfung/Evolution (Glaube/Wissenschaft)", roomname: "EC-FSZ\r", lat: 0.0, long: 0.0, time: "2020-04-10 15:00:00"),
    Seminar(title: "the unknown area: Ein Gott der straft und tštet ", subtitle: "Gott im AT", referent: "Hartmut Schmid", description: "Gott im AT / Generell AT\nWie entdecke ich Jesus im AT? \nGott im At und NT Ð Zorn vs. Liebe\n", roomname: "EC-FSZ\r", lat: 0.0, long: 0.0, time: "2020-04-10 15:00:00"),
    Seminar(title: "m/w/d: das 3. Geschlecht ", subtitle: "Die Gender-Diskussion verstehen", referent: "Stefan Schmidt", description: "", roomname: "EC-FSZ\r", lat: 0.0, long: 0.0, time: "2020-04-10 15:00:00"),
    Seminar(title: "Ich glaub, ich muss zum Optiker", subtitle: "Mit welcher Brille lese ich die Bibel", referent: "Tobias Schuckert", description: "", roomname: "EC-FSZ\r", lat: 0.0, long: 0.0, time: "2020-04-10 15:00:00"),
    Seminar(title: "Grünes Blut", subtitle: "Warum Mitgliedschaft wichtig ist", referent: "Simon Schuh", description: "", roomname: "EC-FSZ\r", lat: 0.0, long: 0.0, time: "2020-04-10 15:00:00"),
    Seminar(title: "Sex sells", subtitle: "Wie hŠngt Pornographie, Menschenhandel und Prostitution zusammen?", referent: "Justin Shrum", description: "Gerechtigkeit (wo/wie setze ich mich ein?)\nGerechtigkeit (Menschenhandel, ProstitutionÉ)\n", roomname: "EC-FSZ\r", lat: 0.0, long: 0.0, time: "2020-04-10 15:00:00"),
    Seminar(title: "Farbenfroh", subtitle: "Flipchart malen lernen", referent: "Mika Sinn", description: "Wie kann ich eine Andacht mit Flipchart visualisieren?\n", roomname: "EC-FSZ\r", lat: 0.0, long: 0.0, time: "2020-04-10 15:00:00"),
    Seminar(title: "Falsch abgebogen", subtitle: "Kann ich Gottes Plan fŸr mein Leben verfehlen?", referent: "Bjšrn Steinhilber", description: "", roomname: "EC-FSZ\r", lat: 0.0, long: 0.0, time: "2020-04-10 15:00:00"),
    Seminar(title: "DŸrfen wir selbst Gott spielen? ", subtitle: "Anfang und Ende, Abtreibung und Sterbehilfe", referent: "Wilfried Sturm", description: "Wie lange ist ein Leben lebenswert? (Sterbehilfe/lebenserhaltende Ma§nahmen)", roomname: "EC-FSZ\r", lat: 0.0, long: 0.0, time: "2020-04-10 15:00:00"),
    Seminar(title: "Bisch Vegetarier?", subtitle: "Warum wir missionarisch Menschen fischen mŸssen!", referent: "Gustavo Victoria", description: "", roomname: "EC-FSZ\r", lat: 0.0, long: 0.0, time: "2020-04-10 15:00:00"),
    Seminar(title: "Heldenschmiede", subtitle: "Wie aus Jungs MŠnner und aus MŠnnern Helden werden (nur fŸr MŠnner) ", referent: "Marc Waidelich", description: "", roomname: "EC-FSZ\r", lat: 0.0, long: 0.0, time: "2020-04-10 15:00:00"),
    Seminar(title: "Arbeit, Schule und EC ", subtitle: "Wie bekomme ich alles unter einen Hut?", referent: "Frank Walz", description: "Zeitmanagement", roomname: "EC-FSZ\r", lat: 0.0, long: 0.0, time: "2020-04-10 15:00:00"),
    Seminar(title: "Vorhang auf", subtitle: "Theater als kreative VerkŸndigung", referent: "Rosalie Weber", description: "", roomname: "EC-FSZ\r", lat: 0.0, long: 0.0, time: "2020-04-10 15:00:00"),
    Seminar(title: "LŠuft", subtitle: "Die geistliche Begleitung der Kinder und Jugendlichen", referent: "Johannes Wegner", description: "", roomname: "EC-FSZ\r", lat: 0.0, long: 0.0, time: "2020-04-10 15:00:00"),
    Seminar(title: "Influencer werden", subtitle: "Wie kšnnen wir unsere Teens mit Social Media erreichen?", referent: "Mira Weiss", description: "", roomname: "EC-FSZ\r", lat: 0.0, long: 0.0, time: "2020-04-10 15:00:00"),
    Seminar(title: "Wer checktÔs noch?", subtitle: "Adventisten, Neu-Apostolen, É", referent: "Bernd Wildermuth", description: "Verschiedene Kirchenstršmungen. Etwas Durchblick in den in (SŸd-)Deutschland gŠngigen Stršmungen.", roomname: "EC-FSZ\r", lat: 0.0, long: 0.0, time: "2020-04-10 15:00:00"),
    Seminar(title: "Schrumm Schrumm Evangelium kšnnen", subtitle: "Wie wir in kleinen Kreisen guten Lobpreis gestalten ", referent: "Jan Wšrner", description: "Lobpreis (im Jugendbund, mit Herz, Kultur, wie, warum, Hearts of Worship)\nLobpreis leiten\nLobpreisgestaltung in kleinen Kreisen\nLobpreis anleiten\nImpulse zur Gestaltung von Lobpreiszeiten\n", roomname: "EC-FSZ", lat: 0.0, long: 0.0, time: "2020-04-10 15:00:00")]

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
