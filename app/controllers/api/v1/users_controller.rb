module Api
    module V1
        class UsersController < ApplicationController
            def index
                users = User.order('created_at DESC')
                render json: {status: 'SUCCESS', message: 'Loaded Users', data: users}, status: :ok
            end

            def show
                user = User.exists?(params[:id])
                if user
                    user = User.find(params[:id])
                    render json: {status: 'SUCCESS', message: 'Loaded User', data: user}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'User not found', data: user}, status: :unprocessable_entity
                end
            end

            def create
                user = User.new(user_params)
                
                if user.save!
                    render json: {status: 'SUCCESS', message: 'Saved User', data: user}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'User not saved', data: user.errors}, status: :unprocessable_entity
                end
            end

            def destroy
                user = User.exists?(params[:id])
                if user
                    user = User.find(params[:id])
                    user.destroy
                    render json: {status: 'SUCCESS', message: 'Deleted User', data: user}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'User not found', data: user}, status: :unprocessable_entity
                end
            end

            def update
                user = User.find(params[:id])

                if user.update_attributes(user_params)
                    render json: {status: 'SUCCESS', message: 'Updated User', data: user}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'User not updated', data: user.errors}, status: :unprocessable_entity
                end
            end

            def generate_raffle_ticket
                user = User.find(params[:id])
                ticket = Ticket.find_by_used('NO')

                if user.update_attributes(ticket_id: ticket.id)
                    render json: {status: 'SUCCESS', message: 'Tiket generated successfully', data: user}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Ticket not available', data: ticket.errors}, status: :unprocessable_entity
                end
            end

            private

            def user_params
                params.permit(:email, :name, :phone, :ticket_id)
            end
        end
    end
end