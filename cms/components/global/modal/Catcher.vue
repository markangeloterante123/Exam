<template lang="html">
	<transition name="fade">
		<div id="dialog" class="basic centered">
			<div class="wrapper">
				<div class="content cancel">
					<div class="close pointer" @click="toggleModalStatus({ type: 'catcher', status: false })">×</div>
					<div class="content_top">
						Error
					</div>
					<div class="content_middle">
						<ul>
							<li v-for="(data, key) in getItem.errors">{{ data }}</li>
						</ul>
					</div>
					<div class="content_bottom">
						<div class="cancel button pointer" @click="toggleModalStatus({ type: 'catcher', status: false })">Close</div>
					</div>
				</div>
				<div class="backdrop" @click="toggleModalStatus({ type: 'catcher', status: false })"></div>
			</div>
		</div>
	</transition>
</template>

<script>
	import { mapGetters } from 'vuex'

	export default {
		computed: {
			...mapGetters({
				getItem: 'global/modal/getItem'
			})
		},
		mounted () {
			document.body.classList.add('no_scroll')
		}
	}
</script>
