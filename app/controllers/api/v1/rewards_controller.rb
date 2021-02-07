module Api
    module V1
        class RewardsController < ApplicationController
            def index
                rewards = Reward.order('created_at DESC')
                render json: {status: 'SUCCESS', message: 'Loaded Rewards', data: rewards}, status: :ok
            end

            def show
                reward = Reward.find(params[:id])
                render json: {status: 'SUCCESS', message: 'Loaded Reward', data: reward}, status: :ok
            end

            def create
                reward = Reward.new(reward_params)
                
                if reward.save!
                    render json: {status: 'SUCCESS', message: 'Saved Reward', data: reward}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Reward not saved', data: reward.errors}, status: :unprocessable_entity
                end
            end

            def destroy
                reward = Reward.find(params[:id])
                reward.destroy
                render json: {status: 'SUCCESS', message: 'Deleted Reward', data: reward}, status: :ok
            end

            def update
                reward = Reward.find(params[:id])

                if reward.update_attributes(reward_params)
                    render json: {status: 'SUCCESS', message: 'Updated Reward', data: reward}, status: :ok

                else
                    render json: {status: 'ERROR', message: 'Reward not updated', data: reward.errors}, status: :unprocessable_entity
                end
            end

            private

            def reward_params
                params.permit(:title, :ticket_id, :used)
            end
        end
    end
end