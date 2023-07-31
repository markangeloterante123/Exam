<template lang="html">
  <div id="dashboard" v-if="loaded">

    <div class="actions">
      <nuxt-link to="/roles" class="cancel button pointer">
        <svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" viewBox="0 0 24 24" fill="none" stroke="#fff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>
        <span>Back</span>
      </nuxt-link>
    </div>

    <validation-observer tag="form" ref="form" id="form" class="form mb seventy" @submit.prevent="submit()">
      <div class="box mb">
        <div class="top_box">
          <h2>Information</h2>
        </div>
        <div class="bottom_box">
          <div class="group_inline two nmb">
            <validation-provider tag="div" class="group bordered" name="name" :rules="{ required: true }" v-slot="{ errors }">
              <label for="name">Name *</label>
              <input type="text" class="input" name="name" autocomplete="off" placeholder="Enter name" v-model="form_data.name">
              <transition name="slide"><span class="validate" v-if="errors.length > 0">{{ errors[0] }}</span></transition>
            </validation-provider>
            <validation-provider tag="div" class="group select bordered nmb" name="type" :rules="{ required: true }" v-slot="{ errors }">
              <label for="type">Type *</label>
              <select class="input" name="type" autocomplete="off" v-model="form_data.type">
                <option value="" disabled selected>Select type</option>
                <option :value="type.value" v-for="(type, key) in types" :key="key">{{ type.name }}</option>
              </select>
              <div class="dd"></div>
              <transition name="slide"><span class="validate" v-if="errors.length > 0">{{ errors[0] }}</span></transition>
            </validation-provider>
          </div>
        </div>
      </div>
      <div class="box">
        <div class="top_box">
          <h2>Permission</h2>
        </div>
        <div class="bottom_box">
          <div class="group_inline three nmb">
            <div class="group mb" v-for="(permission, p_key) in permissions" :key="p_key">
              <div :class="[ 'checkbox', (permission.checked && permission.actions && permission.actions.length > 0) ? 'mb ten' : '' ]">
                <input type="checkbox" class="check" name="role_permissions[]" :id="`permission_${p_key}`" v-model="permission.checked" @change="toggleStatus(permission)">
                <label :for="`permission_${p_key}`" class="pointer">{{ permission.name }}</label>
              </div>
              <template v-if="permission.actions && permission.actions.length > 0 && permission.checked">
                <div :class="[ 'group ml', (key + 1 == permission.actions.length) ? '' : 'mb' ]" v-for="(child, key) in permission.actions" :key="key">
                  <div :class="[ 'checkbox', (permission.checked) ? '' : 'disabled' ]">
                    <input type="checkbox" class="check" name="role_permissions[]" :id="`permission_${key}${p_key}`" v-model="child.checked">
                    <label :for="`permission_${key}${p_key}`" class="pointer">{{ child.name }}</label>
                  </div>
                </div>
              </template>
            </div>
          </div>
        </div>
      </div>
      <div class="buttons fixed">
        <nuxt-link to="/roles" class="cancel button half_width btn lg">Cancel</nuxt-link>
        <button type="submit" class="success button half_width btn lg pointer">Submit</button>
      </div>
    </validation-observer>
  </div>
</template>

<script>
  import rolePemissions from '~/plugins/role-pemissions.js'

  export default {
    mixins: [rolePemissions],
    data: () => ({
      loaded: false,
      form_data: {
        name: '',
        type: ''
      },
      types: [
        {
          name: 'Admin',
          value: 'admin'
        },
        {
          name: 'Editor',
          value: 'editor'
        },
        {
          name: 'Customer',
          value: 'customer'
        }
      ]
    }),
    methods: {
      submit () {
        this.$refs.form.validate().then(success => {
          if (!success) {
            this.$scrollTo('.validate', {
              offset: -250
            })
            return
          } else {
            this.toggleModalStatus({ type: 'loader', status: true })

            let form_data = new FormData(document.getElementById('form'))
            form_data.append('permissions', JSON.stringify(this.permissions))

            this.$axios.$post('cms/roles', form_data).then(({ record }) => {
              this.$store.dispatch('global/toast/addToast', { type: 'success', message: 'Item has been added!' })
              this.$router.push(`/roles/${record.id}/update`)
            }).catch(err => {
              this.toggleModalStatus({ type: 'catcher', status: true, item: { errors: err.response.data.errors } })
            }).then(() => {
              setTimeout( () => {
                this.toggleModalStatus({ type: 'loader', status: false })
              }, 500)
            })
          }
          this.$nextTick(() => {
            this.$refs.form.reset()
          })
        })
      }
    },
    mounted () {
      this.pagePermission(this, 'add-role', true)
    },
    asyncData ({ store }) {
      store.commit('global/settings/populateTitle', { title: 'Create Role' })
    }
  }
</script>
