BEGIN;

INSERT INTO categories (name) VALUES
  ('Breakfast'),
  ('Lunch'),
  ('Dinner'),
  ('Dessert'),
  ('Vegetarian'),
  ('Quick & Easy')
ON CONFLICT (name) DO NOTHING;

-- Helper: fetch category ids by name in inserts via subqueries.

INSERT INTO recipes (title, description, image_url, category_id, ingredients, instructions)
VALUES
(
  'Blueberry Oat Pancakes',
  'Fluffy pancakes with oats and blueberries—great for a weekend breakfast.',
  'https://images.unsplash.com/photo-1495214783159-3503fd1b572d?auto=format&fit=crop&w=1200&q=80',
  (SELECT id FROM categories WHERE name='Breakfast'),
  ARRAY['1 cup flour','1/2 cup rolled oats','2 tsp baking powder','1 tbsp sugar','1 cup milk','1 egg','1 cup blueberries','Pinch of salt'],
  ARRAY[
    'Mix dry ingredients in a bowl.',
    'Whisk milk and egg, then combine with dry mix.',
    'Fold in blueberries.',
    'Cook on a lightly oiled skillet 2–3 minutes per side.'
  ]
),
(
  'Chickpea Salad Wrap',
  'A protein-packed wrap with a tangy chickpea salad and crunchy veggies.',
  'https://images.unsplash.com/photo-1526318896980-cf78c088247c?auto=format&fit=crop&w=1200&q=80',
  (SELECT id FROM categories WHERE name='Lunch'),
  ARRAY['1 can chickpeas','2 tbsp mayo or yogurt','1 tsp mustard','1 tbsp lemon juice','Salt','Pepper','Tortillas','Lettuce','Tomato'],
  ARRAY[
    'Mash chickpeas lightly with a fork.',
    'Stir in mayo (or yogurt), mustard, and lemon juice.',
    'Season with salt and pepper.',
    'Assemble wrap with lettuce and tomato; add chickpea mixture and roll.'
  ]
),
(
  'Garlic Butter Pasta',
  'Fast, comforting pasta with garlic butter and a bright squeeze of lemon.',
  'https://images.unsplash.com/photo-1523986371872-9d3ba2e2f642?auto=format&fit=crop&w=1200&q=80',
  (SELECT id FROM categories WHERE name='Quick & Easy'),
  ARRAY['200g pasta','3 tbsp butter','3 cloves garlic','1/2 lemon','Salt','Black pepper','Parsley (optional)'],
  ARRAY[
    'Boil pasta in salted water until al dente; reserve a splash of water.',
    'Melt butter and sauté garlic 30–60 seconds.',
    'Add pasta, toss with a splash of pasta water.',
    'Finish with lemon juice, pepper, and parsley.'
  ]
),
(
  'Sheet Pan Roasted Veggies',
  'Colorful roasted vegetables with a simple herb seasoning.',
  'https://images.unsplash.com/photo-1529692236671-f1f6cf9683ba?auto=format&fit=crop&w=1200&q=80',
  (SELECT id FROM categories WHERE name='Vegetarian'),
  ARRAY['Broccoli','Bell peppers','Zucchini','Red onion','Olive oil','Salt','Pepper','Italian herbs'],
  ARRAY[
    'Preheat oven to 220°C / 425°F.',
    'Chop vegetables and place on a sheet pan.',
    'Toss with olive oil, salt, pepper, and herbs.',
    'Roast 18–25 minutes, flipping once.'
  ]
),
(
  'Classic Chocolate Mousse',
  'Rich, airy chocolate mousse with just a handful of ingredients.',
  'https://images.unsplash.com/photo-1541592106381-b31e9677c0e5?auto=format&fit=crop&w=1200&q=80',
  (SELECT id FROM categories WHERE name='Dessert'),
  ARRAY['200g dark chocolate','3 eggs','2 tbsp sugar','1 cup heavy cream','Pinch of salt'],
  ARRAY[
    'Melt chocolate and cool slightly.',
    'Separate eggs; whisk yolks into chocolate.',
    'Whip cream to soft peaks.',
    'Whisk egg whites with sugar to stiff peaks.',
    'Fold cream and whites into chocolate mixture; chill 2 hours.'
  ]
);

COMMIT;
