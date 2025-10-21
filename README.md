# Notes

this tool allows to you create notes and see them in terminal or in web interface

## Features
- command line interface
- web interface
- easy to use

## Requirements
- ruby
- sqlite3 gem
- sinatra gem

## Installation
```bash
git clone https://github.com/an1sx7/notes
cd notes
chmod +x main.rb

## Usage

### New Note
```bash
./main.rb new-note <title> <text>

### Show Notes
```bash
./main.rb notes-list

### Web Interface
```bash
./main.rb run-server

### Usage Example
```bash
./main.rb new-note "my note" "my first note"
