package at.technikum_wien.if19b173.kundenkartenmock

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.cardview.widget.CardView
import com.google.android.material.floatingactionbutton.ExtendedFloatingActionButton
import com.google.android.material.floatingactionbutton.FloatingActionButton

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        val fab = findViewById<ExtendedFloatingActionButton>(R.id.fab)
        fab.setOnClickListener {
            val intent = Intent(applicationContext, AddNewCardActivity::class.java).apply {}
            startActivity(intent)
        }

        val card = findViewById<CardView>(R.id.card)
        card.setOnClickListener {
            val intent = Intent(applicationContext, CardDetailsView::class.java).apply {}
            startActivity(intent)
        }

    }
}