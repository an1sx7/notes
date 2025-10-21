#!/usr/bin/env ruby

require "sqlite3"

$db = SQLite3::Database.new "data.db"

$db.execute <<-SQL
	CREATE TABLE IF NOT EXISTS notes (
		id INTEGER PRIMARY KEY AUTOINCREMENT,
		title TEXT,
		text TEXT
	);
SQL

def create_note(title,text)
	$db.execute "INSERT INTO notes (title,text) VALUES (?,?)",[title,text]
	puts "note created successfully"
end

def run_server
	puts "running on http://127.0.0.1:4567"
	system(
		"ruby server.rb",
		out:File::NULL,
		err:File::NULL
	)
end

def notes_list
	rows = $db.execute "SELECT * FROM notes"
	rows.each do |row|
		puts "#{row[0]} | #{row[1]} | #{row[2]}"
	end
end

command = ARGV[0]

case command
	when "new-note"
		title = ARGV[1]
		text = ARGV[2]
		create_note(title,text)
	when "notes-list"
		notes_list()
	when "run-server"
		run_server()
end
