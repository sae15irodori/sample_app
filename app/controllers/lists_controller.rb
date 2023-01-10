class ListsController < ApplicationController
  def new
    #インスタンス変数.これをビューで指定すれば入力フォーム生成される
    @list = List.new
  end

   #createアクション追加（データ保存するためのアクション）
  def create
    #手順１＆２（フォームに入力したデータを受け取るインスタンスを生成）
    #ビューファイルへの受け渡し不要だからローカル変数使ってる
    #変数istにList.newを格納。list_paramsはストロングパラメータのメソッド名
    list = List.new(list_params)

    #手順３dbに保存 (listインスタンスをdbに保存)
    list.save

   #手順４トップ画面へリダイレクト
    redirect_to list_path(list.id)
  end #createアクションの定義終了

  def index
    @lists = List.all  #DBのレコード全てを取得する
  end

  def show
    @list = List.find(params[:id])  #レコード１件だけ取得するからインスタンス変数は単数
    #Lstモデルから探す、フォーム入力して保存したデータのうち、URlで指定したidのレコードを
  end

  def edit
    @list =List.find(params[:id])  #保存したデータのうち、編集したいデータを探す（データはidで指定する）
  end
  
  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end

  private
  #ストロングパラメータ
  #paramsはformから送られてくるデータ
  #requireは送られてきたデータの中からモデル名を指定してデータ絞り込む
  #permitはrequireで絞り込んだデータから、保存許可するカラムを指定する
  def list_params
   params.require(:list).permit(:title, :body)
    #formからのデータの内、保存するモデルは(listモデル).
    #保存するカラムは(titleとbody)
    #リストモデルの、タイトルと本文をｄｂに保存する
  end
end