require "sinatra"
require "sqlite3"

$db = SQLite3::Database.new "data.db"

get "/" do
	rows = $db.execute "SELECT * FROM notes"
	notes = rows.map do |row|
		{
			id:row[0],
			title:row[1],
			text:row[2],
		}
	end
	
	erb :index,locals:{ notes:notes }
end

get "/new" do
	erb :new
end

post "/new" do
	title = params[:title]
	text = params[:text]

	$db.execute "INSERT INTO notes (title,text) VALUES (?,?)",[title,text]

	redirect "/new"
end
