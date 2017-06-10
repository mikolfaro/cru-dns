# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Record::A.create! [
                    {name: 'mikolfaro.eu', value: '79.137.73.217', ttl_seconds: 28800, active: true},
                    {name: 'mail.mikolfaro.eu', value: '79.137.73.217', ttl_seconds: 28800, active: false}
                  ]

Record::MX.create! [
                     {
                       name: 'mikolfaro.eu', value: 'mail.mikolfaro.eu',
                       ttl_seconds: 28800, active: true, priority: 0
                     },
                     {
                       name: 'mikolfaro.eu', value: 'us2.mx1.mailhostbox.com',
                       ttl_seconds: 28800, active: true, priority: 100
                     }
                   ]

Replica.create! ip: '127.0.0.1',
                api_token: 'secret_token'
