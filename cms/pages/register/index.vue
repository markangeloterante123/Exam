<template>
  <div id="login">
    <div class="wrapper">
      <div class="left">
        <img src="/company-banner.jpg" />
      </div>
      <div class="right">
        <div class="overlay">
          <h2>Register</h2>
          <ValidationObserver tag="div" ref="form">
            <form
              tag="form"
              ref="form"
              id="form"
              class="form"
              @submit.prevent="submit()"
            >
              <validation-provider
                tag="div"
                class="group floating"
                name="first_name"
                :rules="{ required: true }"
                v-slot="{ errors }"
              >
                <label for="first_name">First Name *</label>
                <input
                  type="text"
                  class="input"
                  name="first_name"
                  autofocus
                  autocomplete="off"
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
                class="group floating"
                name="last_name"
                :rules="{ required: true }"
                v-slot="{ errors }"
              >
                <label for="last_name">Last Name *</label>
                <input
                  type="text"
                  class="input"
                  name="last_name"
                  autofocus
                  autocomplete="off"
                  v-model="form_data.last_name"
                />
                <transition name="slide"
                  ><span class="validate" v-if="errors.length > 0">{{
                    errors[0]
                  }}</span></transition
                >
              </validation-provider>

              <ValidationProvider
                tag="div"
                class="group floating"
                name="email"
                :rules="{ required: true, email: true }"
                v-slot="{ errors }"
              >
                <input
                  type="text"
                  :class="['input', form_data.email.length > 0 ? 'filled' : '']"
                  name="email"
                  autofocus
                  autocomplete="off"
                  v-model="form_data.email"
                />
                <label for="email">Email Address</label>
                <transition name="slide"
                  ><span class="validate" v-if="errors.length > 0">{{
                    errors[0]
                  }}</span></transition
                >
              </ValidationProvider>
              <validation-provider
                tag="div"
                class="group floating"
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
                class="group floating"
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
                />
                <div
                  :class="[
                    'icon pointer',
                    show.confirm_password ? 'active' : '',
                  ]"
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
              <div class="buttons">
                <a href="/" class="cancel button outline pointer"
                  >Back To Home</a
                >
                <button type="submit" class="primary button pointer">
                  Register
                </button>
              </div>
            </form>
          </ValidationObserver>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data: () => ({
    loaded: false,
    form_data: {
      first_name: "",
      last_name: "",
      email: "",
      role_id: "0dc1ab31-2cd2-4096-84f2-a334a8e1cb43",
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
          form_data.append("role_id", this.form_data.role_id);

          this.$axios
            .$post("users", form_data)
            .then(({ record }) => {
              this.$router.push(`/login`);
            })
            .catch((err) => {
              this.$router.push(`/login`);
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
    this.loaded = true;
    // this.pagePermission(this, "add-user", true);
  },
  asyncData({ $axios, store }) {
    // store.commit("global/settings/populateTitle", { title: "Create User" });
    // return $axios
    //   .$get("cms/roles?all=1")
    //   .then(({ records }) => {
    //     return {
    //       roles: records,
    //     };
    //   })
    //   .catch((err) => {
    //     store.commit("global/modal/toggleModalStatus", {
    //       type: "catcher",
    //       status: true,
    //       item: { errors: err.response.data.errors },
    //     });
    //   });
  },
};
</script>
