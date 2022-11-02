return {
  name = "consumer-referer",
  fields = {
    { config = {
      type = "record",
      fields = {
        { referers = {
            type = "array",
            elements = { type = "string", },
            required = true,
        }},
      }
    }}
  }
}