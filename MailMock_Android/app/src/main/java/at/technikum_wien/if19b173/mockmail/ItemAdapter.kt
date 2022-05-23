package at.technikum_wien.if19b173.mockmail

import android.graphics.Typeface
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView

class ItemAdapter(var dataSet: List<MailItem>) :
    RecyclerView.Adapter<ItemAdapter.ViewHolder>() {

    private lateinit var mListener : OnItemClickListener

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val view = LayoutInflater.from(parent.context).inflate(R.layout.text_row_item, parent, false)
        return ViewHolder(view, mListener)
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        holder.mailAdress.text = dataSet[position].mailAddress
        holder.mailSubject.text = dataSet[position].subject
        holder.mailTime.text = dataSet[position].time
        //Workaround, damit Screenreader Beschreibung und Inhalt vorliest
        //contentDescription overruled text
        if(dataSet[position].new)
        {
            holder.mailAdress.contentDescription = " neue Nachricht von ${dataSet[position].mailAddress}"
            holder.mailAdress.setTypeface(null, Typeface.BOLD);
        }
        else{
            holder.mailAdress.contentDescription = "von ${dataSet[position].mailAddress}"
        }

        holder.mailSubject.contentDescription = "Betreff ${dataSet[position].subject}"
        holder.mailTime.contentDescription = "um ${dataSet[position].time}"
    }

    override fun getItemCount(): Int {
        return dataSet.size
    }

    class ViewHolder(view: View, var mListener : OnItemClickListener) : RecyclerView.ViewHolder(view), View.OnClickListener {
        var mailAdress : TextView
        var mailSubject : TextView
        var mailTime : TextView

        init {
            // Define click listener for the ViewHolder's View.
            mailAdress = view.findViewById(R.id.tv_row_name)
            mailSubject = view.findViewById(R.id.tv_row_subject)
            mailTime = view.findViewById(R.id.tv_row_time)

            view.setOnClickListener(this)
        }

        override fun onClick(v: View?) {
            mListener.setOnItemClickListener(adapterPosition)
        }
    }

    interface OnItemClickListener{
        fun setOnItemClickListener(pos : Int)
    }

    fun setOnItemClickListener(mlistener:OnItemClickListener)
    {
        this.mListener = mlistener
    }

}