class ListsController < ApplicationController
  def new
    #インスタンス変数これをビューで指定すれば入力フォーム生成される
    @list = List.new
  end
  
  def create #createアクション追加（データ保存するためのアクション）
    #手順１＆２（フォームに入力したデータを受け取るインスタンス）
    
    list = List.new(list_params)
    
    #手順３dbに保存 (listインスタンスをdbに保存)
    list.save
    
  　#手順４トップ画面へリダイレクト
  　reairect_to '\top'
  　
  end

  def index
  end

  def show
  end

  def edit
  end
end
