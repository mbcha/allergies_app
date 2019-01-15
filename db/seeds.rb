require 'json'
require 'open-uri'
require 'nokogiri'

puts "Deleting Database..."

User.destroy_all
Language.destroy_all
Country.destroy_all
Allergy.destroy_all
Translation.destroy_all

puts "Adding User..."

user = User.create(
  username: "mee",
  email: "mee@gmail.com",
  password: "testing"
  )

puts "Adding Allergies..."

allergiesUrl = "http://research.bmh.manchester.ac.uk/informAll/allergenic-foods"

html_file_allergies = open(allergiesUrl).read
html_doc_allergies = Nokogiri::HTML(html_file_allergies)

html_doc_allergies.search('#content li a').each do |allergy|
  allergy_name = allergy.text.strip
  allergy_name.slice!(/ \(.+\)/)
  Allergy.create(name: allergy_name) if Allergy.find_by_name(allergy_name).nil?
end

Allergy.all.each do |allergy|
  name = allergy.name.split(' ')

  html_photos = open("https://unsplash.com/search/photos/#{name[0]}").read
  doc_photos = Nokogiri::HTML(html_photos)
  photo = doc_photos.search('._1pn7R').first

  unless photo.nil?
    url = photo.search('.yVU8k a img').first['src']

    allergy.update(remote_photo_url: url)
    allergy.save
  end
end

puts "Adding Languages..."

language_codes = []

languagesUrl = "https://translate.google.com/"

html_file_languages = open(languagesUrl).read
html_doc_languages = Nokogiri::HTML(html_file_languages)

languages_extract = html_doc_languages.search('body script').first

languages = languages_extract.text.strip.scan(/\[.*u\'\}\],t/)[0].scan(/\{([^\}]*)\}/).flatten

languages.each do |language|
  language_info = language.scan(/'([^']*)'/).flatten

  unless language_info[1] == "Detect language" || language_info[1] == "Esperanto"
    Language.create(
      code: language_info[0],
      name: language_info[1]
      )
  end

  language_codes << language_info[0]
end

puts "Adding Countries..."

names = []

language_codes.each do |code|
  code = "zh" if code == "zh-CN"

  begin
    url = "https://restcountries.eu/rest/v2/lang/#{code}"
    countries_serialized = open(url).read
    countries = JSON.parse(countries_serialized)
  rescue OpenURI::HTTPError => error
    response = error.io
    errorCode = response.status[0]
  end

  unless errorCode.to_i == 404
    countries.each do |country|
      country["name"].slice!(/ \(.+\)/)
      country_name = country["name"]

      existing_name = names.select{ |name| name.match(/^#{country_name}.*/)}

      if existing_name.empty?
        Country.create(
          name: country_name,
          language_code: code == "zh" ? "zh-CN" : code
          )
        names << country_name
      elsif existing_name.length > 1
        new_language = Language.find_by_code(code)
        Country.create(
          name: "#{country_name} (#{new_language.name})",
          language_code: code == "zh" ? "zh-CN" : code
          )
        names << "#{country_name} (#{new_language.name})"
      else
        existing_country = Country.find_by_name(existing_name[0])
        existing_language = Language.find_by_code(existing_country.language_code)
        new_language = Language.find_by_code(code)
        existing_country.update(name: "#{country_name} (#{existing_language.name})")
        Country.create(
          name: "#{country_name} (#{new_language.name})",
          language_code: code == "zh" ? "zh-CN" : code
          )
        names << "#{country_name} (#{existing_language.name})"
      end
    end
  end
end

puts "Done!"
