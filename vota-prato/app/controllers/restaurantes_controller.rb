class RestaurantesController < ApplicationController
	#before_filter :verifica_login, :only => [:create, :update]
	#after_filter
	around_filter :envolvendo_actions

	private
	def permit_parameters
		params.require(:restaurante).permit(:nome, :endereco, :especialidade, :foto)
	end

	def envolvendo_actions
		logger.info "Antes de #{params[:action]}: #{Time.now}"
		yield
		logger.info "Depois de #{params[:action]}: #{Time.now}"
	end

	public
	def index
		@restaurantes = Restaurante.order(:nome).page(params[:page]).per(3)
		respond_to do |format|
			format.html
			format.xml {render xml: @restaurantes}
			format.json {render json: @restaurantes}
		end
	end

	def show
		@restaurante = Restaurante.find(params[:id])
		respond_to do |format|
			format.html
			format.xml {render xml: @restaurante}
			format.json {render json: @restaurante}
		end
	end

	def new
		@restaurante = Restaurante.new
	end

	def create
		@restaurante = Restaurante.new(permit_parameters)
		if @restaurante.save
			redirect_to action: 'show', id: @restaurante
		else
			render action: 'new'
		end
	end

	def edit
		@restaurante = Restaurante.find(params[:id])
	end

	def update
		@restaurante = Restaurante.find(params[:id])
		if @restaurante.update_attributes(permit_parameters)
			redirect_to action: 'show', id: @restaurante
		else
			render action: 'edit'
		end
	end

	def destroy
		@restaurante = Restaurante.find(params[:id])
		@restaurante.destroy

		redirect_to(action: 'index')
	end

	def busca
		
	end

end
