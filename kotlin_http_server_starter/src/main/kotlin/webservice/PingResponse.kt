package webservice

import com.google.gson.annotations.SerializedName

data class PingResponse(@SerializedName("message") val message: String, @SerializedName("success") val status: Boolean)
