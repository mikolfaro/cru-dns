# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Record::A.create! [
                    {name: 'mikolfaro.eu', value: '79.137.73.217', ttl_seconds: 28800},
                    {name: 'mail.mikolfaro.eu', value: '	79.137.73.217', ttl_seconds: 28800}
                  ]
