<template>
    <div class="fixed right-2 top-[10%] opacity-50 flex flex-col items-end" v-if="!radio.settings.isOff && radio.settings.isChannelWithList && radio.settings.isExternalListShown">
        <span class="text-slate-300 shadow font-semibold underline">{{ radio.settings.customName ? `${radio.settings.customName.substring(0,15)}${radio.settings.customName.length >= 15 ? '...' : ''}` : radio.getLocale('radio_list') }}:</span>
        <ul class="text-slate-300 shadow text-right">
            <li v-for="user in radio.settings.externalListUsers">{{ (user.sign && user.sign !== '') ? user.sign.substring(0,15) : `` }}{{ (user.sign && user.sign !== '') ? ` | ` : `` }}{{ user.name.substring(0,15) }}</li>
        </ul>
    </div>
</template>
<script lang="ts" setup>
import { useRadio } from "@/stores/radio";

const radio = useRadio();
</script>
