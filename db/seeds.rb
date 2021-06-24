cats = [
  {
    name: 'Cat',
    age: 4,
    enjoys: 'eating.'
  },
  {
    name: 'Parsely',
    age: 10,
    enjoys: 'Eating a lot.'
  },
]

cats.each do |attributes|
  Cat.create attributes
  puts "creating cat #{attributes}"
end
