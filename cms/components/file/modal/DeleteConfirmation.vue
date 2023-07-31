<template lang="html">
	<transition name="fade">
		<div id="dialog" :class="[ 'basic', (centered) ? 'centered' : '' ]" v-if="opened">
			<div class="wrapper">
				<div class="content cancel">
					<div class="close pointer" @click="close()">×</div>
					<div class="content_top">
						Confirmation
					</div>
					<div class="content_middle">
						Are you sure you want to delete this {{ item }}? <br />
						This action cannot be undone.
					</div>
					<div class="content_bottom">
						<div class="inline">
							<div class="cancel button outline pointer ml ten" @click="close()">Cancel</div>
							<div class="success button pointer" @click="confirm()">Confirm</div>
						</div>
					</div>
				</div>
				<div class="backdrop" @click="close()"></div>
			</div>
		</div>
	</transition>
</template>

<script>
	export default {
		props: {
			item: {
				type: String,
				default: ''
			},
			centered: {
				type: Boolean,
				default: false
			},
			api: {
				type: String,
				default: ''
			}
		},
		data: () => ({
			opened: false
		}),
		methods: {
			close () {
				this.opened = false
			},
			confirm () {
				this.$store.commit('global/loader/checkLoader', { status: true })
				this.$axios.delete(this.api).then(res => {
					this.close()
					this.$store.dispatch('global/toast/addToast', { type: 'success', message: 'Item has been deleted!' })
					this.$parent.enabled = false
					this.$parent.$parent.determineIfShowCloser()
				}).catch(err => {
					console.log(err.data);
				}).then(() => {
					setTimeout( () => {
						this.$store.commit('global/loader/checkLoader', { status: false })
						this.loaded = true
						document.body.classList.remove('no_scroll', 'no_click')
					}, 500)
				})
			}
		}
	}
</script>
