<template lang="html">
  <div
    id="sidebar"
    :class="[has_toggled ? 'floating' : '', 'hovered']"
    @focus="enter()"
    @mouseenter="enter()"
    @mouseleave="leave()"
  >
    <div class="top">
      <img src="/logo.png" />
      <h2>Truck-Kun <br />Services</h2>
      <div class="toggle pointer" @click="toggleNav()">
        <svg
          xmlns="http://www.w3.org/2000/svg"
          width="24px"
          height="24px"
          viewBox="0 0 24 24"
          fill="none"
          stroke="#00AAAD"
          stroke-width="2"
          stroke-linecap="round"
          stroke-linejoin="round"
          class="fill"
        >
          <circle cx="12" cy="12" r="10"></circle>
          <transition name="fade">
            <circle cx="12" cy="12" r="3" v-if="!has_toggled"></circle>
          </transition>
        </svg>
      </div>
    </div>
    <div class="shadow"></div>
    <div class="bottom">
      <ul class="list">
        <template v-for="(data, key) in links">
          <li class="item" :key="key" v-if="checkPermission(data.unique)">
            <nuxt-link
              :to="data.slug"
              custom
              v-slot="{ isActive, isExactActive }"
            >
              <a
                :class="[
                  'link',
                  'pointer',
                  data.subs && 'parent',
                  data.unique == 'inhouse-ads' && 'unique',
                  { active: isActive },
                  { exact: isExactActive },
                ]"
                @click.self="navigate(data, $event)"
              >
                <div class="link_icon" v-html="data.icon"></div>
                <span>{{ data.name }}</span>
              </a>
            </nuxt-link>
            <div class="sub" v-if="data.subs">
              <ul class="sub_list">
                <template v-for="(sub, key) in data.subs">
                  <li
                    class="sub_item"
                    :key="key"
                    v-if="checkPermission(sub.unique)"
                  >
                    <nuxt-link
                      :to="sub.slug"
                      custom
                      v-slot="{ href, navigate, isActive, isExactActive }"
                    >
                      <a
                        :class="[
                          'sub_link',
                          { active: isActive },
                          { exact: isExactActive },
                        ]"
                        :href="href"
                        @click="navigate"
                      >
                        <div class="sub_link_icon" v-html="sub.icon"></div>
                        <span>{{ sub.name }}</span>
                      </a>
                    </nuxt-link>
                  </li>
                </template>
              </ul>
            </div>
          </li>
        </template>
      </ul>
    </div>
  </div>
</template>

<script>
import { mapGetters } from "vuex";

export default {
  data: () => ({
    hovered: false,
  }),
  computed: {
    ...mapGetters({
      links: "global/sidebar/getLinks",
      has_toggled: "global/sidebar/hasToggled",
    }),
  },
  methods: {
    navigate(data, event) {
      const target = event.target;

      if (data.subs) {
        if (!target.parentNode.classList.contains("toggled")) {
          target.nextElementSibling.style.height = `${target.nextElementSibling.scrollHeight}px`;
          target.parentNode.classList.add("toggled");
        } else {
          target.nextElementSibling.style.height = 0;
          target.parentNode.classList.remove("toggled");
        }
      } else {
        this.$router.push(data.slug);
      }
    },
    enter() {
      const elements = document.querySelectorAll(".list .toggled .sub");

      if (!this.hovered) {
        elements.forEach((element, index) => {
          setTimeout(() => {
            let length = element.querySelectorAll(".sub_list").length,
              height = element.querySelector(".sub_list").scrollHeight,
              currentHeight = height * length;
            element.style.height = `${currentHeight}px`;
          }, 500);
        });
      }
      this.hovered = true;

      document.getElementById("sidebar").classList.add("hovered");
    },
    leave() {
      const elements = document.querySelectorAll(".list .toggled .sub");

      elements.forEach((element, index) => {
        setTimeout(() => {
          let length = element.querySelectorAll(".sub_list").length,
            height = element.querySelector(".sub_list").scrollHeight,
            currentHeight = height * length;
          element.style.height = `${currentHeight}px`;
        }, 500);
      });

      this.hovered = false;
      document.getElementById("sidebar").classList.remove("hovered");
    },
    toggleNav() {
      this.$store.commit("global/sidebar/checkToggler", {
        status: this.has_toggled ? false : true,
      });
    },
    checkHeightViewport() {
      let heightToDeduct = document.querySelector("#sidebar .top");
      if (document.documentElement && document.documentElement.clientHeight) {
        document.querySelector("#sidebar .bottom").style.maxHeight = `${
          document.documentElement.clientHeight - heightToDeduct.scrollHeight
        }px`;
      }
    },
  },
  mounted() {
    window.addEventListener("load", this.checkHeightViewport);
    window.addEventListener("resize", this.checkHeightViewport);

    setTimeout(() => {
      this.checkHeightViewport();
    }, 250);
  },
  destroyed() {
    window.removeEventListener("resize", this.checkHeightViewport);
    window.removeEventListener("load", this.checkHeightViewport);
  },
};
</script>
