extern crate stdweb;
extern crate yew;

use stdweb::web::Date;
use yew::services::ConsoleService;
use yew::{html, Callback, ClickEvent, Component, ComponentLink, Html, ShouldRender};

pub struct Model {
    value: i64,
    increment: Callback<ClickEvent>,
    decrement: Callback<ClickEvent>,
    inc2: Callback<ClickEvent>,
    console: ConsoleService,
}

pub enum Msg {
    Increment,
    Decrement,
    Bulk(Vec<Msg>),
}

impl Component for Model {
    type Message = Msg;
    type Properties = ();

    fn create(_: Self::Properties, link: ComponentLink<Self>) -> Self {
        Model {
            value: 0,
            increment: link.callback(|_| Msg::Increment),
            decrement: link.callback(|_| Msg::Decrement),
            inc2: link.callback(|_| Msg::Bulk(vec![Msg::Increment, Msg::Increment])),
            console: ConsoleService::new(),
        }
    }

    fn update(&mut self, msg: Self::Message) -> ShouldRender {
        match msg {
            Msg::Increment => {
                self.value = self.value + 1;
                self.console.log("plus one");
            }
            Msg::Decrement => {
                self.value = self.value - 1;
                self.console.log("minus one");
            }
            Msg::Bulk(list) => {
                for msg in list {
                    self.update(msg);
                    self.console.log("Bulk action");
                }
            }
        }
        true
    }

    fn view(&self) -> Html {
        html! {
          <div>
            <nav class="menu",>
              <button onclick=&self.increment>{ "Increment" }</button>
              <button onclick=&self.decrement>{ "Decrement" }</button>
              <button onclick=&self.inc2>
                { "Increment Twice" }
              </button>
            </nav>
            <p>{ self.value }</p>
            <p>{ Date::new().to_string() }</p>
          </div>
        }
    }
}
