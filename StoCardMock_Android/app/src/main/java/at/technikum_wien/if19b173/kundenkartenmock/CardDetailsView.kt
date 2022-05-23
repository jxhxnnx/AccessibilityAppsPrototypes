package at.technikum_wien.if19b173.kundenkartenmock

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.TextView

class CardDetailsView : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_card_details_view)
        val textContent = findViewById<TextView>(R.id.tv_scanText)

        textContent.text = intent.getStringExtra("text")
    }
}