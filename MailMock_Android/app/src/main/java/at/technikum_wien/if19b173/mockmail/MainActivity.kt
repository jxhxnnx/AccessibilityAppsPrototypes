package at.technikum_wien.if19b173.mockmail

import android.content.Intent
import android.icu.util.TimeUnit
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.util.Log
import androidx.recyclerview.widget.DividerItemDecoration
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import kotlinx.coroutines.*
import java.time.Clock
import kotlin.system.measureTimeMillis
import kotlin.time.measureTime

class MainActivity : AppCompatActivity() {
    private lateinit var recyclerView : RecyclerView
    private lateinit var layoutManager : LinearLayoutManager
    private lateinit var adapter : ItemAdapter

    private lateinit var content : MutableList<MailItem>
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        content = createDummyMailList(30)
        initRecyclerView()
        CoroutineScope(Dispatchers.IO).launch {
            val timeInMillis = measureTimeMillis {
                delay(java.util.concurrent.TimeUnit.SECONDS.toMillis(10))
                withContext(Dispatchers.Main) {
                    content = reloadWithNewFirstItem()
                    adapter.notifyDataSetChanged()
                }
            }
            Log.d("LOG", "Elapsed time: ${timeInMillis}")
        }

    }

    private fun initRecyclerView()
    {
        recyclerView = findViewById(R.id.recyclerView)
        layoutManager = LinearLayoutManager(this, RecyclerView.VERTICAL, false)
        adapter = ItemAdapter(content)

        recyclerView.layoutManager = layoutManager
        recyclerView.adapter = adapter

        recyclerView.addItemDecoration(DividerItemDecoration(recyclerView.context, layoutManager.orientation))

        adapter.setOnItemClickListener(object: ItemAdapter.OnItemClickListener{
            override fun setOnItemClickListener(pos: Int) {
                content[pos].new = false
                val intent = Intent(applicationContext, DetailsActivity::class.java).apply {
                    putExtra("adress", content[pos].mailAddress)
                    putExtra("subject", content[pos].subject)
                    putExtra("content", content[pos].content)
                }
                startActivity(intent)
            }
        })
    }

    private fun reloadWithNewFirstItem() : MutableList<MailItem>
    {
        content.add(0, MailItem("test@testmail.com", "test Betreff", "test", "12:45", true))
        Log.d("LOG", "Item added to list")
        return content
    }


}