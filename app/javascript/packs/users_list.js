console.log(`i'm in users list`)

function updatePlayerList(){

  var player_1 = document.getElementById('game_round_detail_player1_id').value;

  if (player_1 === '' ){
    console.log('No value found for player_1')
    return 0;
  }
  debugger;

  $.ajax({
    url: `admin/game_round_detail/get_users_list?${player_1}`,
    type: 'GET',
    sucesses: function(response){
      if(response.sucesses){
        
      }
      else{
        console.log('Something get wrong try again');
      };
    }
  });

}