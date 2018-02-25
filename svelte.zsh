alias sv='svelte'

# The --format iife bit means 'generate an immediately-invoked function expression'
alias iife='svelte compile --format iife'
# – this allows us to use the component as a simple <script> tag.
# (By default, Svelte will create a JavaScript module instead, which is 
# recommended for more serious applications but requires additional steps.)

