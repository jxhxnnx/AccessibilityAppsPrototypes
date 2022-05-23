package at.technikum_wien.if19b173.mockmail

import kotlin.random.Random

fun createDummyMailList (count : Int = 30) : MutableList<MailItem>{
    val namesList = listOf("John", "Sarah", "Harry", "Alexandra", "Thomas", "Sandra")
    val subjectList = listOf("Arbeit", "Urlaub", "Lustiges Katzenvideo", "Nigerianischer Prinz")
    val content = "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod " +
            "tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et" +
            " accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus " +
            "est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam " +
            "nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero" +
            " eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus " +
            "est Lorem ipsum dolor sit amet."

    return (1..count).map {
        MailItem(
            mailAddress = "${randomElementFromGivenList(namesList)}@dummyMail.at",
            subject = randomElementFromGivenList(subjectList),
            content = content,
            time = "12:30",
            new = false
        )
    } as MutableList<MailItem>
}

fun randomElementFromGivenList (list : List<String>) : String
{
    val randomIndex = Random.nextInt(list.size)
    return list[randomIndex]
}