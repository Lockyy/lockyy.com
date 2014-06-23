# Scaffolding generated by Casein v5.0.0.0

module Casein
  class ItemsController < Casein::CaseinController
  
    ## optional filters for defining usage according to Casein::AdminUser access_levels
    # before_filter :needs_admin, :except => [:action1, :action2]
    # before_filter :needs_admin_or_current_user, :only => [:action1, :action2]
  
    def index
      @casein_page_title = 'Items'
  		@items = Item.paginate :page => params[:page]
    end
  
    def show
      @casein_page_title = 'View item'
      @item = Item.find params[:id]
    end
  
    def new
      @casein_page_title = 'Add a new item'
    	@item = Item.new
    end

    def create
      @item = Item.new item_params
    
      if @item.save
        flash[:notice] = 'Item created'
        redirect_to casein_items_path
      else
        flash.now[:warning] = 'There were problems when trying to create a new item'
        render :action => :new
      end
    end
  
    def update
      @casein_page_title = 'Update item'
      
      @item = Item.find params[:id]
    
      if @item.update_attributes item_params
        flash[:notice] = 'Item has been updated'
        redirect_to casein_items_path
      else
        flash.now[:warning] = 'There were problems when trying to update this item'
        render :action => :show
      end
    end
 
    def destroy
      @item = Item.find params[:id]

      @item.destroy
      flash[:notice] = 'Item has been deleted'
      redirect_to casein_items_path
    end
  
    private
      
      def item_params
        params.require(:item).permit(:section_id, :name, :content, :link, :position)
      end

  end
end