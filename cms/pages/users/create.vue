<template lang="html">
  <div id="dashboard" v-if="loaded">
    <div class="actions">
      <nuxt-link to="/users" class="cancel button pointer">
        <svg
          xmlns="http://www.w3.org/2000/svg"
          width="24px"
          height="24px"
          viewBox="0 0 24 24"
          fill="none"
          stroke="#fff"
          stroke-width="2"
          stroke-linecap="round"
          stroke-linejoin="round"
        >
          <line x1="19" y1="12" x2="5" y2="12"></line>
          <polyline points="12 19 5 12 12 5"></polyline>
        </svg>
        <span>Back</span>
      </nuxt-link>
    </div>

    <validation-observer
      tag="form"
      ref="form"
      id="form"
      class="form mb seventy"
      @submit.prevent="submit()"
    >
      <div class="box mb">
        <div class="top_box inline">
          <h2>Information</h2>
          <div>
            <div
              id="switch"
              :class="[form_data.enabled ? 'toggled success' : 'cancel']"
            >
              <label for="switch" @click="form_data.enabled ^= true"></label>
              <input
                type="checkbox"
                name="switch"
                id="switch"
                :checked="form_data.enabled"
              />
              <span>Active</span>
            </div>
          </div>
        </div>
        <div class="bottom_box">
          <div class="group_inline two">
            <validation-provider
              tag="div"
              class="group bordered"
              name="first_name"
              :rules="{ required: true }"
              v-slot="{ errors }"
            >
              <label for="first_name">First Name *</label>
              <input
                type="text"
                class="input"
                name="first_name"
                autocomplete="off"
                placeholder="Enter first name"
                v-model="form_data.first_name"
              />
              <transition name="slide"
                ><span class="validate" v-if="errors.length > 0">{{
                  errors[0]
                }}</span></transition
              >
            </validation-provider>
            <validation-provider
              tag="div"
              class="group bordered"
              name="last_name"
              :rules="{ required: true }"
              v-slot="{ errors }"
            >
              <label for="last_name">Last Name *</label>
              <input
                type="text"
                class="input"
                name="last_name"
                autocomplete="off"
                placeholder="Enter last name"
                v-model="form_data.last_name"
              />
              <transition name="slide"
                ><span class="validate" v-if="errors.length > 0">{{
                  errors[0]
                }}</span></transition
              >
            </validation-provider>
          </div>
          <div class="group_inline two nmb">
            <validation-provider
              tag="div"
              class="group select bordered nmb"
              name="role"
              :rules="{ required: true }"
              v-slot="{ errors }"
            >
              <label for="role_id">Role *</label>
              <select
                class="input"
                name="role_id"
                autocomplete="off"
                v-model="form_data.role_id"
              >
                <option value="" disabled selected>Select role</option>
                <option
                  :value="role.id"
                  v-for="(role, key) in roles"
                  :key="key"
                >
                  {{ role.name }}
                </option>
              </select>
              <div class="dd"></div>
              <transition name="slide"
                ><span class="validate" v-if="errors.length > 0">{{
                  errors[0]
                }}</span></transition
              >
            </validation-provider>
            <validation-provider
              tag="div"
              class="group bordered nmb"
              name="email"
              :rules="{ required: true, email: true }"
              v-slot="{ errors }"
            >
              <label for="email">Email *</label>
              <input
                type="text"
                class="input"
                name="email"
                autocomplete="off"
                placeholder="Enter email"
                v-model="form_data.email"
              />
              <transition name="slide"
                ><span class="validate" v-if="errors.length > 0">{{
                  errors[0]
                }}</span></transition
              >
            </validation-provider>
          </div>
        </div>
      </div>
      <div class="box mb">
        <div class="top_box">
          <h2>Password</h2>
        </div>
        <div class="bottom_box">
          <div class="group_inline two nmb">
            <validation-provider
              tag="div"
              class="group bordered"
              name="password"
              :rules="{ required: true, min: 5, max: 30 }"
              vid="password"
              v-slot="{ errors }"
            >
              <label for="password">Password *</label>
              <input
                :type="show.password ? 'text' : 'password'"
                class="input"
                autocomplete="off"
                name="password"
                v-model="form_data.password"
                placeholder="Enter password"
              />
              <div
                :class="['icon pointer', show.password ? 'active' : '']"
                @click="toggleAction('password')"
              >
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  width="25"
                  height="16.667"
                  viewBox="0 0 25 16.667"
                >
                  <path
                    class="icon_a"
                    d="M24.849,12.2A13.921,13.921,0,0,0,12.5,4.5,13.923,13.923,0,0,0,.151,12.2a1.4,1.4,0,0,0,0,1.267,13.921,13.921,0,0,0,12.349,7.7,13.923,13.923,0,0,0,12.349-7.7A1.4,1.4,0,0,0,24.849,12.2ZM12.5,19.083a6.25,6.25,0,1,1,6.25-6.25A6.25,6.25,0,0,1,12.5,19.083Zm0-10.417a4.137,4.137,0,0,0-1.1.164,2.077,2.077,0,0,1-2.9,2.9,4.157,4.157,0,1,0,4-3.068Z"
                    transform="translate(0 -4.5)"
                  />
                </svg>
              </div>
              <transition name="slide"
                ><span class="validate" v-if="errors.length > 0">{{
                  errors[0]
                }}</span></transition
              >
            </validation-provider>
            <validation-provider
              tag="div"
              class="group bordered"
              name="confirm password"
              :rules="{
                required: true,
                min: 5,
                max: 30,
                confirmed: 'password',
              }"
              v-slot="{ errors }"
            >
              <label for="password_confirmation">Confirm Password *</label>
              <input
                :type="show.confirm_password ? 'text' : 'password'"
                class="input"
                autocomplete="off"
                name="password_confirmation"
                v-model="form_data.password_confirmation"
                placeholder="Enter password"
              />
              <div
                :class="['icon pointer', show.confirm_password ? 'active' : '']"
                @click="toggleAction('confirm_password')"
              >
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  width="25"
                  height="16.667"
                  viewBox="0 0 25 16.667"
                >
                  <path
                    class="icon_a"
                    d="M24.849,12.2A13.921,13.921,0,0,0,12.5,4.5,13.923,13.923,0,0,0,.151,12.2a1.4,1.4,0,0,0,0,1.267,13.921,13.921,0,0,0,12.349,7.7,13.923,13.923,0,0,0,12.349-7.7A1.4,1.4,0,0,0,24.849,12.2ZM12.5,19.083a6.25,6.25,0,1,1,6.25-6.25A6.25,6.25,0,0,1,12.5,19.083Zm0-10.417a4.137,4.137,0,0,0-1.1.164,2.077,2.077,0,0,1-2.9,2.9,4.157,4.157,0,1,0,4-3.068Z"
                    transform="translate(0 -4.5)"
                  />
                </svg>
              </div>
              <transition name="slide"
                ><span class="validate" v-if="errors.length > 0">{{
                  errors[0]
                }}</span></transition
              >
            </validation-provider>
          </div>
        </div>
      </div>
      <div class="buttons fixed">
        <nuxt-link to="/users" class="cancel button half_width btn lg"
          >Cancel</nuxt-link
        >
        <button type="submit" class="success button half_width btn lg pointer">
          Submit
        </button>
      </div>
    </validation-observer>
  </div>
