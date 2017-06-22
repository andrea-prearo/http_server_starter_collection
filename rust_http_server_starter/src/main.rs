#![feature(plugin)]
#![plugin(rocket_codegen)]

extern crate rocket;
extern crate rocket_contrib;
extern crate serde;
#[macro_use] extern crate serde_derive;

mod routes {
    use rocket_contrib::JSON;

    #[derive(Serialize)]
    pub struct PingResponse {
        message: String,
        success: bool
    }

    #[get("/")]
    pub fn ping() -> JSON<PingResponse> {
        JSON(PingResponse {
            message: String::from("Hello Rust!"),
            success: true
        })
    }
}

fn main() {
    rocket::ignite().mount("/", routes![routes::ping]).launch();
}
