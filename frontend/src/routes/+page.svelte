<script lang="ts">
	import { Crown, Swords, Users, Trophy } from '@lucide/svelte';
</script>


<div class="min-h-screen">
      <!-- Header -->
      <header class="bg-black/20 backdrop-blur-sm border-b border-white/10">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-4">
          <div class="flex items-center justify-between">
            <div class="flex items-center space-x-3">
              <Crown class="w-8 h-8 text-yellow-400" />
              <h1 class="text-2xl font-bold text-white">Clash Tourney</h1>
            </div>
            <a 
              href="/dashboard" 
              class="text-white hover:text-yellow-400 transition-colors font-medium"
            >
              Dashboard
            </a>
          </div>
        </div>
      </header>

      <!-- Hero Section -->
      <div class="relative overflow-hidden">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 pt-20 pb-16">
          <div class="text-center">
            <h1 class="text-5xl md:text-7xl font-bold text-white mb-6 leading-tight">
              Host and Join<br />
              <span class="bg-gradient-to-r from-red-400 to-yellow-400 bg-clip-text text-transparent">
                Clash Royale
              </span><br />
              Tournaments Easily
            </h1>
            <p class="text-xl md:text-2xl text-blue-200 mb-12 max-w-3xl mx-auto leading-relaxed">
              Create competitive tournaments, invite players, and track matches with our 
              easy-to-use tournament platform designed for the Clash community.
            </p>

            <!-- CTA Buttons -->
            <div class="flex flex-col sm:flex-row gap-6 justify-center items-center">
              <a 
                href="/create"
                class="group bg-gradient-to-r from-red-500 to-red-600 hover:from-red-600 hover:to-red-700 text-white px-8 py-4 rounded-xl font-bold text-lg transition-all duration-300 transform hover:scale-105 hover:shadow-2xl shadow-red-500/25 flex items-center space-x-3 min-w-[200px] justify-center"
              >
                <Crown class="w-6 h-6" />
                <span>Create Tournament</span>
              </a>
              <a
                href="/join"
                class="group bg-gradient-to-r from-blue-500 to-blue-600 hover:from-blue-600 hover:to-blue-700 text-white px-8 py-4 rounded-xl font-bold text-lg transition-all duration-300 transform hover:scale-105 hover:shadow-2xl shadow-blue-500/25 flex items-center space-x-3 min-w-[200px] justify-center"
              >
                <Swords class="w-6 h-6" />
                <span>Join Tournament</span>
              </a>
            </div>
          </div>
        </div>

        <!-- Feature Cards -->
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 pb-20">
          <div class="grid md:grid-cols-3 gap-8 mt-20">
            <div class="bg-white/10 backdrop-blur-sm border border-white/20 rounded-2xl p-8 text-center hover:bg-white/15 transition-all duration-300">
              <div class="bg-gradient-to-r from-yellow-400 to-orange-500 w-16 h-16 rounded-full flex items-center justify-center mx-auto mb-6">
                <Crown class="w-8 h-8 text-white" />
              </div>
              <h3 class="text-2xl font-bold text-white mb-4">Easy Setup</h3>
              <p class="text-blue-200 leading-relaxed">
                Create tournaments in seconds with our simple form. Set rules, player limits, and get a shareable join code instantly.
              </p>
            </div>

            <div class="bg-white/10 backdrop-blur-sm border border-white/20 rounded-2xl p-8 text-center hover:bg-white/15 transition-all duration-300">
              <div class="bg-gradient-to-r from-blue-400 to-purple-500 w-16 h-16 rounded-full flex items-center justify-center mx-auto mb-6">
                <Users class="w-8 h-8 text-white" />
              </div>
              <h3 class="text-2xl font-bold text-white mb-4">Quick Join</h3>
              <p class="text-blue-200 leading-relaxed">
                Players can join tournaments instantly using join codes or shareable links. No complex registration required.
              </p>
            </div>

            <div class="bg-white/10 backdrop-blur-sm border border-white/20 rounded-2xl p-8 text-center hover:bg-white/15 transition-all duration-300">
              <div class="bg-gradient-to-r from-red-400 to-pink-500 w-16 h-16 rounded-full flex items-center justify-center mx-auto mb-6">
                <Trophy class="w-8 h-8 text-white" />
              </div>
              <h3 class="text-2xl font-bold text-white mb-4">Live Brackets</h3>
              <p class="text-blue-200 leading-relaxed">
                Visual tournament brackets that update in real-time as matches progress. Crown the champion in style!
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
