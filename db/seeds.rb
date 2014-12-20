# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

total_stories = 50
total_atoms = 250

# Seed the sections table
Section.delete_all
sec1 = Section.create!(name: 'Business & Economics')
sec2 = Section.create!(name: 'Government & Politics')
sec3 = Section.create!(name: 'Sports')
sec4 = Section.create!(name: 'Science')
sec5 = Section.create!(name: 'Environment')
sec6 = Section.create!(name: 'Arts & Entertainment')

# mass populate Stories through iteration

1.upto(total_stories) do |s|

  rand_sec_num = SecureRandom.random_number(6) + 1

  story = Story.create(subject: "Story ##{s} Subject", mast_url: "image1.jpg", thumb_url: "image1_thb.jpg", section_id: rand_sec_num)

end

# mass populate Atoms through iteration
# random images, random quotes
1.upto(total_atoms) do |a|

  rand_atom_type = SecureRandom.random_number(100) + 1
  lorem_length = SecureRandom.random_number(10) + 1

  if rand_atom_type <= 60 
  	# Make a content atom
  	atom = Atom.create(topic: "Topic ##{a}", content: Faker::Lorem.paragraph(1, false, lorem_length))
  elsif rand_atom_type <= 80 
  	# Make an image atom
  	atom = Atom.create(topic: "Topic ##{a}", content: Faker::Lorem.paragraph(1, false, lorem_length), img_url: "image1.jpg", img_caption: "Some image caption.", img_citation: "Reuters", img_location: "Venus" )
  else 
  	# Make a quote atom
  	atom = Atom.create(topic: "Topic ##{a}", content: Faker::Lorem.paragraph(1, false, lorem_length), quote: Faker::Lorem.paragraph(1, false, lorem_length), quoted_name: Faker::Name.name, quoted_title: Faker::Name.title, quoted_org: Faker::Company.name)
  end
end

# make chain associations
1.upto(total_stories) do |s|
  rand_num_chains = SecureRandom.random_number(8) + 1
  track_atoms = []

  1.upto(rand_num_chains) do |c|
    rand_atom_id = SecureRandom.random_number(total_atoms) + 1
    
    until !(track_atoms.include?(rand_atom_id))
      rand_atom_id = SecureRandom.random_number(total_atoms) + 1
    end

    track_atoms << rand_atom_id

    chain = Chain.create(story_id: s, atom_id: rand_atom_id, active: true, position: c)
  end
end

# loop through all Stories
# get a random number of story assocations from 1..8
# loop through the number of assocations
# get a random atom_id
# if the atom_id hasn't been choosen add it to a list
# if it has then loop and get a new atom_id
# chain that story to the atom_id