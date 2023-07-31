<template lang="html">
	<div id="alert" :class="type" v-if="!remove">
		<div class="wrapper">
			<p>{{ message }}</p>
		</div>
	</div>
</template>

<script>
	export default {
		props: {
			type: {
				type: String,
				default: 'primary'
			},
			message: {
				type: String,
				default: 'The quick brown fox jumps over the lazy dog.'
			},
			auto_dismiss: {
				type: Boolean,
				default: false
			},
			dismiss_time: {
				type: Number,
				default: 5000
			}
		},
		data: () => ({
			remove: false
		}),
		methods: {
			initializeDismissal () {
				setTimeout( () => {
					this.remove = true
				}, this.dismiss_time)
			}
		},
		mounted () {
			if (this.auto_dismiss) {
				this.initializeDismissal()
			}
		}
	}
</script>
