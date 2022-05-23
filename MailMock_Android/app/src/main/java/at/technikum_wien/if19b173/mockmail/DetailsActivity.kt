package at.technikum_wien.if19b173.mockmail

import android.annotation.SuppressLint
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.view.Menu
import android.view.MenuItem
import android.widget.TextView

class DetailsActivity : AppCompatActivity() {

    private lateinit var mailAdressTextView : TextView
    private lateinit var subjectTextView : TextView
    private lateinit var contentTextView : TextView

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_details)
        initViewContent()

    }

    override fun onCreateOptionsMenu(menu: Menu?): Boolean {
        menuInflater.inflate(R.menu.app_bar_menu, menu)

        return true
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        when(item.itemId)
        {
            R.id.miAnswer -> {
                val intent = Intent(applicationContext, WriteMailActivity::class.java).apply {
                    putExtra("adress", intent.getStringExtra("adress"))
                    putExtra("subject", intent.getStringExtra("subject"))
                }
                startActivity(intent)
            }
        }

        return true
    }

    private fun initViewContent()
    {
        mailAdressTextView = findViewById(R.id.tv_details_address)
        subjectTextView = findViewById(R.id.tv_details_subject)
        contentTextView = findViewById(R.id.tv_details_content)

        mailAdressTextView.text = intent.getStringExtra("adress")
        subjectTextView.text = intent.getStringExtra("subject")
        contentTextView.text = intent.getStringExtra("content")
    }
}