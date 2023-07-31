<template lang="html">
	<section id="breadcrumb" :class="alignment">
		<ul class="list" itemtype="http://schema.org/BreadcrumbList">
			<li class="item" v-for="(data, key) in populateCrumbs" :key="key" itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
				<nuxt-link :to="data.link" custom v-slot="{ isActive, isExactActive }">
					<a
						:class="[ 'link', { 'active' : isActive }, { 'exact' : isExactActive } ]"
						 itemprop="item"
					>
						<span itemprop="name" v-if="key == 0">
							<svg xmlns="http://www.w3.org/2000/svg" width="16px" height="16px" viewBox="0 0 24 24" fill="none" stroke="#FF9000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path><polyline points="9 22 9 12 15 12 15 22"></polyline></svg>
						</span>
						<span itemprop="name" v-else>{{ data.name }}</span>
						<meta itemprop="position" :content="key + 1" />
					</a>
				</nuxt-link>
				<span class="separator">
					{{ (populateCrumbs.length == key + 1) ? '' : separator }}
				</span>
			</li>
		</ul>
	</section>
</template>

<script>
	export default {
		props: {
			separator: {
				type: String,
				default: '/'
			},
			alignment: {
				type: String,
				default: 'left'
			}
		},
		computed: {
			populateCrumbs () {
				let result = [],
					crumbs = this.$route.path.split('/'),
					path = ''

				for (let i = 0, len = crumbs; i < len.length; i++) {
					path += crumbs[i]
					path += '/'
					result.push(
						{
							name: this.replacer(crumbs[i]),
							link: path
						}
					)
				}

				return result
			}
		}
	}
</script>
