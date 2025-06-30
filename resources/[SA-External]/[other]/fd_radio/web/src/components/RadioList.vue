<template>
  <div
    class="no-scrollbar fixed left-5 top-1/2 flex max-h-[50vh] min-h-[50vh] -translate-y-1/2 transform flex-col gap-1 overflow-auto focus:outline-none"
    v-if="radio.quickJoinIsShown"
    v-auto-animate
  >
    <div
      class="flex flex-grow-0 cursor-default gap-2 rounded bg-stone-900/80 px-4 py-2 text-base font-semibold text-white hover:cursor-pointer hover:bg-stone-600"
      v-for="item in radio.quickJoinList"
      @click="radio.connectToRadio(item.channel)"
    >
      <span
        >{{ item.name || radio.getLocale("unknown") }} ({{
          item.channel
        }}
        MHz)</span
      >
      <span v-if="radio.settings.current == item.channel" v-auto-animate>
        <i class="fa-solid fa-wifi"></i
      ></span>
    </div>
  </div>
</template>

<script setup lang="ts">
import { useRadio } from "@/stores/radio";
import { EventBus } from "@/event-bus";

const radio = useRadio();

EventBus.on("radio:toggleRadioList", (data: any) => {
  radio.quickJoinList = [];
  radio.quickJoinIsShown = data.state;

  if (data.data) {
    radio.quickJoinList = data.data;
  }
});
</script>
