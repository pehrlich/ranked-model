# http://stackoverflow.com/questions/1528868/rails-rspec-with-multiple-databases
require 'active_record'
require 'pg'
require 'logger'

ROOT = File.join(File.dirname(__FILE__), '..')

module Postgres
  class Base < ActiveRecord::Base

  end
  class Schema < ActiveRecord::Schema

  end
end

Postgres::Base.logger = Logger.new('tmp/ar_debug.log')
Postgres::Base.configurations = YAML::load(IO.read('spec/support/database.yml'))
Postgres::Base.establish_connection('development')

Postgres::Schema.define :version => 0 do
  create_table :order_ducks, :force => true do |t|
    t.string :name
    t.integer :order
  end
end


class OrderDuck < ActiveRecord::Base

  include RankedModel
  ranks :order

end
