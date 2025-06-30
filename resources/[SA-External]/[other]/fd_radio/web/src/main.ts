import { createApp } from "vue";
import { createPinia } from "pinia";
import App from "./App.vue";
import { VTooltip } from "floating-vue";
import { autoAnimatePlugin } from "@formkit/auto-animate/vue";

import "floating-vue/dist/style.css";
import "./assets/styles.css";
import { EventBus } from "./event-bus";

const pinia = createPinia();
const app = createApp(App);

window.addEventListener("message", (event) => {
  EventBus.emit(event.data.action, event.data.data || {});
});

app.use(pinia);
app.use(autoAnimatePlugin);
app.directive("tooltip", VTooltip);

app.mount("#felisRadioV2");
