require 'find'

module SimpleTest
  module Runner

    def self.run
      files.each do |file|
        add_dir_to_load_path(file)
        process_file(file)
      end
      Object.run
    end

    private
    def self.files
      filesnames = []
      ARGV.each do |arg|
        Find.find(arg) { |path| filesnames << path if File.file?(path) }
      end
      filesnames
    end

    def self.process_file(file)
      add_dir_to_load_path(file)
      eval(File.read(file))
    end

    def self.file_full_path(file)
      File.dirname(File.expand_path(file))
    end

    def self.add_dir_to_load_path(file)
      path = file_full_path(file)
      $LOAD_PATH.unshift(path) unless $LOAD_PATH.include?(path)
    end
  end
end
