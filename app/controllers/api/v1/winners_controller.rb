module Api
    module V1
        class WinnersController < ApplicationController
            def index
                winners = Winner.last(5)
                render json: {status: 'SUCCESS', message: 'Loaded Winners', data: winners}, status: :ok
            end

            def show
                winner = Winner.last
                render json: {status: 'SUCCESS', message: 'Loaded Winner', data: winner}, status: :ok
            end

            def create
                winner = Winner.new(winner_params)
                if winner.save!
                    render json: {status: 'SUCCESS', message: 'Saved Winner', data: winner}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Winner not saved', data: winner.errors}, status: :unprocessable_entity
                end
            end

            def destroy
                winner = Winner.find(params[:id])
                winner.destroy
                render json: {status: 'SUCCESS', message: 'Deleted Winner', data: winner}, status: :ok
            end

            def update
                winner = Winner.find(params[:id])
                if winner.update_attributes(winner_params)
                    render json: {status: 'SUCCESS', message: 'Updated Winner', data: winner}, status: :ok

                else
                    render json: {status: 'ERROR', message: 'Winner not updated', data: winner.errors}, status: :unprocessable_entity
                end
            end

            def search_last_week_winners
                last_week_winners = []
                winners = Winner.where('created_at between date_sub(now(), INTERVAL 1 WEEK) and now()')
                winners.each do |w|
                    user = User.find(w.user_id)
                    reward = Reward.find(w.reward_id)
                    last_week_winners << [user.name, user.email, user.phone, reward.title]
                end
                render json: {status: 'SUCCESS', message: 'Last Week Winners', data: last_week_winners}, status: :ok
            end

            def find_winner
                reward = Reward.find_by_used('NO')
                user = User.find_by_ticket_id(reward.ticket_id)
                winner = Winner.new(user_id: user.id, reward_id: reward.id)
                if winner.save
                    render json: {status: 'SUCCESS', message: 'New winner updated', data: winner}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Winner not found', data: winner.errors}, status: :unprocessable_entity
                end
            end


            private

            def winner_params
                params.permit(:user_id, :ticket_id)
            end
        end
    end
end