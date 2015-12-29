class RankingsController < ApplicationController
    before_action :logged_in_user 
     def have 
         @items_counts = Have.group(:item_id).order('count_id desc').limit(10).count(:id) 
         keys_to_item!(@items_counts) 
     end 
      
     def want 
         @items_counts = Want.group(:item_id).order('count_id desc').limit(10).count(:id) 
         keys_to_item!(@items_counts) 
     end 
      
     private 
      
     def keys_to_item!(hash) 
         hash.transform_keys!{ |key| Item.find(key) } 
     end 
end

