ActiveAdmin.register GameRoundDetail do

  menu label: 'Create Game Round Detail'

  permit_params :player1_id, :player2_id, :winner_id, :status, :game_id, score_card: []

  collection_action :get_users_list, method: :get do
    render json: { users_collection: User.all.where.not(id: params[user_id]).pluck(:name, :id), sucesses: true }
  end

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    # javascript_pack_tag 'users_list'
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :game_id, as: :select, collection: Game.pluck(:name, :id), input_html: {disabled: !f.object.new_record?}
      f.input :player1_id, as: :select, collection: User.pluck(:name, :id), input_html: {disabled: !f.object.new_record?}
      f.input :player2_id, as: :select, collection: User.pluck(:name, :id), input_html: {disabled: !f.object.new_record?}
      f.input :winner_id, as: :select, collection: f.object.winner_user_list unless f.object.new_record?
      # f.input :status, as: :select, collection: GameRoundDetail.statuses, select: f.object.status unless f.object.new_record?
      f.input :score_card, as: :number, label: 'Score for player 1 ', input_html: {min: 0, name: 'game_round_detail[score_card][]', value: f.object.score_card[0]} unless f.object.new_record?
      f.input :score_card, as: :number, label: 'Score for player 2 ', input_html: {min: 0, name: 'game_round_detail[score_card][]', value: f.object.score_card[1]} unless f.object.new_record?
    end
    f.actions
  end

end
