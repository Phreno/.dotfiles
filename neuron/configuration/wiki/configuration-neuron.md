
Customization neuron
: https://neuron.zettel.page/custom-head 


## chartjs

Documentation
: https://neuron.zettel.page/chartjs
```chartjs
{
  "type": "bar",
  "data": {
    "labels": [
      "January",
      "February",
      "March",
      "April"
    ],
    "datasets": [
      {
        "label": "Bar Dataset",
        "data": [
          10,
          20,
          30,
          40
        ],
        "borderColor": "rgb(255, 99, 132)",
        "backgroundColor": "rgba(255, 99, 132, 0.2)"
      },
      {
        "label": "Line Dataset",
        "data": [
          50,
          50,
          50,
          50
        ],
        "type": "line",
        "fill": false,
        "borderColor": "rgb(54, 162, 235)"
      }
    ]
  },
  "options": {
    "scales": {
      "yAxes": [
        {
          "ticks": {
            "beginAtZero": true
          }
        }
      ]
    }
  }
}
```

## Mermaid

Documentation
: https://neuron.zettel.page/mermaid

```{.mermaid}
sequenceDiagram
    Alice->>John: Hello John, how are you?
    activate John
    John-->>Alice: Great!
    deactivate John
```

## Tailwind

Documentation
: https://neuron.zettel.page/tailwind

## Highlights of the day:

:::{.rounded .shadow-2xl .border-2 .border-solid .border-pink-400 .text-xl .mb-4}
- Drank a [new]{.my-highlight} type of *coffee*
- Hacked a new feature to my pet project
- Enjoyed doing nothing in particular
:::

Random bits:
- These are not styled like the above div.

