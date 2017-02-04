require 'pry'

class SiteGenerator

  attr_accessor :rendered_path

  def initialize(path)
    @rendered_path = path
  end

  def build_index
    erb = ERB.new(File.read("app/views/index.html.erb"))

    File.open("tmp/_site/index.html", "w") do |f|  
        document = erb.result(binding)
        f.write(document)
    end
  end

  def build_artists_index
    erb = ERB.new(File.read("app/views/artists/index.html.erb"))

    File.open("tmp/_site/artists/index.html", "w") do |f|  
        document = erb.result(binding)
        f.write(document)
    end
  end

  def build_artist_page
    erb = ERB.new(File.read("app/views/artists/show.html.erb"))
    Artist.all.each do |artist|
      File.open("tmp/_site/artists/#{artist.to_slug}.html", "w") do |f|  
          @artist = artist
          document = erb.result(binding)
          f.write(document)
      end
    end
  end

  def build_genres_index
    erb = ERB.new(File.read("app/views/genres/index.html.erb"))

    File.open("tmp/_site/genres/index.html", "w") do |f|  
        document = erb.result(binding)
        f.write(document)
    end
  end

  def build_genre_page
    erb = ERB.new(File.read("app/views/genres/show.html.erb"))
    Genre.all.each do |genre|
      @genre = genre
      File.open("tmp/_site/genres/#{genre.to_slug}.html", "w") do |f|  
          document = erb.result(binding)
          f.write(document)
      end
    end
  end

  def build_songs_index
    erb = ERB.new(File.read("app/views/songs/index.html.erb"))

    File.open("tmp/_site/songs/index.html", "w") do |f|  
        document = erb.result(binding)
        f.write(document)
    end
  end

  def build_song_page
    erb = ERB.new(File.read("app/views/songs/show.html.erb"))
    Song.all.each do |song|
      @song = song
      File.open("tmp/_site/songs/#{song.to_slug}.html", "w") do |f|  
          document = erb.result(binding)
          f.write(document)
      end
    end
  end



end
