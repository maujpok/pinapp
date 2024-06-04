package com.example.pinapp_challenge

import CommentsApiImpl
import io.flutter.embedding.android.FlutterActivity
import android.os.Bundle

class MainActivity : FlutterActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        CommentsApi.setUp(flutterEngine!!.dartExecutor.binaryMessenger, CommentsApiImpl())
    }
}