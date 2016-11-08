class ItemsController < ApplicationController
  def search
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
        itemz = {}
        itemz["title"] = item.get('ItemAttributes/Title')
          
        itemz["large_image"] =  item.get('LargeImage/URL')
        itemz["url"]  = item.get('DetailPageURL')
        @items << itemz
      end
    end
  end
end
