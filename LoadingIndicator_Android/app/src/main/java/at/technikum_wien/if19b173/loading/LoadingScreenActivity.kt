package at.technikum_wien.if19b173.loading

import android.content.Context
import android.content.Context.ACCESSIBILITY_SERVICE
import android.os.Bundle
import android.speech.tts.TextToSpeech
import android.util.Log
import android.util.Log.INFO
import android.view.View
import android.view.accessibility.AccessibilityEvent
import android.view.accessibility.AccessibilityEvent.TYPE_ANNOUNCEMENT
import android.view.accessibility.AccessibilityManager
import android.webkit.WebView
import android.widget.ProgressBar
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import java.util.*


class LoadingScreenActivity : AppCompatActivity(){

    // Declaring webView and progressBar
    lateinit var webView: WebView
    lateinit var progressBar: ProgressBar
    lateinit var textView: TextView

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_loading_screen)
        //AccessibilityHelper.announceForAccessibility(this, "Seite wird geladen")
        // Initializing Webview and
        // progressBar from the layout file
        webView = findViewById(R.id.webView)
        progressBar = findViewById(R.id.progressBar)
        textView = findViewById(R.id.tv)

        // Setting a webViewClient
        webView.webViewClient = WebViewClient()


        // Loading a URL
        webView.loadUrl("https://www.technikum-wien.at")
    }

    // Overriding WebViewClient functions
    inner class WebViewClient : android.webkit.WebViewClient() {

        // Load the URL
        override fun shouldOverrideUrlLoading(view: WebView, url: String): Boolean {
            view.loadUrl(url)
            return false
        }

        // ProgressBar will disappear once page is loaded
        override fun onPageFinished(view: WebView, url: String) {
            super.onPageFinished(view, url)
            progressBar.visibility = View.GONE
            textView.visibility = View.GONE
            AccessibilityHelper.announce(applicationContext, "Inhalt fertig geladen")
        }
    }
}

class AccessibilityHelper {
    companion object {
        @JvmStatic
        fun announce(context: Context, announcement: String)
        {
            context
                .getSystemService(ACCESSIBILITY_SERVICE)
                .let { it as AccessibilityManager }
                .let { accessibilityManager ->
                    AccessibilityEvent
                        .obtain()
                        .also {
                            it.text.add(announcement)
                            it.eventType = TYPE_ANNOUNCEMENT
                        }
                        .let {
                            accessibilityManager.sendAccessibilityEvent(it)
                        }
                }
        }
    }
}