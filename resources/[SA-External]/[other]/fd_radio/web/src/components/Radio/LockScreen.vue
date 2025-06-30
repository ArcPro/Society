<template>
  <div class="flex h-full flex-1 flex-col overflow-hidden">
    <div
      class="flex items-center justify-between gap-1 bg-zinc-700 py-1 px-2 text-xs text-white"
    >
      <span class="flex items-center gap-1">
        <i class="fa-solid fa-volume-high"></i>
        <span class="font-semibold">{{ radio.settings.volume }}%</span>
      </span>
      <span class="flex items-end gap-1">
        <span class="font-semibold" v-if="radio.settings.current">{{
          radio.settings.customName
            ? radio.settings.customName.substring(0, 10)
            : radio.settings.current
        }}</span>
        <i class="fa-solid fa-signal" v-if="radio.settings.current"></i>
        <i class="fa-solid fa-close" v-else></i>
      </span>
    </div>
    <div
      class="flex flex-1 flex-col gap-2 overflow-hidden py-2 px-2 text-white"
    >
      <div
        class="inline-flex divide-x-[0.1vh] divide-gray-300/50 overflow-hidden rounded-md shadow-sm"
      >
        <button
          @click="radio.setTab('main')"
          v-tooltip.auto="{
            content: radio.getLocale('go_back'),
            placement: 'bottom',
          }"
          type="button"
          class="relative inline-flex flex-1 items-center justify-center bg-zinc-700 py-2 text-xs font-medium text-white transition duration-150 ease-linear hover:bg-zinc-600 hover:text-white"
        >
          <i class="fa-solid fa-arrow-left"></i>
        </button>
        <button
          @click="radio.toggleChannelState()"
          v-tooltip.auto="{
            content: radio.settings.isChannelLocked
              ? radio.getLocale('lock_button')
              : radio.getLocale('unlock_button'),
            placement: 'bottom',
          }"
          type="button"
          class="relative inline-flex flex-1 items-center justify-center bg-zinc-700 py-2 text-xs font-medium text-white transition duration-150 ease-linear hover:bg-zinc-600 hover:text-white"
        >
          <i
            class="fa-solid fa-lock"
            v-if="!radio.settings.isChannelLocked"
          ></i>
          <i class="fa-solid fa-lock-open" v-else></i>
        </button>
      </div>
      <div
        class="no-scrollbar flex w-full flex-1 flex-col gap-2 overflow-y-auto rounded-md"
      >
        <span class="text-xs"
          >{{ radio.getLocale("channel_is") }}:
          {{
            radio.settings.isChannelLocked
              ? radio.getLocale("locked_status")
              : radio.getLocale("unlocked_status")
          }}
        </span>
        <div>
          <label for="name" class="block text-xs font-medium text-white">{{
            radio.getLocale("invite_user")
          }}</label>
          <div class="mt-1">
            <input
              v-model="radio.inviteId"
              type="text"
              id="name"
              class="block w-full rounded-lg border-gray-300 bg-transparent text-xs text-white shadow-sm placeholder:text-white"
              placeholder="22"
            />
          </div>
        </div>
        <div>
          <button
            @click="radio.invitePlayer()"
            type="button"
            class="inline-flex w-full items-center justify-center rounded-lg border border-transparent bg-zinc-700 px-2.5 py-1.5 text-xs font-medium text-white shadow-sm hover:bg-zinc-600 focus:outline-none"
          >
            {{ radio.getLocale("invite_button") }}
          </button>
        </div>
      </div>
    </div>
  </div>
</template>
<script setup lang="ts">
import { useRadio } from "@/stores/radio";

const radio = useRadio();
</script>
