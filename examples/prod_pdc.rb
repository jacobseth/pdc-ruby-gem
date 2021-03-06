require './lib/pdc'
require 'ap'

def main
  PDC.configure do |config|
    config.site = 'https://pdc.engineering.redhat.com'
    config.log_level = :debug
  end

  releases = PDC::V1::Release.all!.to_a
  ap releases

  released_files = PDC::V1::ReleasedFile.all!.to_a
  ap released_files

  destinations = PDC::V1::MultiDestination.all!.to_a
  ap destinations

  cpes = PDC::V1::VariantCpe.all!.to_a
  ap cpes
end

main if $PROGRAM_NAME == __FILE__
