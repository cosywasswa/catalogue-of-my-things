require_relative 'label'
require_relative 'book'
require_relative '../menu'
require 'json'

class BookDetails
  attr_accessor :books

  def initialize
    @books = []
    load_data_from_json
    load_labels_from_json
  end

  def display_options
    loop do
      puts ''
      puts 'Welcome to our catalog of books! Please select an option by entering a number:'
      puts '1. Add book'
      puts '2. List all books'
      puts '3. List labels'
      puts '4. Exit'

      choice = gets.chomp.to_i

      case choice
      when 1
        add_a_book
      when 2
        list_all_books
      when 3
        list_labels
      when 4
        break
      else
        puts 'Invalid choice. Please try again.'
      end
    end
  end

  def add_a_book
    puts ''
    puts 'Enter book title: '
    title = gets.chomp

    puts ''
    puts 'Enter publisher: '
    publisher = gets.chomp

    puts ''
    puts 'Enter cover state (good/bad/average): '
    cover_state = gets.chomp.downcase

    puts ''
    puts 'Enter publish date (YYYY-MM-DD): '
    publish_date = gets.chomp

    puts ''
    puts 'Enter Label color '
    color = gets.chomp.downcase

    book = Book.new(title, publisher, cover_state: cover_state, publish_date: publish_date)
    label = Label.new(title, color)
    label.add_item(book)
    book.label = label

    @books.reject! { |item| item.title == title }
    @books << book
    @books << label

    save_data_to_json
    save_labels_to_json
    puts "Added #{book.title} to your catalog."
  end

  def list_all_books
    if @books.empty?
      puts 'You have no books in your catalog.'
    else
      @books.each do |item|
        next if item.is_a?(Label) || !item.is_a?(Book)

        puts "publisher: #{item.publisher}, cover state: #{item.cover_state}, publish date: #{item.publish_date}"
      end
    end
  end

  def list_labels
    labels = @books.select { |item| item.is_a?(Label) }.uniq
    if labels.empty?
      puts 'You have no labels in your catalog.'
    else
      labels.each do |label|
        print "'#{label.title}', '#{label.color}'"
        puts ''
      end
    end
  end

  private

  def save_data_to_json
    File.write('./DATABASE/books.json', JSON.pretty_generate(@books.map(&:to_json)))
  end

  def save_labels_to_json
    labels = @books.select { |item| item.is_a?(Label) }.uniq
    labels_data = labels.map(&:to_json)
    File.write('./DATABASE/labels.json', JSON.pretty_generate(labels_data))
  end

  def load_data_from_json
    return unless File.exist?('./DATABASE/books.json')

    books_file = File.read('./DATABASE/books.json')
    if books_file.empty?
      puts 'Book data file is empty.'
    else
      books_data = JSON.parse(books_file)
      @books.clear
      books_data.each do |book|
        @books << Book.from_json(book)
      end
    end
    # else
    #   puts 'No book data file found.'
  end

  def load_labels_from_json
    return unless File.exist?('./DATABASE/labels.json')

    labels_file = File.read('./DATABASE/labels.json')
    if labels_file.empty?
      puts 'Label data file is empty.'
    else
      labels_data = JSON.parse(labels_file)
      labels_data.each do |label|
        @books << Label.from_json(label)
      end
    end
    # else
    #   puts 'No label data file found.'
  end
end
