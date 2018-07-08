require_relative 'features/support/api_helper'
require 'json'

job_name = ARGV[0]
job_number = ARGV[1]
job_build_url = ARGV[2].to_s + 'cucumber-html-reports/overview-features.html'

report_file = File.read('report.json')
report_hash = JSON.parse(report_file)

passedCountPassed = 0
passedCountFailed = 0

report_hash.each do |report_hash|
  report_hash['elements'].first['steps'].last["result"]["status"] = 'passed'
  passedCountPassed = passedCountPassed + 1
end

report_hash.each do |report_hash|
  report_hash['elements'].first['steps'].last["result"]["status"] = 'failed'
  passedCountFailed = passedCountFailed + 1
end

thumbnail = { 'url' => 'https://imgflip.com/s/meme/Leonardo-Dicaprio-Cheers.jpg' }

fields = []

fields.push({'name' => 'Autors', 'value' => 'Reinis'})
fields.push({'name' => 'Mērķis', 'value' => 'Rest kurss'})
fields.push({'name' => 'Job', 'value' => job_name})
fields.push({'name' => 'Build number', 'value' => job_number})
fields.push({'name' => 'Build URL', 'value' => job_build_url})
fields.push({'name' => 'Passed', 'value' => passedCountPassed})
fields.push({'name' => 'Failed', 'value' => passedCountFailed})

embed = []

embed.push('title' => 'Test title',
           'color' => 16007746,
           'thumbnail' => thumbnail,
           'fields' => fields)

payload = {
    'content' => 'Reinis Podkalns',
    'embeds' => embed
}.to_json

API.post('https://discordapp.com/api/webhooks/463594672992944129/lOA4rGJdI91Q7pp8CcHbAWhfbRLUAunFSlVcO6A11AmmgvzlpHopLk-3xIt116Ef1k06',
         headers: {'Content-Type' => 'application/json'},
         cookies: {},
         payload: payload)