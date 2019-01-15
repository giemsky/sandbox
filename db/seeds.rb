# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[
    {name: 'English', iso_code: 'en-GB'},
    {name: 'Polish', iso_code: 'pl-PL'},
    {name: 'German', iso_code: 'de-DE'},
    {name: 'Portuguese', iso_code: 'pt-PT'},
    {name: 'Bulgarian', iso_code: 'bg-BG'},
    {name: 'French', iso_code: 'fr-FR' }
].each do |lang_attrs|
  Orders::Language.create!(lang_attrs)
end