package com.assortedfolk.date_night

import android.app.PendingIntent
import android.app.PendingIntent.FLAG_UPDATE_CURRENT
import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.content.Intent
import android.os.Build
import android.widget.RemoteViews
import androidx.annotation.RequiresApi

const val homeWidgetAction = "home_widget_action"
const val homeWidgetExtraKey = "pick"
const val herPick = "hers"
const val myPick = "mine"

class HomeWidget: AppWidgetProvider() {
    @RequiresApi(Build.VERSION_CODES.M)
    fun createIntent(extra:String, context: Context, requestCode: Int): PendingIntent {
        val intent = Intent(context, this::class.java)
        intent.putExtra(homeWidgetExtraKey, extra)
        intent.action = homeWidgetAction

        return PendingIntent.getBroadcast(
                context,
                requestCode,
                intent,
                /* flags = */
                FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE,
        )
    }

    @RequiresApi(Build.VERSION_CODES.M)
    override fun onUpdate(
            context: Context,
            appWidgetManager: AppWidgetManager,
            appWidgetIds: IntArray
    ) {
        appWidgetIds.forEach { appWidgetId ->
            val myClickPendingIntent = createIntent(myPick, context, 0)
            val herClickPendingIntent = createIntent(herPick, context, 1)

            val views: RemoteViews = RemoteViews(
                    context.packageName,
                    R.layout.home_widget
            ).apply {
                setOnClickPendingIntent(R.id.her_pick, herClickPendingIntent)
                setOnClickPendingIntent(R.id.my_pick, myClickPendingIntent)
            }

            appWidgetManager.updateAppWidget(appWidgetId, views)
        }
        super.onUpdate(context, appWidgetManager, appWidgetIds);
    }

    override fun onReceive(context: Context?, intent: Intent?) {
        if (intent?.action.equals(homeWidgetAction)) {
            val newPick = intent?.getStringExtra(homeWidgetExtraKey)
            setPick(newPick)
            val i = Intent(context, MainActivity::class.java)
            i.putExtra(homeWidgetExtraKey, newPick)
            i.action = homeWidgetAction
            i.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            context?.startActivity(i);
        }
        super.onReceive(context, intent)
    }
}
