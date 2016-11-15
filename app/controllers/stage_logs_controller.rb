class StageLogsController < ApplicationController
  def create
    if params[:isbn]
      @item = Item.find_or_initialize_by(isbn: params[:isbn])
        if @item.new_record?
             
            res =  Amazon::Ecs.item_search(
                   params[:isbn],
                   search_index:  'Books',
                   IdType: 'ISBN',
                  dataType: 'script',
                  response_group: 'ItemAttributes, Images',
                  country:  'jp',
                  power: "Not kindle"
                  )
             
            res.items.each do |item|
              @item.isbn                     = item.get('ItemAttributes/EAN')
              @item.title                    = item.get('ItemAttributes/Title')
              @item.large_image              = item.get('LargeImage/URL')
              @item.url                      = item.get('DetailPageURL')
              @item.publisher                = item.get('ItemAttributes/Manufacturer')
              @item.publish_date             = item.get('ItemAttributes/PublicationDate')
              @item.price                    = item.get('ItemAttributes/ListPrice/Amount')
              @item.genre                    = item.get('node')
              @item.author                   = item.get('ItemAttributes/Author')
              @item.stage                    = "staging"
              @item.save!
              current_user.staged(@item)
            
            end
           
          redirect_to new_item_path
        else
          if @item["stage"]  == "staging"
            flash[:notice] = 'already staging'
            redirect_to new_item_path
          else
            @item.update(stage: "staging" )
            current_user.staged(@item)
            redirect_to new_item_path
          end
        end
    end
  end
  
  def index
      @stage_logs = StageLog.all.order(created_at: :desc)
  end
  
end