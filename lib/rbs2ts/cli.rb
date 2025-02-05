require "thor"
require "rbs2ts/converter"
  
module Rbs2ts 
  class Cli < Thor
    desc "convert rbs to ts", "convert rbs to ts"
    def convert(path)
      loader = ::RBS::EnvironmentLoader.new(core_root: nil)

      loader.add(path: Pathname(path))

      env = ::RBS::Environment.from_loader(loader).resolve_type_names

      Converter::Declarations::Declarations.new(env.declarations).to_ts
    end
  end
end