</template>

<script>
export default {
  data: () => ({
    loaded: false,
    roles: [],
    form_data: {
      first_name: "",
      last_name: "",
      email: "",
      role_id: "",
      enabled: 1,
    },
    show: {
      password: false,
      confirm_password: false,
    },
  }),
  methods: {
    toggleAction(type) {
      switch (type) {
        case "password":
          this.show.password ^= true;
          break;
        case "confirm_password":
          this.show.confirm_password ^= true;
          break;
      }
    },
    submit() {
      this.$refs.form.validate().then((success) => {
        if (!success) {
          this.$scrollTo(".validate", {
            offset: -250,
          });
          return;
        } else {
          this.toggleModalStatus({ type: "loader", status: true });

          let form_data = new FormData(document.getElementById("form"));
          form_data.append("enabled", this.form_data.enabled);

          this.$axios
            .$post("cms/users", form_data)
            .then(({ record }) => {
              this.$store.dispatch("global/toast/addToast", {
                type: "success",
                message: "Item has been added!",
              });
              this.$router.push(`/users/${record.id}/update`);
            })
            .catch((err) => {
              this.toggleModalStatus({
                type: "catcher",
                status: true,
                item: { errors: err.response.data.errors },
              });
            })
            .then(() => {
              setTimeout(() => {
                this.toggleModalStatus({ type: "loader", status: false });
              }, 500);
            });
        }
        this.$nextTick(() => {
          this.$refs.form.reset();
        });
      });
    },
  },
  mounted() {
    this.pagePermission(this, "add-user", true);
  },
  asyncData({ $axios, store }) {
    store.commit("global/settings/populateTitle", { title: "Create User" });

    return $axios
      .$get("cms/roles?all=1")
      .then(({ records }) => {
        return {
          roles: records,
        };
      })
      .catch((err) => {
        store.commit("global/modal/toggleModalStatus", {
          type: "catcher",
          status: true,
          item: { errors: err.response.data.errors },
        });
      });
  },
};
</script>
