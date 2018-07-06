require_relative 'features/support/api_helper'
require 'json'

job_name = ARGV[0]
job_number = ARGV[1]
job_build_url = ARGV[2]

thumbnail = { 'url' => 'https://imgflip.com/s/meme/Leonardo-Dicaprio-Cheers.jpg' }

fields = []

fields.push({'name' => 'Autors', 'value' => 'Reinis'})
fields.push({'name' => 'Mērķis', 'value' => 'Rest kurss'})
fields.push({'name' => 'Job', 'value' => job_name})
fields.push({'name' => 'Build number', 'value' => job_number})
fields.push({'name' => 'Build URL', 'value' => job_build_url})

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