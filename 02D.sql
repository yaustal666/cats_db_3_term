SELECT Value,
       iif(Value < 0, 'negative', iif(Value = 0, 'zero', 'positive')) AS Classification
       FROM Numbers;