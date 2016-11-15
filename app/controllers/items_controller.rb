class ItemsController < ApplicationController
  def new
    if params[:keyword].present?
      #　デバックログ出力するために記述
      Amazon::Ecs.debug = true

      # Amazon::Ecs::Responceオブジェクトの取得
      res = Amazon::Ecs.item_search(
        params[:keyword],
        search_index:  'Books',
        dataType: 'script',
        response_group: 'ItemAttributes, Images',
        country:  'jp',
        power: "Not kindle"
      )

      # 本のタイトル,画像URL, 詳細ページURLの取得
      @items = []
      res.items.each do |item|
        items = {}
        items["title"] = item.get('ItemAttributes/Title')
          
        items["large_image"] =  item.get('LargeImage/URL')
        items["url"]  = item.get('DetailPageURL')
        items["isbn"]  = item.get('ItemAttributes/EAN')
        @items << items
      end
    end
    if params[:isbn]
      res = Amazon::Ecs.item_search(
        params[:isbn],
        search_index:  'Books',
        IdType: 'ISBN',
        dataType: 'script',
        response_group: 'ItemAttributes, Images',
        country:  'jp',
        power: "Not kindle"
      )
      # 本のタイトル,画像URL, 詳細ページURLの取得
      @items = []
      res.items.each do |item|
        items = {}
        items["title"] = item.get('ItemAttributes/Title')
        items["large_image"] =  item.get('LargeImage/URL')
        items["url"]  = item.get('DetailPageURL')
        items["isbn"]  = item.get('ItemAttributes/EAN')
        @items << items
      end
    end
  end
  
  def reject
      @item = Item.find(params[:id])
      @item.update(stage: nil )
      current_user.unstaged(@item)
      redirect_to root_url
  end
  
  def order
    
  end
  
  
  
end
