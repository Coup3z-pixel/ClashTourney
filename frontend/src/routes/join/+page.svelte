<script lang="ts">
    import { goto } from '$app/navigation';
	import { Crown, ArrowLeft, Users, Hash } from '@lucide/svelte';

  let joinCode = '';
  let playerName = '';
  let error = '';
  let loading = false;

	function getTournament(joinCode: string) {
		  
	}
	function joinTournament(tournament_id: string, playerName: string) {
	} 

  async function handleSubmit(event) {
    event.preventDefault();
    error = '';
    loading = true;

    const tournament = getTournament(joinCode.toUpperCase());

    if (!tournament) {
      error = 'Tournament not found. Please check your join code.';
      loading = false;
      return;
    }

    if (tournament.players.length >= tournament.playerLimit) {
      error = 'Tournament is full. Cannot join.';
      loading = false;
      return;
    }

    if (tournament.players.some(p => p.name.toLowerCase() === playerName.toLowerCase())) {
      error = 'A player with this name has already joined.';
      loading = false;
      return;
    }

    const success = joinTournament(tournament.id, playerName);

    if (success) {
      goto(`/tournament/${tournament.id}`);
    } else {
      error = 'Failed to join tournament. Please try again.';
    }

    loading = false;
  }
</script>

<div class="min-h-screen">
      <!-- Header -->
      <header class="bg-black/20 backdrop-blur-sm border-b border-white/10">
        <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 py-4">
          <div class="flex items-center justify-between">
            <div class="flex items-center space-x-3">
              <Crown class="w-8 h-8 text-yellow-400" />
              <h1 class="text-2xl font-bold text-white">Clash Tourney</h1>
            </div>
            <a href="/" class="flex items-center space-x-2 text-white hover:text-yellow-400 transition-colors">
              <ArrowLeft class="w-5 h-5" />
              <span>Back</span>
            </a>
          </div>
        </div>
      </header>

      <div class="max-w-2xl mx-auto px-4 sm:px-6 lg:px-8 pt-12">
        <div class="text-center mb-8">
          <h2 class="text-4xl font-bold text-white mb-4">Join Tournament</h2>
          <p class="text-blue-200 text-lg">Enter your tournament code and player name to join the battle</p>
        </div>

        <form onSubmit={handleSubmit} class="bg-white/10 backdrop-blur-sm border border-white/20 rounded-2xl p-8">
          {#if error}
            <div class="bg-red-500/20 border border-red-400 rounded-xl p-4 mb-6">
              <p class="text-red-300 text-center">{error}</p>
            </div>
          {/if}

          <div class="space-y-6">
            <div>
              <label class="flex items-center space-x-2 text-white font-medium mb-2">
                <Hash class="w-5 h-5" />
                <span>Tournament Code</span>
              </label>
              <input
                type="text"
                required
                value={joinCode}
                onChange={(e) => setJoinCode(e.target.value.toUpperCase())}
                class="w-full bg-black/20 border border-white/20 rounded-xl px-4 py-3 text-white placeholder-gray-400 focus:border-blue-400 focus:outline-none transition-colors text-center text-2xl font-mono font-bold tracking-wider"
                placeholder="Enter tournament code"
                maxLength={8}
              />
              <p class="text-blue-300 text-sm mt-2">Enter the 8-character code shared by the tournament host</p>
            </div>

            <div>
              <label class="flex items-center space-x-2 text-white font-medium mb-2">
                <Users class="w-5 h-5" />
                <span>Your Player Name</span>
              </label>
              <input
                type="text"
                required
                value={playerName}
                onChange={(e) => setPlayerName(e.target.value)}
                class="w-full bg-black/20 border border-white/20 rounded-xl px-4 py-3 text-white placeholder-gray-400 focus:border-blue-400 focus:outline-none transition-colors"
                placeholder="Enter your player name"
                maxLength={20}
              />
              <p class="text-blue-300 text-sm mt-2">This name will be shown in the tournament bracket</p>
            </div>
          </div>

          <button
            type="submit"
            disabled={loading}
            class="w-full mt-8 bg-gradient-to-r from-blue-500 to-blue-600 hover:from-blue-600 hover:to-blue-700 disabled:opacity-50 disabled:cursor-not-allowed text-white py-4 rounded-xl font-bold text-lg transition-all duration-300 transform hover:scale-105 hover:shadow-2xl"
          >
            {loading ? 'Joining...' : 'Join Tournament'}
          </button>

          <div class="mt-6 p-4 bg-black/20 rounded-xl">
            <h3 class="text-white font-bold mb-2">Need Help?</h3>
            <p class="text-blue-200 text-sm">
              Ask your tournament host for the join code, or check if you have a shareable link 
              that you can click directly to join.
            </p>
          </div>
        </form>
      </div>
    </div>
