package at.technikum_wien.if19b173.mockmail

data class MailItem(val mailAddress : String, val subject : String, val content : String, val time : String, var new : Boolean) {
}