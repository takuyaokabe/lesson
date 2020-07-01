class BooksController < ApplicationController
  def top
  end

#ここから上は触る必要がない
#⓵indexアクションはtop.html.erbのリンク(books_path)を経てindex.html.erbを経由し下記indexアクションで空の
#インスタンス変数である@bookを受け取りCreate Bookを押すことによりcreateアクションへ飛ぼうとしている。現状ボタンを押すと
#Unknown actionエラーが出ることからpostメソッドによってcreateアクションへ飛んでいることは間違いない。
    def index
  		@book =Book.new
  		@books = Book.all
    end
#下記のredirect_toのあとの部分を"books_pathに変えたところまた表示できませんとエラーになった。私はgetメソッドindexアクションへ飛ぶと思っていたが、
#おそらくpostメソッドでcreateメソッドに飛びまた帰ってきてまた帰ってきてと無限ループにはまっているからと思われる。"/"を入れたときは素直にトップへ戻った。"
 #(blog.id)入れたけど不要なら捨て
    def create
  	    @book = Book.new(book_params)
  	    if @book.save
  	    	flash[:notice] = "Book was successfully created"
		    redirect_to book_path(@book.id)
  	    else
  	    	@books = Book.all
  	    	render action: :index
    end
end

  def show
  	    @books = Book.find(params[:id])
  end
#create bookを押して画面が移動してtitleとbody、他editやbackがあるnew.html.erbに飛ぶ。その際に下の@bookを取り込み表示させるが、
#どのように記載すれば1ケのidを元に記載されるかわからない。とにかく何かを入れないとからのまま。.find(params[:id])入れる？
 
  def edit
  	  @books = Book.find(params[:id])
  end
  #とりあえず前に先生に作ってもらったのには書いてあったからupdateアクション作った。不要なら消す
  def update
  	  book = Book.find(params[:id])
      if book.update(book_params)
      	flash[:notice] = "Book was successfully created"
      redirect_to book_path(book)
  end
  end
  def destroy
  	book =Book.find(params[:id])
  	book.destroy
  	redirect_to books_path
  end

   private
   
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
