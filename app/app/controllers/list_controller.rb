class ListController < ApplicationController
    def index
        sort_option = params[:sort]
        @items = Item.new.select_items(sort_option)
    end
end
