#!/usr/bin/env ruby

require './lib/pdc'

def main
  PDC.configure do |config|
    config.site = 'https://pdc.engineering.redhat.com'
    config.log_level = :debug
    config.disable_caching = true
  end

  mapping = PDC::V1::ReleaseRpmMapping.where(
    release_id: 'rhceph-2.1@rhel-7', package: 'ceph'
  ).first
  puts mapping.mapping
end

main if $PROGRAM_NAME == __FILE__
