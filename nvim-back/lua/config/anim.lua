require('mini.animate').setup({
  -- Disable everything except scroll
  cursor = {
    enable = false,
  },
  
  scroll = {
    enable = true,
    -- Timing of scroll animation (in ms)
    timing = require('mini.animate').gen_timing.linear({ duration = 150, unit = 'total' }),
  },
  
  resize = {
    enable = true,
  },
  
  open = {
    enable = true,
  },
  
  close = {
    enable = true,
  },
})
