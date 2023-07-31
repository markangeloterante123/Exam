import Vue from 'vue'
import { mapMutations } from 'vuex'

Vue.mixin({
  methods: {
    ...mapMutations({
      toggleModalStatus: 'global/modal/toggleModalStatus'
    }),
    async refetchUser () {
      await this.$auth.fetchUser().then(res => {
        this.$nuxt.$emit('reinitialized-sidebar-component')
      })
    },
    pagePermission (parent, page, check_child = false) {
      this.toggleModalStatus({ type: 'loader', status: true })
      if (this.checkPermission(page, check_child)) {
        setTimeout( () => {
          parent.loaded = true
        }, 500)
      } else {
        this.$nuxt.error({ statusCode: 403 })
      }
      setTimeout(() => {
        this.toggleModalStatus({ type: 'loader', status: false })
      }, 500)
    },
    checkPermission (data, check_child = false) {
      if (this.$auth.user) {
        let result = false
        if (this.$auth.user.role.permissions) {
          let user_permissions = JSON.parse(this.$auth.user.role.permissions)
          
          user_permissions.forEach((permission, key) => {
            if (!check_child) {
              if (typeof (data) === 'string') {
                if (permission.unique == data) {
                  if (permission.checked) {
                    result = true
                  }
                }
              } else {
                if (data.indexOf(permission.unique) > -1) {
                  if (permission.checked) {
                    result = true
                  }
                }
              }
            } else {
              if (permission.actions) {
                permission.actions.forEach((action, key) => {
                  if (action.unique == data) {
                    if (action.checked ) {
                      result = true
                    }
                  }
                })
              }
            }
          })
        } else {
          result = true
        }
        
        return result
      }
    },
    async validateToken (...routes) {
      let authenticated = await (this.$auth.user) ? true : false

      if (!routes.includes(this.$route.path)) {
        if (authenticated) {
          this.$store.commit('global/settings/userAuthentication', { status: true })
        }
      } else {
        if (authenticated) {

          // this.$router.push('/dashboard')
          this.$router.push("/users");
        }
      }

      if (!authenticated) {
        if (this.$route.fullPath != routes[0]) {
          await this.$auth.logout().then(res => {
            if (this.$route.fullPath != routes[0]) {
              this.$router.push(routes[0])
            }
          })
        }
      }
    },
    updateWysiwyg (editor, type, update = false) {
      if (update) {
        this.form_data[type] = document.querySelector(`.editor.${type} .ql-editor`).innerHTML
      } else {
        this.form_data[type] = editor.html
      }
      this.wysiwygErrorBag(this, type)
    },
    validateWysiwyg (page, wysiwygs) {
      wysiwygs.forEach((wysiwyg, key) => {
        this.wysiwygErrorBag(page, wysiwyg)
      })
    },
    wysiwygErrorBag (page, type) {
      let text = document.querySelector(`.editor.${type} .ql-editor`).textContent

      if (page.validation) page.validation[type] = (page.form_data[type].length <= 0) ? `The ${type} field is required` : null
      
      if (page.char_limit) {
        if (page.char_limit[type]) {
          page.char_limit[type].value = page.char_limit[type].total
        }
      }
      if (!page.validation) {
        if (page.char_limit) {
          if (page.char_limit[type]) {
            page.char_limit[type].value = (page.char_limit[type].total - text.length <= 0) ? 0 : page.char_limit[type].total - text.length
            page.validation[type] = (page.form_data[type].length < page.char_limit[type].total) ? null : `Max ${page.char_limit[type].total} characters limit only`
          }
        }
      }
    },
    wysiwygPopulateCharLimit (page, wysiwygs) {
      wysiwygs.forEach((wysiwyg, key) => {
        let text = document.querySelector(`.editor.${wysiwyg} .ql-editor`).textContent
        if (page.char_limit[type]) {
          page.char_limit[wysiwyg].value = (page.char_limit[wysiwyg].total - text.length <= 0) ? 0 : page.char_limit[wysiwyg].total - text.length
        }
      })
    },
    checkValue (event) {
      let target = event.target
      if (target.value.length > 0) {
        target.classList.add('filled')
      } else {
        target.classList.remove('filled')
      }
    },
    validateDate (type, event) {
      let date_format = /([12]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01]))/g,
        value = event.target.value,
        valid = date_format.test(value)

      this.validate[type].format = valid
      this.form_data[type] = this.parseInputToDate(value)
    },
    parseInputToDate (target) {
      let lastValue = ''
      let value = target.split('-').join('')
      if (value.length > 0) {
        value = value.match(new RegExp('.{1,4}', 'g')).join('-')
        let valueArrayChecker = value.split('-')
        if (valueArrayChecker[1]) {
          if (valueArrayChecker[1].length > 0) {
            value = value.split('-')
            lastValue = `${value[0]}-`
            lastValue += value[1].match(new RegExp('.{1,2}', 'g')).join('-')
          }
        } else {
          lastValue = value
        }
      }
      return lastValue
    },
    randomCode () {
      return Math.random().toString(36).substring(5).toUpperCase()
    },
    randomString () {
      return Math.random().toString(36).substring(2)
    },
    totalCount (value, decimal = false) {
      let count = 0
      if (value) {
        count = (decimal) ? parseFloat(value).toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") : parseFloat(value).toFixed().toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
      }
      return count
    },
    toJSON (data) {
      if (data) {
        return JSON.parse(JSON.stringify(Object.fromEntries(data)))
      }
    },
    parser (data) {
      if (data) {
        return JSON.parse(data)
      }
    },
    replacer (data) {
      if (data) {
        return data.replace(/\-/g, ' ')
      }
    },
    convertToSlug (data) {
      let slug = ''
      if (data.match(/[!@#$%^&*(){}:;"’'<>?,./|“”]|\`|\~|\=|\-|\+|\_|\[|\]|\\/g)) {
        slug = data.toLowerCase().replace(/[!@#$%^&*(){}:;"'’<>?,./|“”]|\`|\~|\=|\-|\+|\_|\[|\]|\\/g, '').replace(/\s/g, '-')
      } else {
        slug = data.toLowerCase().replace(/\s/g, '-')
      }
      return slug
    }
  }
})
