cats = [
  {
    name: 'Cat',
    age: 4,
    enjoys: 'Eating a lot.'
  },
  {
    name: 'Parsely',
    age: 10,
    enjoys: 'Eating a lot.'
  },
  {
    name: 'Chicken',
    age: 4,
    enjoys: 'Eating a lot.'
  },
  {
    name: 'Basil',
    age: 4,
    enjoys: 'Eating a lot.'
  },
]

cats.each do |attributes|
  Cat.create attributes
  puts "creating cat #{attributes}"
end
