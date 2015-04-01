class CodesController < ApplicationController


	def index
	  @products = Codes.order(:name)
	  respond_to do |format|
	    format.html
	    format.csv { send_data @products.to_csv }
	    # format.xls # { send_data @products.to_csv(col_sep: "\t") }
	  end
	end

	def import
	  Codes.import(params[:file])
	  redirect_to '/codes/index', notice: "codes imported."
	end

end