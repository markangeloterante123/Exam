export default {
  // Global page headers (https://go.nuxtjs.dev/config-head)
  head: {
    title: 'admin-template',
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { hid: 'description', name: 'description', content: '' }
    ],
    link: [
      { rel: 'icon', type: 'image/png', href: '/favicon.png' }
    ]
  },

  /*
  ** Customize the progress-bar color*/
  loading: {
    color: '#F2A02A',
    throttle: 0,
    height: '4px'
  },

  // Global CSS (https://go.nuxtjs.dev/config-css)
  css: [
    '~/assets/stylus/app.styl'
  ],

  // Plugins to run before rendering page (https://go.nuxtjs.dev/config-plugins)
  plugins: [
    { src: '~/plugins/vue-scrollto', ssr: false },
    { src: '~/plugins/vue-multiselect', ssr: false },
    { src: '~/plugins/vue-ctk-date-time-picker', ssr: false },
    { src: '~/plugins/vue-line-clamp', ssr: false },
    { src: '~/plugins/vue-json-csv', ssr: false },
    { src: '~/plugins/vee-validate' },
    { src: '~/plugins/vue-moment' },
    // { src: '~/plugins/tiny-mce' },
    { src: '~/plugins/vue-click-outside', ssr: false },
    { src: '~/plugins/vue-quill-editor', ssr: false },
    { src: '~/plugins/mixins' }
  ],

  // Auto import components (https://go.nuxtjs.dev/config-components)
  components: [
    '~/components/global',
    '~/components/file',
    '~/components/global/modal'
  ],

  // Modules for dev and build (recommended) (https://go.nuxtjs.dev/config-modules)
  buildModules: [
    '@nuxtjs/dotenv',
    '@nuxtjs/auth-next'
  ],
  auth: {
    strategies: {
      local: {
        token: {
          property: 'token',
          maxAge: 604800,
          prefix: 'admin_template.'
        },
        user: {
          property: 'user'
        },
        endpoints: {
          login: { url: `${process.env.API_URL}global/user/login`, method: 'post' },
          logout: { url: `${process.env.API_URL}global/user/logout`, method: 'post' },
          user: { url: `${process.env.API_URL}global/user/check-token`, method: 'get' }
        }
      }
    }
  },

  // Modules (https://go.nuxtjs.dev/config-modules)
  modules: [
    // https://go.nuxtjs.dev/axios
    '@nuxtjs/axios'
  ],
  router: {
    middleware: ['authenticator']
  },
  // Axios module configuration (https://go.nuxtjs.dev/config-axios)
  axios: {
    // See https://github.com/nuxt-community/axios-module#options
    baseURL: process.env.API_URL,
    credentials: false
  },
  env: {
    baseUrl: process.env.BASE_URL
  },
  // Build Configuration (https://go.nuxtjs.dev/config-build)
  build: {
    transpile: ["vee-validate/dist/rules"]
  },
  serverMiddleware: [
    (req, res, next) => {
      if (/\/{2,}/.test(req.url)) {
        const url = req.url.replace(/\/{2,}/g, '/')
        res.writeHead(301, { 'Location': url })
        return res.end()
      }
      next()
    }
  ],
  server: {
    port: process.env.PORT
  }
}
