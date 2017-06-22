package webservice

import com.google.gson.Gson
import org.jetbrains.ktor.application.call
import org.jetbrains.ktor.host.embeddedServer
import org.jetbrains.ktor.netty.Netty
import org.jetbrains.ktor.routing.get
import org.jetbrains.ktor.routing.routing
import org.jetbrains.ktor.content.*
import org.jetbrains.ktor.http.*

fun main(args: Array<String>) {
    embeddedServer(Netty, 7000) {
        routing {
            get("/") {
                val response = PingResponse("Hello Kotlin!", true)
                var content = TextContent(Gson().toJson(response), ContentType.Application.Json)
                call.respond(content)
            }
        }
    }.start(wait = true)
}
