require "open-uri"

puts 'deleting'
Rental.destroy_all
Art.destroy_all
User.destroy_all

puts 'creating 4 users'

miguel = User.create!(username: 'Migas', first_name: 'Miguel', last_name: 'Angelo', address: 'under the bridge', phone_number: '9171171717', details: 'Art is my true passion', email: 'm@gmail.com', password:'123456')
grigory = User.create!(username: 'Grig', first_name: 'Grigory', last_name: 'Zed', address: 'mother russia', phone_number: '9642312443', details: 'I Love art, but i cant stand it', email: 'g@gmail.com', password:'123456')
stefan = User.create!(username: 'stevespiders', first_name: 'Stefan', last_name: 'Sideris', address: '808 Carolina Beach Avenue s, Carolina Beach, NC', phone_number: '555999', details: 'Im an avid art lover', email: 's@gmail.com', password:'123456')
diogo = User.create!(username: 'DMan', first_name: 'Diogo', last_name: 'Bastos', address: 'Lisbon', phone_number: '555999', details: 'Art is my passion. Renting it is my business', email: 'd@gmail.com', password:'123456')

puts "creating 8 pieces of art"

guernica = URI.open("https://images2.minutemediacdn.com/image/upload/c_fill,g_auto,h_1248,w_2220/f_auto,q_auto,w_1100/v1555443607/shape/mentalfloss/98645794uhye.png")
picasso_guernica = Art.new(name: "Guernica", style: "painting", era: "modern", artist: "Pablo Picasso", price: 14987324, description: "The bull and the horse are important characters in Spanish culture", address: "Madrid", available: true)
picasso_guernica.photo.attach(io: guernica, filename: 'guernica.png', content_type: 'image/png')
picasso_guernica.user = grigory
picasso_guernica.save

saturn = URI.open("https://static.boredpanda.com/blog/wp-content/uploads/2019/11/Interesting-Stories-Behind-Famous-Masterpieces-5dcd877bc6b97__880.jpg")
goya_saturn = Art.new(name: "Saturn Devouring His Son", style: "painting", era: "renaissance", artist: "Francisco Goya", price: 5466324, description: "Depicts the Greek myth of the Titan Cronus (Romanized to Saturn)", address: "Madrid", available: true)
goya_saturn.photo.attach(io: saturn, filename: 'guernica.jpg', content_type: 'image/jpg')
goya_saturn.user = grigory
goya_saturn.save

madonna = URI.open("https://www.touristspots.org/wp-content/uploads/2011/08/Madonna-of-Bruges.jpg")
madonna_michelangelo = Art.new(name: "Madonna of Bruges", style: "sculpture", era: "renaissance", artist: "Michelangelo", price: 9498734, description: "The Madonna of the Steps is Michelangelo's earliest known work in marble. It is carved in shallow relief, a technique often employed by the master-sculptor of the early 15th century, Donatello, and others such as Desiderio da Settignano.[74] While the Madonna is in profile, the easiest aspect for a shallow relief, the child displays a twisting motion that was to become characteristic of Michelangelo's work", address: "Bruges", available: true)
madonna_michelangelo.photo.attach(io: madonna, filename: 'madonna.jpg', content_type: 'image/jpg')
madonna_michelangelo.user = diogo
madonna_michelangelo.save

tapete = URI.open("https://d1u4v68pfiv879.cloudfront.net/media/15208/tapetes-arraiolos.jpg")
tapete_arraiolos = Art.new(name: "Sitio do chulé", style: "tapestry", era: "comtemporary", artist: "Zé Carias", price: 5, description: "A piece where Zé Carias inspiration had no limits", address: "Arraiolos", available: true)
tapete_arraiolos.photo.attach(io: tapete, filename: 'tapete.jpg', content_type: 'image/jpg')
tapete_arraiolos.user = miguel
tapete_arraiolos.save

vangoh_file = URI.open('https://static.boredpanda.com/blog/wp-content/uploads/2019/11/Interesting-Stories-Behind-Famous-Masterpieces-5dcd8d865681c__880.jpg')
vangoh = Art.new(name: "Starry Night", style: "painting", era: "renessaince", artist: "Vincent Van Gogh", price: 30000, description: "In the aftermath of a mental breakdown that resulted in the self-mutilation of his left ear, Van Gogh voluntarily admitted himself to the Saint-Paul-de-Mausole lunatic asylum in 1889. During this period, he produced some of the best-known works of his career, including \"Irises\" and the blue self-portrait. \'The Starry Night\' shows the view from the east-facing window of his room at the asylum just before sunrise, with the addition of an idyllic village.", address: "New York", available: true )
vangoh.photo.attach(io: vangoh_file, filename: 'starrynight.jpg', content_type: 'image/jpg')
vangoh.user = diogo
vangoh.save

edvard_file = URI.open('https://static.boredpanda.com/blog/wp-content/uploads/2019/11/Interesting-Stories-Behind-Famous-Masterpieces-5dcd8d49dec85__880.jpg')
edvard = Art.new(name: "The Scream", style: "painting", era: "classic", artist: "Edvard Munch", price: 650, description: "Munch was out for a walk at sunset when the setting sunlight turned the clouds a blood red. He sensed as he put it, an “infinite scream passing through nature.” It has been suggested a volcanic eruption could have attributed to the unnaturally orange sky. Another explanation could have been the result of Munch’s emotional state, as his sister had very recently been committed to a lunatic asylum. Munch created four versions in paint and pastels, as well as a lithograph stone from which several prints survive. Both of the painted versions have been stolen and recovered. One of the pastel versions commanded the fourth highest nominal price paid for a painting at a public auction.", address: "Oslo", available: true)
edvard.photo.attach(io: edvard_file, filename: 'edvard.jpg', content_type: 'image/jpg')
edvard.user = miguel
edvard.save

