module Api
    module V1
        class TicketsController < ApplicationController
            def index
                tickets = Ticket.order('created_at')
                render json: {status: 'SUCCESS', message: 'Loaded Tickets', data: tickets}, status: :ok
            end

            def show
                ticket = Ticket.find(params[:id])
                render json: {status: 'SUCCESS', message: 'Loaded Ticket', data: ticket}, status: :ok
            end

            def create
                ticket = Ticket.new(ticket_params)
                
                if ticket.save!
                    render json: {status: 'SUCCESS', message: 'Saved Ticket', data: ticket}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Ticket not saved', data: ticket.errors}, status: :unprocessable_entity
                end
            end

            def destroy
                ticket = Ticket.find(params[:id])
                ticket.destroy
                render json: {status: 'SUCCESS', message: 'Deleted Ticket', data: ticket}, status: :ok
            end

            def update
                ticket = Ticket.find(params[:id])

                if ticket.update_attributes(ticket_params)
                    render json: {status: 'SUCCESS', message: 'Updated Ticket', data: ticket}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Ticket not updated', data: ticket.errors}, status: :unprocessable_entity
                end
            end

            private

            def ticket_params
                params.permit(:ticket_number, :used)
            end
        end
    end
end