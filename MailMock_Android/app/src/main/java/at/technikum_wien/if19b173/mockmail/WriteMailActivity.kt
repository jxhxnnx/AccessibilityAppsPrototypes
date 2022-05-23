package at.technikum_wien.if19b173.mockmail

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.Button
import android.widget.EditText
import android.widget.TextView
import android.widget.Toast

class WriteMailActivity : AppCompatActivity() {

    private lateinit var receiverEditText : EditText
    private lateinit var subjectEditText : EditText
    private lateinit var sendButton : Button

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_write_mail)
        initViewContent()
    }

    private fun initViewContent()
    {
        receiverEditText = findViewById(R.id.et_writeMail_receiver)
        subjectEditText = findViewById(R.id.et_writeMail_subject)
        sendButton = findViewById(R.id.btn_send)

        receiverEditText.setText(intent.getStringExtra("adress"))
        subjectEditText.setText(intent.getStringExtra("subject"))

        sendButton.setOnClickListener()
        { it: View? ->
            Toast.makeText(applicationContext, "Mail erfolgreich gesendet", Toast.LENGTH_SHORT).show()
            Thread.sleep(2000)
            val intent = Intent(applicationContext, MainActivity::class.java)
            startActivity(intent)
        }
    }
}