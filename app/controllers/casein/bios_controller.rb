# Scaffolding generated by Casein v5.0.0.0

module Casein
  class BiosController < Casein::CaseinController
  
    ## optional filters for defining usage according to Casein::AdminUser access_levels
    # before_filter :needs_admin, :except => [:action1, :action2]
    # before_filter :needs_admin_or_current_user, :only => [:action1, :action2]
  
    def index
      @casein_page_title = 'Bios'
  		@bios = Bio.paginate :page => params[:page]
    end
  
    def show
      @casein_page_title = 'View bio'
      @bio = Bio.find params[:id]
    end
  
    def new
      @casein_page_title = 'Add a new bio'
    	@bio = Bio.new
    end

    def create
      @bio = Bio.new bio_params
    
      if @bio.save
        flash[:notice] = 'Bio created'
        redirect_to casein_bios_path
      else
        flash.now[:warning] = 'There were problems when trying to create a new bio'
        render :action => :new
      end
    end
  
    def update
      @casein_page_title = 'Update bio'
      
      @bio = Bio.find params[:id]
    
      if @bio.update_attributes bio_params
        flash[:notice] = 'Bio has been updated'
        redirect_to casein_bios_path
      else
        flash.now[:warning] = 'There were problems when trying to update this bio'
        render :action => :show
      end
    end
 
    def destroy
      @bio = Bio.find params[:id]

      @bio.destroy
      flash[:notice] = 'Bio has been deleted'
      redirect_to casein_bios_path
    end
  
    private
      
      def bio_params
        params.require(:bio).permit(:content, :position)
      end

  end
end