katsushika_file = URI.open('https://static.boredpanda.com/blog/wp-content/uploads/2019/11/Interesting-Stories-Behind-Famous-Masterpieces-5dcd88b7582fe__880.jpg')
katsushika = Art.new(name: "The Great Wave Off Kanagawa", style: "painting", era: "classic", artist: "Katsushika Hokusai", price: 25000, description: "The composition comprises three main elements: the sea whipped up by a storm, three boats, and a mountain. The mountain with a snow-capped peak is Mount Fuji, which in Japan is considered sacred and a symbol of national identity, as well as a symbol of beauty. Using the boats, with their thirty passengers, as a reference, we can see the wave must be close to 12 meters tall. The wave, which curls around like a claw to frame Mount Fuji, shows the artist’s awe and fear of the unpredictable sea.", address: "Yokohama", available: true)
katsushika.photo.attach(io: katsushika_file, filename: 'kanagawa.jpg', content_type: 'image/jpg')
katsushika.user = stefan
katsushika.save

coolidge_file = URI.open('https://static.boredpanda.com/blog/wp-content/uploads/2019/11/Interesting-Stories-Behind-Famous-Masterpieces-5dcd879f945f3__880.jpg')
coolidge = Art.new(name: "A Friend In Need", style: "painting", era: "new age", artist: "Cassius Marcellus Coolidge", price: 1299, description: "'A Friend in Need' is the most popular painting of the 'Dogs Playing Poker' series by Cassius Marcellus Coolidge. The series was originally commissioned by Brown & Bigelow to advertise cigars. All eighteen paintings featuring anthropomorphized dogs, with eleven depicting card games. While Coolidge’s paintings were never considered genuine art by critics, they have since become iconic, with the first of the series, 'Poker Game', recently selling at Sotheby’s for $658,000.", address: "Los Angeles", available: true)
coolidge.photo.attach(io: coolidge_file, filename: 'coolidge.jpg', content_type: 'image/jpg')
coolidge.user = stefan
coolidge.save

wassily_file = URI.open('https://static.boredpanda.com/blog/wp-content/uploads/2019/11/Interesting-Stories-Behind-Famous-Masterpieces-5dcd87e091d1b__880.jpg')
wassily = Art.new(name: "Composition Viii", style: "painting", era: "modern", artist: "Wassily Kandinsky", price: 750, description: "Kandinsky had been fascinated with color from an early age, considering it to have transcendental properties. The artist wished to explore an interrelation between sound and color in the same way a musician composes a song. The use of circles, grids, rectangles, semicircles, triangles and other mathematical forms in the artwork is consistent with the painter's belief in the mystical properties of geometric shapes while the colors were chosen for their emotional impact.", address: "New York", available: true)
wassily.photo.attach(io: wassily_file, filename: 'wassily.jpg', content_type: 'image/jpg')
wassily.user = stefan
wassily.save

george_file = URI.open('https://static.boredpanda.com/blog/wp-content/uploads/2019/11/Interesting-Stories-Behind-Famous-Masterpieces-5dcd889835b86__880.jpg')
george = Art.new(name: "Stag Night At Sharkeys", style: "painting", era: "modern", artist: "George Wesley Bellows", price: 250, description: "'Stag at Sharkey's' depicts two boxers fighting in the private athletic club situated across from Bellow’s studio. Participants were usually members, but occasionally outsiders, known as “stags,” would get a temporary membership and fight. The piece is part of the Ashcan School movement, known for depicting daily life in early twentieth-century New York, usually in the poorer neighborhoods. Bellows used quick strokes to create a blurred image of two fighters in motion. He chose a low point of view to put the viewer among the crowd watching the fight.", address: "New York", available: true)
george.photo.attach(io: george_file, filename: 'george.jpg', content_type: 'image/jpg')
george.user = stefan
george.save

jean_file = URI.open('https://static.boredpanda.com/blog/wp-content/uploads/2019/11/Interesting-Stories-Behind-Famous-Masterpieces-5dcd86bcc0754__880.jpg')
jean = Art.new(name: "The Bath", style: "painting", era: "modern", artist: "Jean-Léon Gérôme", price: 345, description: "Gérôme’s European prejudices are undeniable in the dynamic between the two figures in 'The Bath'. The paler female nude, which Gérôme clearly based upon European women, is attended to by a darker-skinned slave. Setting up a hierarchy of skin tone. The paler woman is to be objectified, while the woman of color takes on a submissive role. Since there was no way for Gérôme to have been allowed in these very private female spaces, it can be assumed this piece reflects the artist’s own prejudices.", address: "New York", available: true)
jean.photo.attach(io: jean_file, filename: 'jean.jpg', content_type: 'image/jpg')
jean.user = miguel
jean.save

jim_file = URI.open('http://jimcarreyonline.com/images/albums/art/sculpture007.jpg')
jim = Art.new(name: "Ayla", style: "sculpture", era: "modern", artist: "Jim Carrey", price: 10234, description: "'Ayla' is a representation of true love, a big creation by Jim in bronze and when an observant fan defined the name that Jim gave to his statue, we end up finding more than we originally thought. 'Ayla' is a Turkish name meaning 'halo of light around the moon (and in some cases the sun)' and a Hebrew name meaning 'oak tree'.", address: 'New York', available: true)
jim.photo.attach(io: jim_file, filename: 'jim.jpg', content_type: 'image/jpg')
jim.user = miguel
jim.save



puts 'done 😄'
