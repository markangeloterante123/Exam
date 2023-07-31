<template lang="html">
  <div id="header">
    <div class="header_nav">
      <div class="title">
        {{ user.role.name }}
      </div>
      <!-- <breadcrumb :separator="'◦'" /> -->
    </div>
    <div
      :class="`header_select ${is_toggled ? 'active' : ''}`"
      v-click-outside="close"
    >
      <div class="header_user" @click="showSelect()">
        <div class="user_picture">
          <div class="overlay">
            {{ user.user_detail.first_name.charAt(0)
            }}{{ user.user_detail.last_name.charAt(0) }}
          </div>
        </div>
        <div class="user_name">Welcome, {{ user.user_detail.first_name }}!</div>
      </div>
      <div class="user_select">
        <div class="select_header">
          <div class="select_info">
            <div class="header_name">
              {{ user.user_detail.first_name }} {{ user.user_detail.last_name }}
            </div>
            <div class="header_role">{{ user.role.name }}</div>
          </div>
        </div>
        <div class="select_footer">
          <div class="select_item"></div>
          <!-- <nuxt-link to="/my-account" class="select_item account" @click.native.self="is_toggled = false">
            <svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" viewBox="0 0 24 24" fill="none" stroke="#00AAAD" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
            <span>My Account</span>
          </nuxt-link> -->
          <div class="pointer select_item logout" @click="logout()">
            <span>Sign Out</span>
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
              class="icon"
            >
              <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path>
              <polyline points="16 17 21 12 16 7"></polyline>
              <line x1="21" y1="12" x2="9" y2="12"></line>
            </svg>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapGetters } from "vuex";

export default {
  data: () => ({
    is_toggled: false,
    user_logout: false,
    user: {
      role: {
        name: "",
      },
      user_detail: {
        first_name: "",
        last_name: "",
      },
    },
  }),
  watch: {
    $route(to, from) {
      if (!this.user_logout) {
        this.user = this.$auth.user;
      }
    },
  },
  computed: {
    ...mapGetters({
      title: "global/settings/getTitle",
    }),
  },
  methods: {
    showSelect() {
      this.is_toggled ^= true;
    },
    close(data = null) {
      this.is_toggled = false;
    },
    async logout() {
      this.toggleModalStatus({ type: "loader", status: true });
      await this.$auth.logout().then((res) => {
        setTimeout(() => {
          this.user_logout = true;
          this.toggleModalStatus({ type: "loader", status: false });
          window.location.assign("/");
        }, 500);
      });
    },
  },
  mounted() {
    this.user = this.$auth.user;
  },
};
</script>
