<template>
  <div id="login">
    <div class="wrapper">
      <div class="left">
        <img src="/company-banner.jpg" />
      </div>
      <div class="right">
        <div class="overlay">
          <h2>Login</h2>
          <h3>Welcome back, Please login to continue</h3>
          <ValidationObserver tag="div" ref="form">
            <form class="form" @submit.prevent="submit()">
              <ValidationProvider
                tag="div"
                class="group floating"
                name="email"
                :rules="{ required: true, email: true }"
                v-slot="{ errors }"
              >
                <input
                  type="text"
                  :class="['input', form.email.length > 0 ? 'filled' : '']"
                  name="email"
                  autofocus
                  autocomplete="off"
                  v-model="form.email"
                />
                <label for="email">Email Address</label>
                <transition name="slide"
                  ><span class="validate" v-if="errors.length > 0">{{
                    errors[0]
                  }}</span></transition
                >
              </ValidationProvider>
              <ValidationProvider
                tag="div"
                class="group floating"
                name="password"
                :rules="{ required: true }"
                v-slot="{ errors }"
              >
                <input
                  type="password"
                  :class="['input', form.password.length > 0 ? 'filled' : '']"
                  name="password"
                  autocomplete="off"
                  v-model="form.password"
                />
                <label for="password">Password</label>
                <transition name="slide"
                  ><span class="validate" v-if="errors.length > 0">{{
                    errors[0]
                  }}</span></transition
                >
              </ValidationProvider>
              <div class="buttons">
                <a href="/" class="cancel button outline pointer"
                  >Back To Home</a
                >
                <button type="submit" class="primary button pointer">
                  Login
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
    form: {
      email: "",
      password: "",
    },
  }),
  methods: {
    submit() {
      this.$refs.form.validate().then((success) => {
        if (!success) {
          this.$scrollTo(".validate", {
            offset: -250,
          });
          return;
        } else {
          this.toggleModalStatus({ type: "loader", status: true });
          this.$auth
            .loginWith("local", { data: this.form })
            .then((res) => {
              if (res.data.user.role.type == "admin") {
                this.$router.push("/users");
              } else {
                this.$router.push("/welcome");
              }
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
          this.$refs.form.reset("/login");
        });
      });
    },
  },
};
</script>
